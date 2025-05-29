package coachAttendance;

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

@WebServlet("/attendance")
public class CoachAttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CoachAttendanceDAO attendanceDAO;

    public void init() {
        attendanceDAO = new CoachAttendanceDAO();
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("coachAttendance.jsp");
        dispatcher.forward(request, response);
    }

    private void saveAttendance(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String coachid = request.getParameter("coachid");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        // Convert date string to LocalDate for comparison
        LocalDate attendanceDate = LocalDate.parse(date);
        LocalDate today = LocalDate.now();

        // Check if the date is in the future
        if (attendanceDate.isAfter(today)) {
            request.setAttribute("errorMessage", "Attendance cannot be recorded for future dates.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("coachAttendance.jsp");
            dispatcher.forward(request, response);
            return;
        }
      

        // Check for duplicate attendance
        boolean exists = attendanceDAO.checkDuplicateAttendance(coachid, date);
        if (exists) {
            request.setAttribute("errorMessage", "Attendance for this coach on the selected date already exists.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("coachAttendance.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Proceed with saving the attendance
        CoachAttendance attendance = new CoachAttendance(coachid, date, status);
        attendanceDAO.insertAttendance(attendance);
        response.sendRedirect("attendance?action=view");
    }

    private void viewAttendanceByDate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String date = request.getParameter("date");
        List<CoachAttendance> attendanceList = attendanceDAO.getAttendanceByDate(date);
        request.setAttribute("attendanceList", attendanceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coachViewAttendance.jsp");
        dispatcher.forward(request, response);
    }
}
