<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <meta http-equiv="refresh" content="2;url=login.jsp">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .message {
            font-size: 20px;
            color: #333;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
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
        <div class="container-fluid">
            <a class="navbar-brand" href="MainPage.jsp"> 
                <img src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg" 
                     alt="Logo" style="height: 50px; border-radius: 10px;">
            </a>
            <span class="text-white">Champions Cricket Academy</span>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="MainPage.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About Us</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Logout Message -->
    <div class="message">You have been logged out. Redirecting to login page...</div>
    <% 
        session.invalidate(); 
    %>

    <!-- Footer -->

	<footer>
		<p>
			&copy; 2024 Champions Cricket Academy. All rights reserved.| <a
				href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms
				of Service</a>
		</p>

	</footer>
</body>
</html>
