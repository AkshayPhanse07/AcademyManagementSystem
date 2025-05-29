package coach;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CoachDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/newproject";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "akshay";

    private static final String INSERT_COACH_SQL = "INSERT INTO coach1 (coachid, name, age, sport, email, phone, address, nationality, coachType, experience, specialization) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_COACH_BY_ID = "SELECT * FROM coach1 WHERE coachid = ?";
    private static final String SELECT_ALL_COACHES = "SELECT * FROM coach1";
    private static final String DELETE_COACH_SQL = "DELETE FROM coach1 WHERE coachid = ?";
    private static final String UPDATE_COACH_SQL = "UPDATE coach1 SET name = ?, age = ?, sport = ?, email = ?, phone = ?, address = ?, nationality = ?, coachType = ?, experience = ?, specialization = ? WHERE coachid = ?";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading MySQL JDBC driver", e);
        }
    }

    public CoachDAO() {}

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    public void insertCoach(Coach coach) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COACH_SQL)) {
            preparedStatement.setString(1, coach.getCoachid());
            preparedStatement.setString(2, coach.getName());
            preparedStatement.setInt(3, coach.getAge());
            preparedStatement.setString(4, coach.getSport());
            preparedStatement.setString(5, coach.getEmail());
            preparedStatement.setString(6, coach.getPhone());
            preparedStatement.setString(7, coach.getAddress());
            preparedStatement.setString(8, coach.getNationality());
            preparedStatement.setString(9, coach.getCoachType());
            preparedStatement.setInt(10, coach.getExperience()); // Changed to setInt
            preparedStatement.setString(11, coach.getSpecialization());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Coach selectCoach(String coachid) {
        Coach coach = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COACH_BY_ID)) {
            preparedStatement.setString(1, coachid);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                coach = new Coach(
                        rs.getString("coachid"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("sport"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("nationality"),
                        rs.getString("coachType"),
                        rs.getInt("experience"), // Changed to getInt
                        rs.getString("specialization")
                );
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return coach;
    }

    public static List<Coach> getAllCoaches() {
        List<Coach> coaches = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COACHES);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                coaches.add(new Coach(
                        rs.getString("coachid"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("sport"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("nationality"),
                        rs.getString("coachType"),
                        rs.getInt("experience"), // Changed to getInt
                        rs.getString("specialization")
                ));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return coaches;
    }

    public boolean updateCoach(Coach coach) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_COACH_SQL)) {
            preparedStatement.setString(1, coach.getName());
            preparedStatement.setInt(2, coach.getAge());
            preparedStatement.setString(3, coach.getSport());
            preparedStatement.setString(4, coach.getEmail());
            preparedStatement.setString(5, coach.getPhone());
            preparedStatement.setString(6, coach.getAddress());
            preparedStatement.setString(7, coach.getNationality());
            preparedStatement.setString(8, coach.getCoachType());
            preparedStatement.setInt(9, coach.getExperience()); // Changed to setInt
            preparedStatement.setString(10, coach.getSpecialization());
            preparedStatement.setString(11, coach.getCoachid());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteCoach(String coachid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COACH_SQL)) {
            preparedStatement.setString(1, coachid);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
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
