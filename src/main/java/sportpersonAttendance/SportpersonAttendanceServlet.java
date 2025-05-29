package sportpersonAttendance;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/sportpersonAttendance")
public class SportpersonAttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SportpersonAttendanceDAO attendanceDAO;

    public void init() {
        attendanceDAO = new SportpersonAttendanceDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "view"; // Default action
        }

        try {
            switch (action) {
                case "view":
                    showAttendanceForm(request, response);
                    break;
                case "save":
                    saveAttendance(request, response);
                    break;
                case "viewByDate":
                    viewAttendanceByDate(request, response);
                    break;
                default:
                    showAttendanceForm(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void showAttendanceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("sportpersonAttendance.jsp");
        dispatcher.forward(request, response);
    }

    private void saveAttendance(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String sportpersonid = request.getParameter("sportpersonid");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        // Parse the input date
        LocalDate attendanceDate = LocalDate.parse(date);
        LocalDate today = LocalDate.now();

        // Check if attendance date is in the future
        if (attendanceDate.isAfter(today)) {
            request.setAttribute("errorMessage", "Attendance cannot be recorded for future dates.");
            showAttendanceForm(request, response);
            return;
        }

        // Check for duplicate attendance
        boolean isDuplicate = attendanceDAO.checkDuplicateAttendance(sportpersonid, date);
        if (isDuplicate) {
            request.setAttribute("errorMessage", "Attendance for this coach on the selected date already exists.");
            showAttendanceForm(request, response);
            return;
        }

        // If no duplicate and date is valid, insert the attendance record
        SportpersonAttendance attendance = new SportpersonAttendance(sportpersonid, date, status);
        attendanceDAO.insertAttendance(attendance);
        response.sendRedirect("sportpersonAttendance?action=view");
    }

    private void viewAttendanceByDate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String date = request.getParameter("date");
        List<SportpersonAttendance> attendanceList = attendanceDAO.getAttendanceByDate(date);
        request.setAttribute("attendanceList", attendanceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sportpersonViewAttendance.jsp");
        dispatcher.forward(request, response);
    }
}
