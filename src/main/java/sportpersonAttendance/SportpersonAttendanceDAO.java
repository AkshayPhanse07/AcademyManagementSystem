package sportpersonAttendance;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SportpersonAttendanceDAO {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/newproject";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "akshay";

    private static final String INSERT_ATTENDANCE_SQL = "INSERT INTO sportpersonAttendance (sportpersonid, date, status) VALUES (?, ?, ?)";
    private static final String SELECT_ATTENDANCE_BY_DATE = "SELECT sportpersonid, status FROM sportpersonAttendance WHERE date = ?";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading MySQL JDBC driver", e);
        }
    }

    public SportpersonAttendanceDAO() {
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }
    
    public boolean checkDuplicateAttendance(String sportpersonid, String date) throws SQLException {
        String sql = "SELECT COUNT(*) FROM sportpersonattendance WHERE sportpersonid = ? AND date = ?";
        try (Connection connection =getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, sportpersonid);
            statement.setString(2, date);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0; // Return true if a record is found
            }
        }
        return false; // No duplicate found
    }


    // Insert Attendance
    public void insertAttendance(SportpersonAttendance attendance) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ATTENDANCE_SQL)) {
            preparedStatement.setString(1, attendance.getSportpersonid());
            preparedStatement.setDate(2, Date.valueOf(attendance.getDate()));
            preparedStatement.setString(3, attendance.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Get Attendance by Date
    public List<SportpersonAttendance> getAttendanceByDate(String date) {
        List<SportpersonAttendance> attendanceList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ATTENDANCE_BY_DATE)) {
            preparedStatement.setDate(1, Date.valueOf(date));
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String sportpersonid = rs.getString("sportpersonid");
                String status = rs.getString("status");
                SportpersonAttendance attendance = new SportpersonAttendance(sportpersonid, date, status);
                attendanceList.add(attendance);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return attendanceList;
    }

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
