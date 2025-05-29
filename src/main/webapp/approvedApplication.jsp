<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
int applicationId = Integer.parseInt(request.getParameter("applicationId"));
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "akshay");

    // Fetch player details
    String fetchQuery = "SELECT firstName, lastName, applicationDate FROM training_applications WHERE applicationId = ?";
    pst = con.prepareStatement(fetchQuery);
    pst.setInt(1, applicationId);
    rs = pst.executeQuery();

    if (rs.next()) {
        String playerName = rs.getString("firstName") + " " + rs.getString("lastName");
        String applicationDate = rs.getString("applicationDate");

        // Insert or update status
        String insertQuery = "INSERT INTO approvedStatus (applicationId, playerName, applicationDate, status) VALUES (?, ?, ?, 'Approved') ON DUPLICATE KEY UPDATE status='Approved'";
        pst = con.prepareStatement(insertQuery);
        pst.setInt(1, applicationId);
        pst.setString(2, playerName);
        pst.setString(3, applicationDate);
        pst.executeUpdate();
    }

    response.sendRedirect("registration.jsp"); // Redirect back
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (pst != null) pst.close();
    if (con != null) con.close();
}
%>
