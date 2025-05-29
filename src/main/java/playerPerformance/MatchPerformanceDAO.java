package playerPerformance;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MatchPerformanceDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/newproject";
    private static final String USER = "root";
    private static final String PASSWORD = "akshay";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static boolean addMatchPerformance(MatchPerformance performance) {
        String query = "INSERT INTO match_performance (player_id, match_date, runs_scored, balls_faced, fours, sixes, strike_rate, overs_bowled, wickets_taken, runs_conceded, economy_rate, bowling_average) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, performance.getPlayerId());
            stmt.setDate(2, new java.sql.Date(performance.getMatchDate().getTime()));
            stmt.setInt(3, performance.getRunsScored());
            stmt.setInt(4, performance.getBallsFaced());
            stmt.setInt(5, performance.getFours());
            stmt.setInt(6, performance.getSixes());
            stmt.setDouble(7, performance.getStrikeRate());
            stmt.setDouble(8, performance.getOversBowled());
            stmt.setInt(9, performance.getWicketsTaken());
            stmt.setInt(10, performance.getRunsConceded());
            stmt.setDouble(11, performance.getEconomyRate());
            stmt.setDouble(12, performance.getBowlingAverage());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<MatchPerformance> getAllPerformances() {
        List<MatchPerformance> list = new ArrayList<>();
        String query = "SELECT * FROM match_performance";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                list.add(mapResultSetToMatchPerformance(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static MatchPerformance getPerformanceById(int id) {
        String query = "SELECT * FROM match_performance WHERE match_id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToMatchPerformance(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static List<MatchPerformance> getPerformanceByPlayerId(String playerId) {
        List<MatchPerformance> list = new ArrayList<>();
        String query = "SELECT * FROM match_performance WHERE player_id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, playerId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToMatchPerformance(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateMatchPerformance(MatchPerformance performance) {
        String query = "UPDATE match_performance SET player_id=?, match_date=?, runs_scored=?, balls_faced=?, fours=?, sixes=?, strike_rate=?, overs_bowled=?, wickets_taken=?, runs_conceded=?, economy_rate=?, bowling_average=? WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, performance.getPlayerId());
            stmt.setDate(2, new java.sql.Date(performance.getMatchDate().getTime()));
            stmt.setInt(3, performance.getRunsScored());
            stmt.setInt(4, performance.getBallsFaced());
            stmt.setInt(5, performance.getFours());
            stmt.setInt(6, performance.getSixes());
            stmt.setDouble(7, performance.getStrikeRate());
            stmt.setDouble(8, performance.getOversBowled());
            stmt.setInt(9, performance.getWicketsTaken());
            stmt.setInt(10, performance.getRunsConceded());
            stmt.setDouble(11, performance.getEconomyRate());
            stmt.setDouble(12, performance.getBowlingAverage());
            stmt.setInt(13, performance.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteMatchPerformance(int id) {
        String query = "DELETE FROM match_performance WHERE match_id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private static MatchPerformance mapResultSetToMatchPerformance(ResultSet rs) throws SQLException {
        MatchPerformance performance = new MatchPerformance();
        performance.setId(rs.getInt("match_id"));
        performance.setPlayerId(rs.getString("player_id"));
        performance.setMatchDate(rs.getDate("match_date"));
        performance.setRunsScored(rs.getInt("runs_scored"));
        performance.setBallsFaced(rs.getInt("balls_faced"));
        performance.setFours(rs.getInt("fours"));
        performance.setSixes(rs.getInt("sixes"));
        performance.setStrikeRate(rs.getDouble("strike_rate"));
        performance.setOversBowled(rs.getDouble("overs_bowled"));
        performance.setWicketsTaken(rs.getInt("wickets_taken"));
        performance.setRunsConceded(rs.getInt("runs_conceded"));
        performance.setEconomyRate(rs.getDouble("economy_rate"));
        performance.setBowlingAverage(rs.getDouble("bowling_average"));
        return performance;
    }
}
