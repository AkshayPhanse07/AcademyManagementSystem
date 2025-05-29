<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, playerPerformance.MatchPerformance, playerPerformance.MatchPerformanceDAO, sportperson.Sportperson, sportperson.SportpersonDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Player Performance</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
	color: white;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}

.container {
	flex: 1;
	margin-top: 100px;
	padding-bottom: 80px;
}

.chart-container {
	width: 80%;
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background: #f8f9fa; /* Light gray background */
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.chart-container h3 {
	font-size: 1.5rem;
	margin-bottom: 15px;
	color: #333;
}

canvas {
	width: 100% !important;
	height: 400px !important;
}

@media ( max-width : 768px) {
	.chart-container {
		width: 95%;
	}
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
			<a class="navbar-brand" href="AdminDashboard.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;">
			</a> <span class="text-white">Champions Cricket Academy</span> <a
				class="navbar-brand" href="matchPerformance.jsp">&lt;</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav"></div>
		</div>
	</nav>
	<!-- Main Content -->
	<div class="container">
		<h2 class="text-center">View Player Performance</h2>

		<!-- Player Selection Form -->
		<form method="post" class="mb-4">
			<div class="mb-3">
				<label for="player_id" class="form-label">Select Player:</label> <select
					class="form-control" id="player_id" name="player_id" required>
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
			<button type="submit" class="btn btn-primary">View
				Performance</button>
			<button type="button" id="viewGraphBtn" class="btn btn-success">View
				Performance Graphically</button>
		</form>

		<%
		String playerIdParam = request.getParameter("player_id");
		if (playerIdParam != null && !playerIdParam.isEmpty()) {
			String playerId = playerIdParam;
			List<MatchPerformance> performances = MatchPerformanceDAO.getPerformanceByPlayerId(playerId);

			if (!performances.isEmpty()) {
		%>

		<!-- Player Performance Table -->
		<h4>
			Performance of Player
			<%=playerId%></h4>
		<table class="table table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>Match Date</th>
					<th>Runs Scored</th>
					<th>Balls Faced</th>
					<th>Fours</th>
					<th>Sixes</th>
					<th>Strike Rate</th>
					<th>Overs Bowled</th>
					<th>Wickets Taken</th>
					<th>Runs Conceded</th>
					<th>Economy Rate</th>
					<th>Bowling Average</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (MatchPerformance perf : performances) {
				%>
				<tr>
					<td><%=perf.getMatchDate()%></td>
					<td><%=perf.getRunsScored()%></td>
					<td><%=perf.getBallsFaced()%></td>
					<td><%=perf.getFours()%></td>
					<td><%=perf.getSixes()%></td>
					<td><%=perf.getStrikeRate()%></td>
					<td><%=perf.getOversBowled()%></td>
					<td><%=perf.getWicketsTaken()%></td>
					<td><%=perf.getRunsConceded()%></td>
					<td><%=perf.getEconomyRate()%></td>
					<td><%=perf.getBowlingAverage()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<%
		} else {
		%>
		<p class="alert alert-warning">No performance data found for the
			selected player.</p>
		<%
		}
		}
		%>

		<!-- Chart Containers -->
		<div id="performanceTable"></div>

		<!-- Line Chart -->
		<div class="chart-container mt-5" id="lineChartContainer"
			style="display: none;">
			<h3 class="text-center">Performance Over Matches</h3>
			<canvas id="lineChart"></canvas>
		</div>

		<!-- Bar Chart -->
		<div class="chart-container mt-5" id="barChartContainer"
			style="display: none;">
			<h3 class="text-center">Performance Summary</h3>
			<canvas id="barChart"></canvas>
		</div>

		<!-- Pie Chart -->
		<div class="chart-container mt-5" id="pieChartContainer"
			style="display: none;">
			<h3 class="text-center">Performance Distribution</h3>
			<canvas id="pieChart"></canvas>
		</div>


	</div>


	<!-- Footer -->
	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved.| <a
				href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms
				of Service</a>
		</p>
	</footer>

	<script>
document.getElementById("viewGraphBtn").addEventListener("click", function() {
    var playerId = document.getElementById("player_id").value;
    if (!playerId) {
        alert("Please select a player first.");
        return;
    }
    
    fetch("getPlayerPerformanceGraph.jsp?player_id=" + playerId)
    .then(response => response.json())
    .then(data => {
        if (Object.keys(data).length === 0) {
            alert("No performance data available for this player.");
            return;
        }

        // Display each chart separately
        document.getElementById("lineChartContainer").style.display = "block";
        document.getElementById("barChartContainer").style.display = "block";
        document.getElementById("pieChartContainer").style.display = "block";
        

        createChart("lineChart", "line", data);
        createChart("barChart", "bar", data);
        createChart("pieChart", "pie", data);
        
    })
    .catch(error => console.error("Error fetching data:", error));
});

function createChart(id, type, data) {
    var ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, {
        type: type,
        data: {
            labels: Object.keys(data),
            datasets: [{
                label: "Performance Stats",
                data: Object.values(data),
                backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56", "#4CAF50", "#8E44AD", "#E74C3C", "#2ECC71"],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
}
</script>

</body>
</html>
