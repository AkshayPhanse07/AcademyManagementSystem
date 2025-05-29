<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Complete Registration Form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
	margin: 0;
	padding: 0;
}
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}
.container {
	background: white;
	width: 80%;
	max-width: 900px;
	margin-top: 100px;
	margin-bottom: 96px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	background: #a6f09d;
	padding: 10px;
	border-radius: 5px;
	color: black;
}

.section {
	margin: 20px 0;
	padding: 10px;
	border-radius: 5px;
}

h3 {
	font-size: 18px;
	font-weight: bold;
	padding: 5px;
}

.form-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-bottom: 10px;
}

.form-group label {
	flex: 1;
	font-size: 14px;
	font-weight: bold;
}

.form-group input, .form-group select {
	flex: 2;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
}

.radio-group {
	flex: 2;
	display: flex;
	gap: 10px;
	align-items: center;
}

.submit-btn {
	background-color: #17731d;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	display: block;
	width: 100px;
	margin: 20px auto;
}

.submit-btn:hover {
	background-color: #145417;
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
					<li class="nav-item"><a class="nav-link "
						href="sportpersonDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
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

	<div class="container">
		<h2>Complete Registration Form</h2>

		<form action="TrainingApplicationServlet?action=insert"
			method="POST">
			<div class="section">
				<h3>Basic Information</h3>
				<div class="form-group">
					<label>First Name</label> <input type="text" name="firstName"
						required> <label>Last Name</label> <input type="text"
						name="lastName" required>
				</div>
				<div class="form-group">
					<label>Gender</label>
					<div class="radio-group">
						<input type="radio" name="gender" value="Male"> Male <input
							type="radio" name="gender" value="Female"> Female
					</div>
					<label>Date of Birth</label> <input type="date" name="dob" required>
				</div>
				<div class="form-group">
					<label>Father Name</label> <input type="text" name="fatherName">
					<label>Mother Name</label> <input type="text" name="motherName">
				</div>
				<div class="form-group">
					<label>Email</label> <input type="email" name="email" required>
					<label>Phone Number</label> <input type="tel" name="phone" required>
				</div>
				<div class="form-group">
					<label>Age</label> <input type="number" name="age" min="1" required>
					<label>Address</label> <input type="text" name="address" required>
				</div>
				<div class="form-group">
					<label>Nationality</label> <input type="text" name="nationality"
						required>
				</div>

			</div>

			<div class="section">
				<h3>Sport Details - Cricket</h3>
				<div class="form-group">
					<label>Primary Role</label> <select name="primaryRole">
						<option>Batsman</option>
						<option>Bowler</option>
						<option>All-Rounder</option>
						<option>Wicketkeeper</option>
					</select> <label>Batting Style</label> <select name="battingStyle">
						<option>Right-Handed</option>
						<option>Left-Handed</option>
					</select>
				</div>
				<div class="form-group">
					<label>Bowling Style</label> <select name="bowlingStyle">
						<option>Right-Arm Fast</option>
						<option>Right-Arm Medium</option>
						<option>Right-Arm Off Spin</option>
						<option>Left-Arm Fast</option>
						<option>Left-Arm Medium</option>
						<option>Left-Arm Orthodox Spin</option>
					</select> <label>Preferred Fielding Position</label> <select
						name="fieldingPosition">
						<option>Slip</option>
						<option>Point</option>
						<option>Cover</option>
						<option>Mid-Wicket</option>
						<option>Long-On</option>
						<option>Long-Off</option>
						<option>Wicketkeeper</option>
					</select>
				</div>
				<div class="form-group">
					<label>Cricket Experience (Years)</label> <input type="number"
						name="experience" min="0"> <label>Highest Level
						Played</label> <select name="highestLevel">
						<option>Local Club</option>
						<option>District</option>
						<option>State</option>
						<option>National</option>
						<option>International</option>
					</select>
				</div>
			</div>

			<div class="section">
				<h3>Academic Details</h3>
				<div class="form-group">
					<label>Highest Qualification</label> <select name="qualification">
						<option>Select Qualification</option>
						<option>High School</option>
						<option>Intermediate (12th)</option>
						<option>Diploma</option>
						<option>Bachelors Degree</option>
						<option>Masters Degree</option>
						<option>PhD</option>
						<option>Other</option>
					</select> <label>School/College Name</label> <input type="text"
						name="schoolName">
				</div>
				<div class="form-group">
					<label>Year of Passing</label> <input type="number"
						name="passingYear" min="1900" max="2099"> <label>Percentage/Grade</label>
					<input type="text" name="percentage">
				</div>
				<div class="form-group">
					<label>Are you currently studying?</label>
					<div class="radio-group">
						<input type="radio" name="studying" value="Yes"> Yes <input
							type="radio" name="studying" value="No"> No
					</div>
					<label>Preferred Training Time</label> <select name="trainingTime">
						<option>Select Training Time</option>
						<option>Morning</option>
						<option>Afternoon</option>
						<option>Evening</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label>Application Date</label> <input type="date"
					name="application_date" required>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</form>
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
