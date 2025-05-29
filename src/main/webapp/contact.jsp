<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<style>
/* Ensure full height */
 body {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	overflow-y:auto;
	flex-direction: column;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
}

/* Fixed Navbar */
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}

/* Main Content: Pushes footer down */
.content-container {
	flex-grow: 1;
	margin-top: 80px; /* Adjusted for navbar height */
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Contact Form Container */
.container {
	width: 50%;
	margin: auto;
	margin-bottom: 20px; /* Space before footer */
}

/* Contact Form Styling */
.container header {
	border-radius: 4px;
	background: #35424a;
	color: #ffffff;
	padding: 10px 0;
	text-align: center;
}

form {
	background: #ffffff;
	padding: 20px;
	border-radius: 5px;
	margin-top: 20px;
}

input[type="text"], input[type="email"], textarea {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #cccccc;
	border-radius: 5px;
}

input[type="submit"] {
	background: #35424a;
	color: #ffffff;
	border: none;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

input[type="submit"]:hover {
	background: #45a049;
}

/* Contact Details */
.contact-details {
	margin-top: 20px;
	background: #ffffff;
	padding: 20px;
	border-radius: 5px;
}

/* Footer Always at the Bottom */
footer {
	width: 100%;
	background-color: black;
	color: white;
	padding: 15px 0;
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
		<div class="container-fluid">
			<a class="navbar-brand" href="MainPage.jsp"> <img
				src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg"
				alt="Logo" style="height: 50px; border-radius: 10px;">
			</a><span style="color: white;">Champions Cricket Academy</span>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="MainPage.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
					<li class="nav-item"><a class="nav-link active" href="contact.jsp">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About Us</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Content -->
	<div class="content-container">
		<div class="container">
			<form action="submitContact.jsp" method="post">
				<header>
					<h1>Contact Us</h1>
				</header>
				<h2>Send Us a Message</h2>
				<label for="name">Name:</label>
				<input type="text" id="name" name="name" required>
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" required>
				<label for="message">Message:</label>
				<textarea id="message" name="message" rows="5" required></textarea>
				<input type="submit" value="Send">
			</form>

			<div class="contact-details">
				<h2>Contact Details</h2>
				<p><strong>Phone:</strong> +91-9372914336</p>
				<p><strong>Email:</strong> championsCricket@gmail.com</p>
				<p><strong>Address:</strong> Pimparipada, Malad(East), Mumbai 400097</p>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved. |
			<a href="privacy.jsp">Privacy Policy</a> |
			<a href="terms.jsp">Terms of Service</a>
		</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
