package application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TrainingApplicationDAO {
    
    // Method to add a new training application
    public void addApplication(TrainingApplication application) {
        String sql = "INSERT INTO trainingapplication (firstName, lastName, gender, dob, fatherName, motherName, email, phone, age, address, nationality, primaryRole, battingStyle, bowlingStyle, fieldingPosition, experience, highestLevel, qualification, schoolName, passingYear, percentage, studying, trainingTime, application_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, application.getFirstName());
            stmt.setString(2, application.getLastName());
            stmt.setString(3, application.getGender());
            stmt.setString(4, application.getDob());
            stmt.setString(5, application.getFatherName());
            stmt.setString(6, application.getMotherName());
            stmt.setString(7, application.getEmail());
            stmt.setString(8, application.getPhone());
            stmt.setInt(9, application.getAge());
            stmt.setString(10, application.getAddress());
            stmt.setString(11, application.getNationality());
            stmt.setString(12, application.getPrimaryRole());
            stmt.setString(13, application.getBattingStyle());
            stmt.setString(14, application.getBowlingStyle());
            stmt.setString(15, application.getFieldingPosition());
            stmt.setInt(16, application.getExperience());
            stmt.setString(17, application.getHighestLevel());
            stmt.setString(18, application.getQualification());
            stmt.setString(19, application.getSchoolName());
            stmt.setInt(20, application.getPassingYear());
            stmt.setString(21, application.getPercentage());
            stmt.setString(22, application.getStudying());
            stmt.setString(23, application.getTrainingTime());
            stmt.setString(24, application.getApplicationDate());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve all applications
    public List<TrainingApplication> getAllApplications() {
        List<TrainingApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM trainingapplication";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                TrainingApplication application = new TrainingApplication(
                    rs.getInt("applicationId"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("gender"),
                    rs.getString("dob"),
                    rs.getString("fatherName"),
                    rs.getString("motherName"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("age"),
                    rs.getString("address"),
                    rs.getString("nationality"),
                    rs.getString("primaryRole"),
                    rs.getString("battingStyle"),
                    rs.getString("bowlingStyle"),
                    rs.getString("fieldingPosition"),
                    rs.getInt("experience"),
                    rs.getString("highestLevel"),
                    rs.getString("qualification"),
                    rs.getString("schoolName"),
                    rs.getInt("passingYear"),
                    rs.getString("percentage"),
                    rs.getString("studying"),
                    rs.getString("trainingTime"),
                    rs.getString("application_date")
                );
                applications.add(application);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }
    
    // Method to retrieve an application by ID
    public TrainingApplication getApplicationById(int applicationId) {
        String sql = "SELECT * FROM trainingapplication WHERE applicationId = ?";
        TrainingApplication application = null;
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, applicationId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                application = new TrainingApplication(
                    rs.getInt("applicationId"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("gender"),
                    rs.getString("dob"),
                    rs.getString("fatherName"),
                    rs.getString("motherName"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("age"),
                    rs.getString("address"),
                    rs.getString("nationality"),
                    rs.getString("primaryRole"),
                    rs.getString("battingStyle"),
                    rs.getString("bowlingStyle"),
                    rs.getString("fieldingPosition"),
                    rs.getInt("experience"),
                    rs.getString("highestLevel"),
                    rs.getString("qualification"),
                    rs.getString("schoolName"),
                    rs.getInt("passingYear"),
                    rs.getString("percentage"),
                    rs.getString("studying"),
                    rs.getString("trainingTime"),
                    rs.getString("application_date")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return application;
    }
    
    // Method to update a training application
    public void updateApplication(TrainingApplication application) {
        String sql = "UPDATE trainingapplication SET firstName=?, lastName=?, gender=?, dob=?, fatherName=?, motherName=?, email=?, phone=?, age=?, address=?, nationality=?, primaryRole=?, battingStyle=?, bowlingStyle=?, fieldingPosition=?, experience=?, highestLevel=?, qualification=?, schoolName=?, passingYear=?, percentage=?, studying=?, trainingTime=?, application_date=? WHERE applicationId=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, application.getFirstName());
            stmt.setString(2, application.getLastName());
            stmt.setString(3, application.getGender());
            stmt.setString(4, application.getDob());
            stmt.setString(5, application.getFatherName());
            stmt.setString(6, application.getMotherName());
            stmt.setString(7, application.getEmail());
            stmt.setString(8, application.getPhone());
            stmt.setInt(9, application.getAge());
            stmt.setString(10, application.getAddress());
            stmt.setString(11, application.getNationality());
            stmt.setString(12, application.getPrimaryRole());
            stmt.setString(13, application.getBattingStyle());
            stmt.setString(14, application.getBowlingStyle());
            stmt.setString(15, application.getFieldingPosition());
            stmt.setInt(16, application.getExperience());
            stmt.setString(17, application.getHighestLevel());
            stmt.setString(18, application.getQualification());
            stmt.setString(19, application.getSchoolName());
            stmt.setInt(20, application.getPassingYear());
            stmt.setString(21, application.getPercentage());
            stmt.setString(22, application.getStudying());
            stmt.setString(23, application.getTrainingTime());
            stmt.setString(24, application.getApplicationDate());
            stmt.setInt(25, application.getApplicationId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    // Method to delete an application
    public void deleteApplication(int applicationId) {
        String sql = "DELETE FROM trainingapplication WHERE applicationId=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, applicationId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
