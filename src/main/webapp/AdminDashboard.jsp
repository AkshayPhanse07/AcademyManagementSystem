<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    int totalCoaches = 0;
    int totalPlayers = 0;
    int totalRegistrations = 0;
    int totalApprovedApplications=0;
    int totalRejectedApplications=0;
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "akshay");
        
        Statement stmt = con.createStatement();
        
        ResultSet rsCoaches = stmt.executeQuery("SELECT COUNT(*) FROM coach1");
        if (rsCoaches.next()) {
            totalCoaches = rsCoaches.getInt(1);
        }
        
        ResultSet rsPlayers = stmt.executeQuery("SELECT COUNT(*) FROM sportperson");
        if (rsPlayers.next()) {
            totalPlayers = rsPlayers.getInt(1);
        }
        
        ResultSet rsRegistrations = stmt.executeQuery("SELECT COUNT(*) FROM trainingapplication");
        if (rsRegistrations.next()) {
            totalRegistrations = rsRegistrations.getInt(1);
        }
        
        ResultSet rsApprovedApplications = stmt.executeQuery("SELECT COUNT(*) FROM approvedStatus WHERE status = 'Approved' ");
        if (rsApprovedApplications.next()) {
            totalApprovedApplications = rsApprovedApplications.getInt(1);
        }
        
        ResultSet rsRejectedApplications = stmt.executeQuery("SELECT COUNT(*) FROM approvedStatus WHERE status = 'Rejected' ");
        if (rsRejectedApplications.next()) {
            totalRejectedApplications = rsRejectedApplications.getInt(1);
        }
        
        
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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

.dashboard-card {
    background-color: white;
    color: black;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin-top:100px;
    
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
                    <li class="nav-item"><a class="nav-link active" href="AdminDashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="coach-list.jsp">Manage Coaches</a></li>
                    <li class="nav-item"><a class="nav-link" href="sportperson-list.jsp">Manage Sportspersons</a></li>
                    <li class="nav-item"><a class="nav-link" href="registration.jsp">Registrations</a></li>
                    <li class="nav-item"><a class="nav-link" href="matchPerformance.jsp">Performance Tracking</a></li>
                    <li class="nav-item"><a class="nav-link " href="setting1.jsp">Settings</a></li>
                    <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
	 <div class="container mt-4">
        <div class="row">
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>Total Coaches</h3>
                    <p><%= totalCoaches %></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>Total Players</h3>
                    <p><%= totalPlayers %></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>Registrations</h3>
                    <p><%= totalRegistrations %></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>Approved Applications</h3>
                    <p><%= totalApprovedApplications %></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>Rejected Applications</h3>
                    <p><%= totalRejectedApplications %></p>
                </div>
            </div>
        </div>
    </div>
	

	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved.| <a
				href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms
				of Service</a>
		</p>

	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
