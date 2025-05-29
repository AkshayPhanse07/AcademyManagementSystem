<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Application</title>
</head>
<body>
    <h1>Insert Application Data</h1>

<%
    String message = "";
    String applicationIdParam = request.getParameter("applicationId");

    // Check if the applicationId is present in the URL
    if (applicationIdParam != null) {
        try {
            int applicationId = Integer.parseInt(applicationIdParam);
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "akshay");

            // Fetch application details using the applicationId
            String fetchQuery = "SELECT firstName, lastName, gender, dob, age, primaryRole, email, phone, address, nationality FROM training_applications WHERE applicationId = ?";
            pst = con.prepareStatement(fetchQuery);
            pst.setInt(1, applicationId);
            rs = pst.executeQuery();

            if (rs.next()) {
                // Retrieve data from result set
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String gender = rs.getString("gender");
                String dob = rs.getString("dob");
                int age = rs.getInt("age");
                String status = rs.getString("primaryRole");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String nationality = rs.getString("nationality");

                // Combine first name and last name into full name
                String name = firstName + " " + lastName;

                // Generate sportpersonId
                String sportpersonId = "S01";  // Default value in case there are no entries in the table

                // Query to find the highest existing sportpersonId
                String maxIdQuery = "SELECT MAX(sportpersonId) FROM sportperson WHERE sportpersonId LIKE 'S%'";
                pst = con.prepareStatement(maxIdQuery);
                rs = pst.executeQuery();

                if (rs.next()) {
                    String lastSportpersonId = rs.getString(1);

                    if (lastSportpersonId != null) {
                        // Extract the numeric part of the sportpersonId
                        String numericPart = lastSportpersonId.substring(1);
                        int newIdNumber = Integer.parseInt(numericPart) + 1;
                        
                        // Format the new sportpersonId to have two digits (e.g., S01, S02)
                        sportpersonId = "S" + String.format("%02d", newIdNumber);
                    }
                }

                // Insert into sportperson table with combined fullName
                String insertQuery = "INSERT INTO sportperson (sportpersonid, name, gender, dob, age, status, email, phone, address, nationality) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pst = con.prepareStatement(insertQuery);
                pst.setString(1, sportpersonId);
                pst.setString(2, name);  // Insert fullName as the combined value
                pst.setString(3, gender);
                pst.setString(4, dob);
                pst.setInt(5, age);
                pst.setString(6, status);
                pst.setString(7, email);
                pst.setString(8, phone);
                pst.setString(9, address);
                pst.setString(10, nationality);
                pst.executeUpdate();

                message = "Application data inserted successfully with sportpersonId: " + sportpersonId;
            } else {
                message = "No application found with the given Application ID.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error occurred: " + e.getMessage();
        }
    } else {
        message = "Application ID is missing.";
    }
    response.sendRedirect("registration.jsp");
%>

</body>
</html>
