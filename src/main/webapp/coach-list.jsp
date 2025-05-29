<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, coach.CoachDAO, coach.Coach"%>
<%@ page import="java.util.List"%>
<%
// Fetch the list of coaches from the database using DAO
List<Coach> listCoach = CoachDAO.getAllCoaches();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coach List</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
	color: white;
	margin: 0;
	padding: 0;
}

.navbar {
	font-size: 15px;
	gap: 12px;
	position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
}
.container{
margin-left:20px;
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
	
.table {
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand d-flex align-items-center"
				href="AdminDashboard.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;"> <span
				class="ms-2 text-white">Champions Cricket Academy</span>
			</a> <a class="navbar-brand" href="AdminDashboard.jsp">&lt;</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="coachAttendance.jsp">Add Coach Attendance</a></li>
					<li class="nav-item"><a class="nav-link"
						href="coachViewAttendance.jsp">View Coach Attendance</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<h1 class="mb-4">Coach List</h1>
		<a href="coach?action=new" class="btn btn-primary mb-3">Add New
			Coach</a>

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Coach ID</th>
					<th>Name</th>
					<th>Age</th>
					<th>Sport</th>
					<th>Coach Type</th>
					<th>Experience (Years)</th>
					<th>Specialization</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Address</th>
					<th>Nationality</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (listCoach != null && !listCoach.isEmpty()) {
					for (Coach coach : listCoach) {
				%>
				<tr>
					<td><%=coach.getCoachid()%></td>
					<td><%=coach.getName()%></td>
					<td><%=coach.getAge()%></td>
					<td><%=coach.getSport()%></td>
					<td><%=coach.getCoachType()%></td>
					<td><%=coach.getExperience()%></td>
					<td><%=coach.getSpecialization()%></td>
					<td><%=coach.getEmail()%></td>
					<td><%=coach.getPhone()%></td>
					<td><%=coach.getAddress()%></td>
					<td><%=coach.getNationality()%></td>
					<td class="d-flex"><a
						href="coach?action=edit&coachid=<%=coach.getCoachid()%>"
						class="btn btn-sm btn-warning me-2">Edit</a> <a
						href="coach?action=delete&coachid=<%=coach.getCoachid()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="12" class="text-center">No coaches available</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
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
