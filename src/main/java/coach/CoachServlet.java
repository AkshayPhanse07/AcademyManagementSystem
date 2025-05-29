package coach;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/coach")
public class CoachServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CoachDAO coachDAO;

    public void init() {
        coachDAO = new CoachDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "listCoach"; // Default action
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertCoach(request, response);
                    break;
                case "delete":
                    deleteCoach(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateCoach(request, response);
                    break;
                default:
                    listCoach(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCoach(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Coach> listCoach = CoachDAO.getAllCoaches();
        request.setAttribute("listCoach", listCoach);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coach-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("coach-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String coachid = request.getParameter("coachid");
        Coach existingCoach = coachDAO.selectCoach(coachid);
        request.setAttribute("coach", existingCoach);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coach-Edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCoach(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String coachid = request.getParameter("coachid");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sport = request.getParameter("sport");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");
        String coachType = request.getParameter("coachType");
        int experience = Integer.parseInt(request.getParameter("experience")); // Corrected type
        String specialization = request.getParameter("specialization");

        Coach newCoach = new Coach(coachid, name, age, sport, email, phone, address, nationality, coachType, experience, specialization);
        coachDAO.insertCoach(newCoach);
        response.sendRedirect("coach");
    }

    private void updateCoach(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String coachid = request.getParameter("coachid");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sport = request.getParameter("sport");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");
        String coachType = request.getParameter("coachType");
        int experience = Integer.parseInt(request.getParameter("experience")); // Corrected type
        String specialization = request.getParameter("specialization");

        Coach coach = new Coach(coachid, name, age, sport, email, phone, address, nationality, coachType, experience, specialization);
        coachDAO.updateCoach(coach);
        response.sendRedirect("coach");
    }

    private void deleteCoach(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String coachid = request.getParameter("coachid");
        coachDAO.deleteCoach(coachid);
        response.sendRedirect("coach");
    }
}
