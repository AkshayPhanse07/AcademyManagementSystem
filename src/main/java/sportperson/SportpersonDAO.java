package sportperson;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SportpersonDAO {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/newproject"; // replace with your database URL
    private static String jdbcUsername = "root"; // replace with your database username
    private static String jdbcPassword = "akshay"; // replace with your database password

    private static final String INSERT_SPORTPERSON_SQL = "INSERT INTO sportperson (sportpersonid, name, gender, dob, age, status, email, phone, address, nationality) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_SPORTPERSON_BY_ID = "SELECT sportpersonid, name, gender, dob, age, status, email, phone, address, nationality FROM sportperson WHERE sportpersonid = ?";
    private static final String SELECT_ALL_SPORTPERSONS = "SELECT * FROM sportperson";
    private static final String DELETE_SPORTPERSON_SQL = "DELETE FROM sportperson WHERE sportpersonid = ?";
    private static final String UPDATE_SPORTPERSON_SQL = "UPDATE sportperson SET name = ?, gender = ?, dob = ?, age = ?, status=?, email = ?, phone = ?, address = ?, nationality = ? WHERE sportpersonid = ?";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading MySQL JDBC driver", e);
        }
    }

    public SportpersonDAO() {
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Insert Sportperson
    public void insertSportperson(Sportperson sportperson) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SPORTPERSON_SQL)) {
            preparedStatement.setString(1, sportperson.getSportpersonid());
            preparedStatement.setString(2, sportperson.getName());
            preparedStatement.setString(3, sportperson.getGender());
            preparedStatement.setString(4, sportperson.getDob());
            preparedStatement.setInt(5, sportperson.getAge());
            preparedStatement.setString(6, sportperson.getStatus());
            preparedStatement.setString(7, sportperson.getEmail());
            preparedStatement.setString(8, sportperson.getPhone());
            preparedStatement.setString(9, sportperson.getAddress());
            preparedStatement.setString(10, sportperson.getNationality());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Select Sportperson by ID
    public Sportperson selectSportperson(String sportpersonid) {
        Sportperson sportperson = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SPORTPERSON_BY_ID)) {
            preparedStatement.setString(1, sportpersonid);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                String dob = rs.getString("dob");
                int age = rs.getInt("age");
                
                String status = rs.getString("status");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String nationality = rs.getString("nationality");

                sportperson = new Sportperson(sportpersonid, name, gender, dob, age, status, email, phone, address, nationality);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return sportperson;
    }

    // Select All Sportpersons
    public static List<Sportperson> getAllSportpersons() {
        List<Sportperson> sportpersons = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SPORTPERSONS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String sportpersonid = rs.getString("sportpersonid");
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                String dob = rs.getString("dob");
                int age = rs.getInt("age");
               
                String status = rs.getString("status");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String nationality = rs.getString("nationality");

                sportpersons.add(new Sportperson(sportpersonid, name, gender, dob, age,  status, email, phone, address, nationality));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return sportpersons;
    }

    // Update Sportperson
    public boolean updateSportperson(Sportperson sportperson) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SPORTPERSON_SQL)) {
            preparedStatement.setString(1, sportperson.getName());
            preparedStatement.setString(2, sportperson.getGender());
            preparedStatement.setString(3, sportperson.getDob());
            preparedStatement.setInt(4, sportperson.getAge());
            preparedStatement.setString(5, sportperson.getStatus());
            preparedStatement.setString(6, sportperson.getEmail());
            preparedStatement.setString(7, sportperson.getPhone());
            preparedStatement.setString(8, sportperson.getAddress());
            preparedStatement.setString(9, sportperson.getNationality());
            preparedStatement.setString(10, sportperson.getSportpersonid());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete Sportperson
    public boolean deleteSportperson(String sportpersonid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SPORTPERSON_SQL)) {
            preparedStatement.setString(1, sportpersonid);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Get Sportperson by Status
    public List<Sportperson> getSportpersonByStatus(String status) {
        List<Sportperson> sportpersonList = new ArrayList<>();
        String query = "SELECT * FROM sportperson WHERE status = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Sportperson sportperson = new Sportperson();
                sportperson.setSportpersonid(rs.getString("sportpersonid"));
                sportperson.setName(rs.getString("name"));
                sportperson.setGender(rs.getString("gender"));
                sportperson.setDob(rs.getString("dob"));
                sportperson.setAge(rs.getInt("age"));
               
                sportperson.setStatus(rs.getString("status"));
                sportperson.setEmail(rs.getString("email"));
                sportperson.setPhone(rs.getString("phone"));
                sportperson.setAddress(rs.getString("address"));
                sportperson.setNationality(rs.getString("nationality"));

                sportpersonList.add(sportperson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sportpersonList;
    }

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
            }
        }
    }
}
