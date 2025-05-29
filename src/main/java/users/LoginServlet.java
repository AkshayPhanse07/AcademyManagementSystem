package users;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        UserDAO userDAO = new UserDAO(DatabaseConnection.getConnection());
        Users user = userDAO.loginUser(email, password, role);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Redirecting based on user role
            switch (role.toLowerCase()) {
                case "admin":
                    response.sendRedirect("AdminDashboard.jsp");
                    break;
                case "coach":
                    response.sendRedirect("CoachDashboard.jsp");
                    break;
                case "sportperson":
                    response.sendRedirect("sportpersonDashboard.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp?msg=Invalid Role");
            }
        } else {
            response.sendRedirect("login.jsp?msg=Invalid credentials");
        }
    }
}

