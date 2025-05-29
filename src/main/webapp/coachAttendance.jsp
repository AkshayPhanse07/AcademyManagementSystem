<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, coach.CoachDAO, coach.Coach"%>
<%@ page import="java.util.List"%>
<%
// Fetch the list of coaches from the database
List<Coach> listCoach = CoachDAO.getAllCoaches();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Coach Attendance</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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
	font-size: 20px;
	gap: 12px;
	position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
    
}
.container {
	margin:100px 30px;
	
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
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="coach-list.jsp">&lt;</a> <a
			class="navbar-brand" href="#">Attendance</a>
	</nav>

	<!-- Main Container -->
	<div class="container">
		<h1 class="mb-4 text-center">Coach Attendance</h1>

		<!-- Error Message (if any) -->
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null) {
		%>
		<div class="alert alert-danger" role="alert">
			<%=errorMessage%>
		</div>
		<%
		}
		%>

		<!-- Attendance Form -->
		<form action="attendance?action=save" method="post">
			<!-- Date Field -->
			<div class="form-group">
				<label for="date">Date:</label> <input type="date" id="date"
					name="date" class="form-control" required>
			</div>

			<!-- Coach Dropdown -->
			<div class="form-group">
				<label for="coachid">Coach:</label> <select id="coachid"
					name="coachid" class="form-control" required>
					<option value="">Select Coach</option>
					<%
					for (Coach coach : listCoach) {
					%>
					<option value="<%=coach.getCoachid()%>"><%=coach.getName()%>
						(ID:
						<%=coach.getCoachid()%>)
					</option>
					<%
					}
					%>
				</select>
			</div>

			<!-- Attendance Status -->
			<div class="form-group">
				<label>Status:</label>
				<div>
					<label><input type="radio" name="status" value="Present"
						required> Present</label> <label><input type="radio"
						name="status" value="Absent" required> Absent</label>
				</div>
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary">Save
				Attendance</button>
			<a href="coachViewAttendance.jsp" class="btn btn-secondary">View
				Attendance</a>
		</form>
	</div>

	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved.| <a
				href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms
				of Service</a>
		</p>

	</footer>
	<!-- Bootstrap JS and Dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
