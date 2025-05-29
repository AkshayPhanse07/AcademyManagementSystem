package user;

import java.sql.*;

public class UserDAO {
    private Connection conn;
    
    public UserDAO(Connection conn) {
        this.conn = conn;
    }
    
    public boolean changePassword(String email, String oldPassword, String newPassword) {
        try {
            String query = "SELECT password FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next() && rs.getString("password").equals(oldPassword)) {
                String updateQuery = "UPDATE users SET password = ? WHERE email = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateQuery);
                updatePs.setString(1, newPassword);
                updatePs.setString(2, email);
                
                int rowsUpdated = updatePs.executeUpdate();
                return rowsUpdated > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

