package playerPerformance;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MatchPerformanceServlet")
public class MatchPerformanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("viewPerformance.jsp");
            return;
        }

        switch (action) {
            case "add":
                addMatchPerformance(request, response);
                break;
            case "update":
                updateMatchPerformance(request, response);
                break;
            case "delete":
                deleteMatchPerformance(request, response);
                break;
            case "viewByPlayer":
                viewPerformanceByPlayer(request, response);
                break;
            default:
                response.sendRedirect("viewPerformance.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MatchPerformance> performances = MatchPerformanceDAO.getAllPerformances();
        request.setAttribute("performances", performances);
        request.getRequestDispatcher("viewPerformance.jsp").forward(request, response);
    }

    private void addMatchPerformance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playerId =request.getParameter("playerId");
        java.sql.Date matchDate = java.sql.Date.valueOf(request.getParameter("matchDate"));
        int runsScored = Integer.parseInt(request.getParameter("runsScored"));
        int ballsFaced = Integer.parseInt(request.getParameter("ballsFaced"));
        int fours = Integer.parseInt(request.getParameter("fours"));
        int sixes = Integer.parseInt(request.getParameter("sixes"));
        double strikeRate = Double.parseDouble(request.getParameter("strikeRate"));
        double oversBowled = Double.parseDouble(request.getParameter("oversBowled"));
        int wicketsTaken = Integer.parseInt(request.getParameter("wicketsTaken"));
        int runsConceded = Integer.parseInt(request.getParameter("runsConceded"));
        double economyRate = Double.parseDouble(request.getParameter("economyRate"));
        double bowlingAverage = Double.parseDouble(request.getParameter("bowlingAverage"));

        MatchPerformance performance = new MatchPerformance(playerId, matchDate, runsScored, ballsFaced, fours, sixes, 
                strikeRate, oversBowled, wicketsTaken, runsConceded, economyRate, bowlingAverage);

        MatchPerformanceDAO.addMatchPerformance(performance);
        response.sendRedirect("viewPerformance.jsp");
    }

    private void updateMatchPerformance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MatchPerformance performance = MatchPerformanceDAO.getPerformanceById(id);
        if (performance != null) {
            performance.setRunsScored(Integer.parseInt(request.getParameter("runsScored")));
            performance.setBallsFaced(Integer.parseInt(request.getParameter("ballsFaced")));
            performance.setFours(Integer.parseInt(request.getParameter("fours")));
            performance.setSixes(Integer.parseInt(request.getParameter("sixes")));
            performance.setStrikeRate(Double.parseDouble(request.getParameter("strikeRate")));
            performance.setOversBowled(Double.parseDouble(request.getParameter("oversBowled")));
            performance.setWicketsTaken(Integer.parseInt(request.getParameter("wicketsTaken")));
            performance.setRunsConceded(Integer.parseInt(request.getParameter("runsConceded")));
            performance.setEconomyRate(Double.parseDouble(request.getParameter("economyRate")));
            performance.setBowlingAverage(Double.parseDouble(request.getParameter("bowlingAverage")));

            MatchPerformanceDAO.updateMatchPerformance(performance);
        }
        response.sendRedirect("viewPerformance.jsp");
    }

    private void deleteMatchPerformance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MatchPerformanceDAO.deleteMatchPerformance(id);
        response.sendRedirect("viewPerformance.jsp");
    }

    private void viewPerformanceByPlayer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playerId = request.getParameter("playerId");
        List<MatchPerformance> performances = MatchPerformanceDAO.getPerformanceByPlayerId(playerId);
        request.setAttribute("performances", performances);
        request.getRequestDispatcher("viewPerformance.jsp").forward(request, response);
    }
}
