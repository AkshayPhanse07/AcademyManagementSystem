<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Champions Cricket Academy</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
span {
	color: white;
	
}

body {
	font-family: 'Poppins', sans-serif;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
	margin: 0;
	padding: 0;
}
/* Hero Section */
.hero {
	background:
		url("https://t4.ftcdn.net/jpg/09/51/90/95/240_F_951909559_ubtNzpSCitC8Gerhc891i2LQwv51FEbC.jpg")
		no-repeat center center;
	background-size: cover;
	height: 60vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
}

.hero h1 {
	font-size: 3rem;
}

.hero p {
	font-size: 1.2rem;
}
/* Featured Services */
.services {
	padding: 50px 0;
	color: white;
}

.services .card {
	border: none;
	border-radius: 10px;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
}
/* Footer */
footer {
	background-color: black;
	color: white;
	padding: 20px 0;
	text-align: center;
}

footer a {
	color: #ffc107;
	text-decoration: none;
}

.navbar {
	position: fixed;
	top: 0;
	width: 100%;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container-fluid">
			<a class="navbar-brand" href="MainPage.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;">
			</a><span>Champions Cricket Academy</span>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						href="MainPage.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item "><a class="nav-link" href="register.jsp">Register</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
							Us</a></li>
					<li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About
							Us</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section class="hero">
		<div class="text-center">
			<h1>Welcome to Champions Cricket Academy</h1>
			<p>Your gateway to becoming the next cricketing legend.</p>
			<a href="aboutUs.jsp" class="btn btn-primary btn-lg">Learn More</a>
		</div>
	</section>

	<!-- Featured Services -->
	<section class="services container text-center ">
		<h2 class="mb-4 pb-4">Our Services</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN5a_XGJ_rRFFL0lghAgUxTPuXReLhZuJXNw&s"
						class="card-img-top" alt="Training">
					<div class="card-body">
						<h5 class="card-title">Professional Training</h5>
						<p class="card-text">Get coaching by the best professionals in
							cricket.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img
						src="data:image/jpeg;base64,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"
						class="card-img-top" alt="Equipment">
					<div class="card-body">
						<h5 class="card-title">State-of-the-Art Equipment</h5>
						<p class="card-text">Access the latest equipment for practice
							sessions.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH8sROVPKdUQWH52iyQAJKt8XKLf1NHE8vCg&s"
						class="card-img-top" alt="Tournaments">
					<div class="card-body">
						<h5 class="card-title">Regular Tournaments</h5>
						<p class="card-text">Participate in tournaments and show your
							skills.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved.| <a
				href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms
				of Service</a>
		</p>

	</footer>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
