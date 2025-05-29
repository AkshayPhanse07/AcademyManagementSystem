package application;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TrainingApplicationServlet")
public class TrainingApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TrainingApplicationDAO applicationDAO;

    public void init() {
        applicationDAO = new TrainingApplicationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "delete":
                deleteApplication(request, response);
                break;
            default:
                listApplications(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "insert";
        }
        
        switch (action) {
            case "insert":
                addApplication(request, response);
                break;
            case "update":
                updateApplication(request, response);
                break;
        }
    }

    private void addApplication(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TrainingApplication application = new TrainingApplication(
            0, request.getParameter("firstName"), request.getParameter("lastName"),
            request.getParameter("gender"), request.getParameter("dob"),
            request.getParameter("fatherName"), request.getParameter("motherName"),
            request.getParameter("email"), request.getParameter("phone"),
            Integer.parseInt(request.getParameter("age")),
            request.getParameter("address"), request.getParameter("nationality"),
            request.getParameter("primaryRole"), request.getParameter("battingStyle"),
            request.getParameter("bowlingStyle"), request.getParameter("fieldingPosition"),
            Integer.parseInt(request.getParameter("experience")),
            request.getParameter("highestLevel"), request.getParameter("qualification"),
            request.getParameter("schoolName"), Integer.parseInt(request.getParameter("passingYear")),
            request.getParameter("percentage"), request.getParameter("studying"),
            request.getParameter("trainingTime"), request.getParameter("application_date")
        );
        applicationDAO.addApplication(application);
        response.sendRedirect("TrainingApplicationServlet");
    }

    private void listApplications(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TrainingApplication> applications = applicationDAO.getAllApplications();
        request.setAttribute("applications", applications);
        request.getRequestDispatcher("applicationHistory.jsp").forward(request, response);
    }

    private void updateApplication(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TrainingApplication application = new TrainingApplication(
            Integer.parseInt(request.getParameter("applicationId")),
            request.getParameter("firstName"), request.getParameter("lastName"),
            request.getParameter("gender"), request.getParameter("dob"),
            request.getParameter("fatherName"), request.getParameter("motherName"),
            request.getParameter("email"), request.getParameter("phone"),
            Integer.parseInt(request.getParameter("age")),
            request.getParameter("address"), request.getParameter("nationality"),
            request.getParameter("primaryRole"), request.getParameter("battingStyle"),
            request.getParameter("bowlingStyle"), request.getParameter("fieldingPosition"),
            Integer.parseInt(request.getParameter("experience")),
            request.getParameter("highestLevel"), request.getParameter("qualification"),
            request.getParameter("schoolName"), Integer.parseInt(request.getParameter("passingYear")),
            request.getParameter("percentage"), request.getParameter("studying"),
            request.getParameter("trainingTime"), request.getParameter("application_date")
        );
        applicationDAO.updateApplication(application);
        response.sendRedirect("TrainingApplicationServlet");
    }
    
    private void deleteApplication(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));
        applicationDAO.deleteApplication(applicationId);
        response.sendRedirect("TrainingApplicationServlet");
    }
}
