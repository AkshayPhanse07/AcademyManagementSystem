package user;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.DatabaseConnection;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        
        Connection conn = DatabaseConnection.getConnection(); // Assume you have a class for DB connection
        UserDAO userDAO = new UserDAO(conn);
        
        boolean isUpdated = userDAO.changePassword(email, oldPassword, newPassword);
        if (isUpdated) {
            response.sendRedirect("success1.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
