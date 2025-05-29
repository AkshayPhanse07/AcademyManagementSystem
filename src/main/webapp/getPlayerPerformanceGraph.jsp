<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat, playerPerformance.MatchPerformance, playerPerformance.MatchPerformanceDAO" %>
<%@ page import="com.google.gson.Gson" %>
<%
    response.setContentType("application/json");
    String playerIdParam = request.getParameter("player_id");

    if (playerIdParam != null && !playerIdParam.isEmpty()) {
        try {
            String playerId = playerIdParam;
            List<MatchPerformance> performances = MatchPerformanceDAO.getPerformanceByPlayerId(playerId);

            if (!performances.isEmpty()) {
                double totalRuns = 0, totalBallsFaced = 0, totalFours = 0, totalSixes = 0, totalStrikeRate = 0;
                double totalOversBowled = 0, totalWickets = 0, totalRunsConceded = 0, totalEconomyRate = 0, totalBowlingAvg = 0;
                int count = performances.size();

                for (MatchPerformance perf : performances) {
                    totalRuns += perf.getRunsScored();
                    totalBallsFaced += perf.getBallsFaced();
                    totalFours += perf.getFours();
                    totalSixes += perf.getSixes();
                    totalStrikeRate += perf.getStrikeRate();
                    totalOversBowled += perf.getOversBowled();
                    totalWickets += perf.getWicketsTaken();
                    totalRunsConceded += perf.getRunsConceded();
                    totalEconomyRate += perf.getEconomyRate();
                    totalBowlingAvg += perf.getBowlingAverage();
                }

                // Compute averages
                Map<String, Double> avgPerformanceData = new LinkedHashMap<>();
                avgPerformanceData.put("Runs Scored", totalRuns / count);
                avgPerformanceData.put("Balls Faced", totalBallsFaced / count);
                avgPerformanceData.put("Fours", totalFours / count);
                avgPerformanceData.put("Sixes", totalSixes / count);
                avgPerformanceData.put("Strike Rate", totalStrikeRate / count);
                avgPerformanceData.put("Overs Bowled", totalOversBowled / count);
                avgPerformanceData.put("Wickets Taken", totalWickets / count);
                avgPerformanceData.put("Runs Conceded", totalRunsConceded / count);
                avgPerformanceData.put("Economy Rate", totalEconomyRate / count);
                avgPerformanceData.put("Bowling Average", totalBowlingAvg / count);

                Gson gson = new Gson();
                out.print(gson.toJson(avgPerformanceData));
            } else {
                out.print("{}"); // No data available
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{}"); // Return empty JSON on error
        }
    } else {
        out.print("{}"); // Return empty JSON if no player ID is provided
    }
%>
