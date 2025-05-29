<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Application</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
.container{
margin-top:100px;
margin-bottom:100px;

}
.container h2{
background-color:lightblue;
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

.section-title {
	font-size: 1.2rem;
	font-weight: bold;
	margin-top: 20px;
	border-bottom: 2px solid #007bff;
	padding-bottom: 5px;
}

.detail-row {
	display: flex;
	margin: 8px 0;
}

.detail-label {
	font-weight: bold;
	width: 40%;
	text-align: left;
}

.detail-value {
	width: 60%;
	text-align: left;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="AdminDashboard.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;">
			</a> <span class="text-white">Champions Cricket Academy </span> <a
				class="navbar-brand" href="registration.jsp">&lt;</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<div class="col-md-8 bg-light p-4 rounded shadow">
			<h2 class="text-center ">Player Application Details</h2>

			<%
			String applicationId = request.getParameter("applicationId"); // Get the application ID from URL

			if (applicationId != null) {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "akshay");

					String query = "SELECT * FROM trainingapplication WHERE applicationId = ?";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setInt(1, Integer.parseInt(applicationId));
					ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
			%>

			<!-- Basic Information -->
			<div class="section-title">Basic Information</div>
			<div class="detail-row">
				<div class="detail-label">First Name:</div>
				<div class="detail-value"><%=rs.getString("firstName")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Last Name:</div>
				<div class="detail-value"><%=rs.getString("lastName")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Gender:</div>
				<div class="detail-value"><%=rs.getString("gender")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Date of Birth:</div>
				<div class="detail-value"><%=rs.getString("dob")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Age:</div>
				<div class="detail-value"><%=rs.getInt("age")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Address:</div>
				<div class="detail-value"><%=rs.getString("address")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Nationality:</div>
				<div class="detail-value"><%=rs.getString("nationality")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Father Name:</div>
				<div class="detail-value"><%=rs.getString("fatherName")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Mother Name:</div>
				<div class="detail-value"><%=rs.getString("motherName")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Email:</div>
				<div class="detail-value"><%=rs.getString("email")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Phone Number:</div>
				<div class="detail-value"><%=rs.getString("phone")%></div>
			</div>

			<!-- Sport Details -->
			<div class="section-title">Sport Details - Cricket</div>
			<div class="detail-row">
				<div class="detail-label">Primary Role:</div>
				<div class="detail-value"><%=rs.getString("primaryRole")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Batting Style:</div>
				<div class="detail-value"><%=rs.getString("battingStyle")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Bowling Style:</div>
				<div class="detail-value"><%=rs.getString("bowlingStyle")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Preferred Fielding Position:</div>
				<div class="detail-value"><%=rs.getString("fieldingPosition")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Cricket Experience (Years):</div>
				<div class="detail-value"><%=rs.getInt("experience")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Highest Level Played:</div>
				<div class="detail-value"><%=rs.getString("highestLevel")%></div>
			</div>

			<!-- Academic Details -->
			<div class="section-title">Academic Details</div>
			<div class="detail-row">
				<div class="detail-label">Highest Qualification:</div>
				<div class="detail-value"><%=rs.getString("qualification")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">School/College Name:</div>
				<div class="detail-value"><%=rs.getString("schoolName")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Year of Passing:</div>
				<div class="detail-value"><%=rs.getString("passingYear")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Percentage/Grade:</div>
				<div class="detail-value"><%=rs.getString("percentage")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Are you currently studying?</div>
				<div class="detail-value"><%=rs.getString("studying")%></div>
			</div>
			<div class="detail-row">
				<div class="detail-label">Preferred Training Time:</div>
				<div class="detail-value"><%=rs.getString("trainingTime")%></div>
			</div>

			<!-- Application Date -->
			<div class="section-title">Application Details</div>
			<div class="detail-row">
				<div class="detail-label">Application Date:</div>
				<div class="detail-value"><%=rs.getString("application_date")%></div>
			</div>

			<%
			} else {
			out.println("<div class='alert alert-danger text-center'>No application found for the given ID.</div>");
			}
			con.close();
			} catch (Exception e) {
			out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
			}
			} else {
			out.println("<div class='alert alert-danger text-center'>Invalid application ID.</div>");
			}
			%>

			<div class="text-center mt-4">
				<a href="registration.jsp" class="btn btn-secondary">Back to
					Applications</a>
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
