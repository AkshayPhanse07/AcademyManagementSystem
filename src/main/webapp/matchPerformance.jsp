<%@ page import="java.util.List"%>
<%@ page import="sportperson.Sportperson"%>
<%@ page import="sportperson.SportpersonDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>Match Performance</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
	margin: 0;
	padding: 0;
	color: white;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.navbar {
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 1000;
}

.content {
	flex: 1;
	margin-top: 100px;
	padding-bottom: 80px;
	margin-bottom: 20px;
}
.head{
margin-left:30%;}
footer {
	width: 100%;
	background-color: black;
	color: white;
	padding: 20px 0;
	text-align: center;
	position: fixed;
	bottom: 0;
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
			<a class="navbar-brand" href="AdminDashboard.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;">
			</a> <span class="text-white">Champions Cricket Academy - Admin</span>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="AdminDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="coach-list.jsp">Manage
							Coaches</a></li>
					<li class="nav-item"><a class="nav-link"
						href="sportperson-list.jsp">Manage Sportspersons</a></li>
					<li class="nav-item"><a class="nav-link"
						href="registration.jsp">Registrations</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="matchPerformance.jsp">Performance Tracking</a></li>
					<li class="nav-item"><a class="nav-link" href="setting1.jsp">Settings</a></li>
					<li class="nav-item"><a class="nav-link text-danger"
						href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container content">
		<div class=" head d-flex justify-content-between align-items-center">
			<h2 class="text-center">Match Performance Entry</h2>
			<a href="viewPerformance.jsp" class="btn btn-success">View
				Performance</a>
		</div>
		<%
		String success = request.getParameter("success");
		%>
		<%
		if ("true".equals(success)) {
		%>
		<div class="alert alert-success">Performance data saved
			successfully!</div>
		<%
		}
		%>

		<form action="MatchPerformanceServlet?action=add" method="post">
			<div class="form-group">
				<label for="playerId">Select Player:</label> <select
					class="form-control" id="playerId" name="playerId" required>
					<option value="">-- Select Player --</option>
					<%
					List<Sportperson> listSportperson = SportpersonDAO.getAllSportpersons();
					if (listSportperson != null) {
						for (Sportperson player : listSportperson) {
					%>
					<option value="<%=player.getSportpersonid()%>"><%=player.getName()%>
						(ID:
						<%=player.getSportpersonid()%>)
					</option>
					<%
					}
					}
					%>
				</select>
			</div>

			<div class="form-group">
				<label for="matchDate">Match Date:</label> <input type="date"
					class="form-control" id="matchDate" name="matchDate" required>
			</div>

			<h4>Batting Stats</h4>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label>Runs Scored</label> <input type="number"
						class="form-control" name="runsScored" required>
				</div>
				<div class="form-group col-md-3">
					<label>Balls Faced</label> <input type="number"
						class="form-control" name="ballsFaced" required>
				</div>
				<div class="form-group col-md-3">
					<label>Fours</label> <input type="number" class="form-control"
						name="fours" required>
				</div>
				<div class="form-group col-md-3">
					<label>Sixes</label> <input type="number" class="form-control"
						name="sixes" required>
				</div>

				<div class="form-group col-md-3">
					<label>Strike Rate</label> <input type="number" step="0.01"
						class="form-control" name="strikeRate" required>
				</div>
			</div>

			<h4>Bowling Stats</h4>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label>Overs Bowled</label> <input type="number"
						class="form-control" name="oversBowled" required>
				</div>
				<div class="form-group col-md-3">
					<label>Wickets Taken</label> <input type="number"
						class="form-control" name="wicketsTaken" required>
				</div>
				<div class="form-group col-md-3">
					<label>Runs Conceded</label> <input type="number"
						class="form-control" name="runsConceded" required>
				</div>
				<div class="form-group col-md-3">
					<label>Economy Rate</label> <input type="number" step="0.01"
						class="form-control" name="economyRate" required>
				</div>
				<div class="form-group col-md-3">
					<label>Bowling Average</label> <input type="number" step="0.01"
						class="form-control" name="bowlingAverage" required>
				</div>
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved. | <a
				href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms
				of Service</a>
		</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
