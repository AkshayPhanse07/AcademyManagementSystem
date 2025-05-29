package users;

import java.sql.*;

public class UserDAO {
	private Connection con;

	public UserDAO(Connection con) {
		this.con = con;
	}

	public boolean registerUser(Users user) {
		String query = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";
		try (PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getRole());
			return pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Users loginUser(String email, String password, String role) {
		String query = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
		try (PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, role);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"),
						rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
