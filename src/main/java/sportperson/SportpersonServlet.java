package sportperson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/sportperson")
public class SportpersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SportpersonDAO sportpersonDAO;

    public void init() {
        sportpersonDAO = new SportpersonDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "listSportperson"; // Default action
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertSportperson(request, response);
                    break;
                case "delete":
                    deleteSportperson(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateSportperson(request, response);
                    break;
                default:
                    listSportperson(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listSportperson(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("sportperson-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("sportperson-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String sportpersonid = request.getParameter("sportpersonid");
        Sportperson existingSportperson = sportpersonDAO.selectSportperson(sportpersonid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sportperson-Edit.jsp");
        request.setAttribute("sportperson", existingSportperson);
        dispatcher.forward(request, response);
    }

    private void insertSportperson(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String sportpersonid = request.getParameter("sportpersonid");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        int age = Integer.parseInt(request.getParameter("age"));
        
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");

        Sportperson newSportperson = new Sportperson(sportpersonid, name, gender, dob, age, status, email, phone, address, nationality);
        sportpersonDAO.insertSportperson(newSportperson);
        response.sendRedirect("sportperson");
    }

    private void updateSportperson(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String sportpersonid = request.getParameter("sportpersonid");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        int age = Integer.parseInt(request.getParameter("age"));
        
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");

        Sportperson sportperson = new Sportperson(sportpersonid, name, gender, dob, age,  status, email, phone, address, nationality);
        sportpersonDAO.updateSportperson(sportperson);
        response.sendRedirect("sportperson");
    }

    private void deleteSportperson(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String sportpersonid = request.getParameter("sportpersonid");
        sportpersonDAO.deleteSportperson(sportpersonid);
        response.sendRedirect("sportperson");
    }
}
