package users;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        UserDAO userDAO = new UserDAO(DatabaseConnection.getConnection());
        Users user = new Users(0, name, email, password, role);
        
        if (userDAO.registerUser(user)) {
            response.sendRedirect("login.jsp?msg=Registered successfully");
        } else {
            response.sendRedirect("register.jsp?msg=Registration failed");
        }
    }
}
