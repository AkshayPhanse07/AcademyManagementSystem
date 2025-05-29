<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="application.TrainingApplicationDAO, application.TrainingApplication"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Player Profile</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	font-family: 'Poppins', sans-serif;
	background:
		url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg')
		no-repeat center center fixed;
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

.profile-container {
	background: white;
	width: 50%;
	max-width: 900px;
	margin-top: 100px;
	margin-bottom: 80px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.profile-image {
	text-align: center;
}

.profile-image img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	border: 3px solid #007bff;
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
			<a class="navbar-brand" href="MainPage.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;">
			</a> <span class="text-white">Champions Cricket Academy</span>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link "
						href="sportpersonDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link "
						href="trainingRegistrationForm.jsp">Application</a></li>
					<li class="nav-item"><a class="nav-link "
						href="applicationHistory.jsp">Application History</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="profile.jsp">Profile</a></li>
					<li class="nav-item"><a class="nav-link" href="setting.jsp">Settings</a></li>
					<li class="nav-item"><a class="nav-link" href="contact1.jsp">Contact
							Us</a></li>
					<li class="nav-item"><a class="nav-link" href="aboutUs1.jsp">About
							Us</a></li>
					<li class="nav-item"><a class="nav-link text-danger"
						href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container profile-container">
		<h2 class="text-center">Player Profile</h2>

		<div class="profile-image">
			<!-- Profile Image with Click to Change -->
			<label for="profileUpload"> <img
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7zHK5Uizmti7A70Uo30fztUlzxcjUgqMJmWPx_7Qfdi2FwrHmhVOhVK8&s"
				alt="Profile Image" id="profilePic" class="profile-pic">
			</label>

		</div>

		<%
		TrainingApplicationDAO dao = new TrainingApplicationDAO();
		List<TrainingApplication> applicationList = dao.getAllApplications();

		// Ensure there is at least one application before accessing it
		TrainingApplication player = null;
		if (!applicationList.isEmpty()) {
			player = applicationList.get(0); // Get first player (you might want to select by ID instead)
		}
		%>

		<%
		if (player != null) {
		%>
		<table class="table mt-4">
			<tr>
				<th>Name:</th>
				<td><%=player.getFirstName() + " " + player.getLastName()%></td>
			</tr>
			<tr>
				<th>Gender:</th>
				<td><%=player.getGender()%></td>
			</tr>
			<tr>
				<th>Date of Birth:</th>
				<td><%=player.getDob()%></td>
			</tr>
			<tr>
				<th>Age:</th>
				<td><%=player.getAge()%></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><%=player.getEmail()%></td>
			</tr>
			<tr>
				<th>Phone:</th>
				<td><%=player.getPhone()%></td>
			</tr>
			<tr>
				<th>Address:</th>
				<td><%=player.getAddress()%></td>
			</tr>
			<tr>
				<th>Nationality:</th>
				<td><%=player.getNationality()%></td>
			</tr>
			<tr>
				<th>Primary Role:</th>
				<td><%=player.getPrimaryRole()%></td>
			</tr>
			<tr>
				<th>Batting Style:</th>
				<td><%=player.getBattingStyle()%></td>
			</tr>
			<tr>
				<th>Bowling Style:</th>
				<td><%=player.getBowlingStyle()%></td>
			</tr>
			<tr>
				<th>Fielding Position:</th>
				<td><%=player.getFieldingPosition()%></td>
			</tr>
			<tr>
				<th>Experience:</th>
				<td><%=player.getExperience()%> years</td>
			</tr>
			<tr>
				<th>Highest Level:</th>
				<td><%=player.getHighestLevel()%></td>
			</tr>
			<tr>
				<th>Qualification:</th>
				<td><%=player.getQualification()%></td>
			</tr>
			<tr>
				<th>School Name:</th>
				<td><%=player.getSchoolName()%></td>
			</tr>
			<tr>
				<th>Passing Year:</th>
				<td><%=player.getPassingYear()%></td>
			</tr>
			<tr>
				<th>Percentage:</th>
				<td><%=player.getPercentage()%>%</td>
			</tr>
			<tr>
				<th>Currently Studying:</th>
				<td><%=player.getStudying()%></td>
			</tr>
			<tr>
				<th>Training Time:</th>
				<td><%=player.getTrainingTime()%></td>
			</tr>
			<tr>
				<th>Application Date:</th>
				<td><%=player.getApplicationDate()%></td>
			</tr>
		</table>
		<%
		} else {
		%>
		<p class="text-danger text-center">No player data available.</p>
		<%
		}
		%>
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
