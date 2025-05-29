<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;
boolean hasData = false;
String errorMessage = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "akshay");

    String query = "SELECT t.applicationId, t.firstName, t.lastName, t.application_date, COALESCE(a.status, 'Pending') AS status FROM trainingapplication t LEFT JOIN approvedStatus a ON t.applicationId = a.applicationId";
    pst = con.prepareStatement(query);
    rs = pst.executeQuery();
} catch (Exception e) {
    errorMessage = "Database error: " + e.getMessage();
    e.printStackTrace(); // Optional: Log this
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player Applications</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        .container {
            margin-top: 100px;
        }
        footer {
            width: 100%;
            position: fixed;
            bottom: 0;
            background-color: black;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        footer a {
            color: #ffc107;
            text-decoration: none;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="AdminDashboard.jsp">
            <img src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
                 alt="Logo" style="height: 50px; border-radius: 10px;">
        </a>
        <span class="text-white">Champions Cricket Academy - Admin</span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="AdminDashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="coach-list.jsp">Manage Coaches</a></li>
                <li class="nav-item"><a class="nav-link" href="sportperson-list.jsp">Manage Sportspersons</a></li>
                <li class="nav-item"><a class="nav-link active" href="registration.jsp">Registrations</a></li>
                <li class="nav-item"><a class="nav-link" href="matchPerformance.jsp">Performance Tracking</a></li>
                <li class="nav-item"><a class="nav-link" href="setting1.jsp">Settings</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="text-center text-white">Player Training Applications</h2>

    <% if (errorMessage != null) { %>
        <div class="alert alert-danger"><%= errorMessage %></div>
    <% } %>

    <table class="table table-bordered table-hover bg-light">
        <thead class="table-dark">
            <tr>
                <th>Application ID</th>
                <th>Player Name</th>
                <th>Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            if (rs != null) {
                while (rs.next()) {
                    hasData = true;
            %>
                <tr>
                    <td><%= rs.getInt("applicationId") %></td>
                    <td><%= rs.getString("firstName") + " " + rs.getString("lastName") %></td>
                    <td><%= rs.getString("application_date") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <a href="viewApplication.jsp?applicationId=<%= rs.getInt("applicationId") %>" class="btn btn-primary">View</a>
                        <% if ("Pending".equals(rs.getString("status"))) { %>
                            <a href="approvedApplication.jsp?applicationId=<%= rs.getInt("applicationId") %>" class="btn btn-success btn-sm">Approve</a>
                            <a href="rejectedApplication.jsp?applicationId=<%= rs.getInt("applicationId") %>" class="btn btn-danger btn-sm">Reject</a>
                        <% } else if ("Approved".equals(rs.getString("status"))) { %>
                            <a href="addApplication.jsp?applicationId=<%= rs.getInt("applicationId") %>" class="btn btn-success">ADD To List</a>
                        <% } %>
                    </td>
                </tr>
            <% 
                } 
            }
            if (!hasData) { 
            %>
                <tr>
                    <td colspan="5" class="text-center text-danger">No applications found.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<footer>
    <p>
        &copy; 2024 Champions Cricket Academy. All rights reserved. |
        <a href="privacy.jsp">Privacy Policy</a> |
        <a href="terms.jsp">Terms of Service</a>
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%
    // Clean up resources
    try {
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
