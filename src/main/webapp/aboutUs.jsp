<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Champions Cricket Academy</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<style>
body {
	font-family:  'Poppins', sans-serif;
	margin: 0;
	padding-top: 60px;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
}

span {
	color: white;
}

.navbar {
	position: fixed;
	top: 0;
	width: 100%;
}

.hero {
	background:
		url('https://t3.ftcdn.net/jpg/03/94/71/15/240_F_394711534_7R2OsnrxouVw5BxqYc8TjxHI0OKigIph.jpg')
		no-repeat center center/cover;
	height: 300px;
	color: white;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.hero h1 {
	font-size: 3rem;
	margin: 0;
}

.hero p {
	font-size: 1.2rem;
	margin-top: 10px;
}

.content {
	margin: 20px auto;
	padding: 20px;
	background: white;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
}

.content h2 {
	text-align: center;
	color: #35424a;
}

.team {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	gap: 20px;
	margin-bottom:80px;
}

.team-member {
	text-align: center;
	flex: 1 1 calc(33.333% - 20px);
	background: #f9f9f9;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.team-member img {
	border-radius: 50%;
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.team-member h4 {
	margin-top: 10px;
	color: #35424a;
}

.team-member p {
	font-size: 0.9rem;
	color: #555;
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
			<a class="navbar-brand" href="MainPage.jsp">
				<img src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
					alt="Logo" style="height: 50px; border-radius: 10px;">
			</a><span>Champions Cricket Academy</span>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="MainPage.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link active" href="aboutUs1.jsp">About Us</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="hero">
		<h1>Welcome to Champions Cricket Academy</h1>
		<p>Building champions for tomorrow, one practice at a time.</p>
	</div>

	<div class="content">
		<h2>About Us</h2>
		<p>Champions Cricket Academy is dedicated to nurturing young talent and transforming them into world-class cricketers. Founded by experienced professionals and passionate cricket enthusiasts, our academy provides state-of-the-art facilities, expert coaching, and a supportive environment for players of all ages and skill levels.</p>
		<p>Our mission is to inspire and empower the next generation of cricket stars while promoting values like teamwork, discipline, and sportsmanship. Whether you're a beginner or an advanced player, we have tailored programs to help you achieve your goals.</p>
	</div>

	<div class="content">
		<h2>Meet Our Team</h2>
		<div class="team">
			<div class="team-member">
				<img src="https://via.placeholder.com/100" alt="Coach">
				<h4>John Doe</h4>
				<p>Head Coach - 20 years of experience</p>
			</div>
			<div class="team-member">
				<img src="https://via.placeholder.com/100" alt="Coach">
				<h4>Jane Smith</h4>
				<p>Fitness Trainer - Certified professional</p>
			</div>
			<div class="team-member">
				<img src="https://via.placeholder.com/100" alt="Coach">
				<h4>Mike Johnson</h4>
				<p>Bowling Coach - Former international player</p>
			</div>
		</div>
	</div>

	<footer>
		<p>&copy; 2024 Champions Cricket Academy. All rights reserved.| <a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
