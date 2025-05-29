<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sportsperson Dashboard</title>
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
					<li class="nav-item"><a class="nav-link active"
						href="sportpersonDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="trainingRegistrationForm.jsp">Application</a></li>
					<li class="nav-item"><a class="nav-link"
						href="applicationHistory.jsp">Application History</a></li>
					<li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
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