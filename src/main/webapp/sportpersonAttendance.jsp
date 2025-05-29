<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, sportperson.SportpersonDAO, sportperson.Sportperson"%>
<%@ page import="java.util.List"%>
<%
// Fetch the list of sportspersons from the database
List<Sportperson> listSportperson = SportpersonDAO.getAllSportpersons();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sportperson Attendance</title>
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

.container {
	margin-bottom: 70px;
}

.table {
	background-color: white;
	color: black;
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
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="sportperson-list.jsp">&lt;</a> <a
			class="navbar-brand" href="#">Attendance</a>
	</nav>

	<!-- Main Container -->
	<div class="container mt-4">
		<h1 class="mb-4 text-center">Sportperson Attendance</h1>

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
		<form action="sportpersonAttendance?action=save" method="post">
			<!-- Date Field -->
			<div class="form-group">
				<label for="date">Date:</label> <input type="date" id="date"
					name="date" class="form-control" required>
			</div>

			<!-- Sportperson Dropdown -->
			<div class="form-group">
				<label for="sportpersonid">Sportperson:</label> <select
					id="sportpersonid" name="sportpersonid" class="form-control"
					required>
					<option value="">Select Sportperson</option>
					<%
					for (Sportperson sportperson : listSportperson) {
					%>
					<option value="<%=sportperson.getSportpersonid()%>"><%=sportperson.getName()%>
						(ID:
						<%=sportperson.getSportpersonid()%>)
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
			<a href="sportpersonViewAttendance.jsp" class="btn btn-secondary">View
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
		src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
