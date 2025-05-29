<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, sportpersonAttendance.SportpersonAttendance"%>
<%@ page import="sportpersonAttendance.SportpersonAttendanceDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Attendance</title>
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="sportperson-list.jsp">&lt;</a> <a
			class="navbar-brand" href="#">Attendance</a>
	</nav>
	<div class="container mt-4">
		<h1 class="mb-4 text-center">View Sportperson Attendance</h1>

		<!-- Form to select date -->
		<form action="sportpersonViewAttendance.jsp" method="get">
			<div class="form-group">
				<label for="date">Select Date:</label> <input type="date" id="date"
					name="date" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-primary">Show
				Attendance</button>
		</form>

		<%
		String date = request.getParameter("date");
		if (date != null && !date.isEmpty()) {
			SportpersonAttendanceDAO attendanceDAO = new SportpersonAttendanceDAO();
			List<SportpersonAttendance> attendanceList = attendanceDAO.getAttendanceByDate(date);

			if (attendanceList != null && !attendanceList.isEmpty()) {
		%>

		<!-- Attendance Records Table -->
		<h2 class="mt-4">
			Attendance Records for
			<%=date%></h2>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>SportpersonId</th>
					<th>Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (SportpersonAttendance attendance : attendanceList) {
				%>
				<tr>
					<td><%=attendance.getSportpersonid()%></td>
					<td><%=attendance.getDate()%></td>
					<td><%=attendance.getStatus()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<%
		} else {
		%>
		<p>No attendance records found for the selected date.</p>
		<%
		}
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
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
