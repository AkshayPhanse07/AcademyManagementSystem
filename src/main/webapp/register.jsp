<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    		background-size: cover;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar-container {
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
        }

        .footer-container {
            background-color: black;
            color: white;
            padding: 20px 0;
            
            text-align: center;
            width: 100%;
            margin-top: auto;
        }

        .footer-container a {
            color: #ffc107;
            text-decoration: none;
        }

        .register-container {
            background: white;
            padding: 45px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            margin: auto;
            margin-top: 100px;
            margin-bottom:20px;
        }
    </style>
</head>
<body>
    <!-- Navbar Container -->
    <div class="navbar-container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="MainPage.jsp"> 
                    <img src="https://t3.ftcdn.net/jpg/08/34/85/38/240_F_834853812_a6yzHjzfSdIfbEb5vJoadYY8eQhofMdN.jpg" alt="Logo" style="height: 50px; border-radius: 10px;">
                </a> 
                <span style="color: white;">Champions Cricket Academy</span>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="MainPage.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link active" href="register.jsp">Register</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <!-- Registration Form Container -->
    <div class="d-flex flex-column align-items-center justify-content-center flex-grow-1">
        <div class="register-container">
            <h2>Register</h2>
            <% String msg = request.getParameter("msg"); if (msg != null && msg.equals("Registration failed")) { %>
                <div class="error-message text-danger">Registration failed. Please try again.</div>
            <% } %>
            <form action="RegisterServlet" method="post">
                <div class="form-group text-start">
                    <label>Name:</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group text-start">
                    <label>Email:</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="form-group text-start">
                    <label>Password:</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="form-group text-start">
                    <label>Role:</label>
                    <select name="role" class="form-control" required>
                        <option value="sportperson">Sportsperson</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3">Register</button>
            </form>
            <p class="login-link mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

    <!-- Footer Container -->
    <div class="footer-container">
        <p>&copy; 2024 Champions Cricket Academy. All rights reserved. | <a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
    
</body>
</html>
