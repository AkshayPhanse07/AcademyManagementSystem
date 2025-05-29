<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Changed Successfully</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            
            
        }

        .success-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 40%;
            text-align: center;
        }

        h2 {
            color: #4CAF50;
        }

        .btn-custom {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
            border: none;
        }

        .btn-custom:hover {
            background-color: #45a049;
        }

        footer {
            width: 100%;
            position: fixed;
            bottom: 0;
            background-color: black;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        footer a {
            color: #ffc107;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
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
                     <span class="text-white">Champions Cricket Academy</span>
            </a>
            
        </div>
        
    </nav>

    <!-- Success Container -->
    <div class="success-container">
        <h2 class="text-success">Password Changed Successfully!</h2>
        <p>Your password has been updated. Please log in with your new credentials.</p>
        <a href="sportpersonDashboard.jsp" class="btn btn-custom">Go to Dashboard</a>
    </div>

    <!-- Footer -->
    <footer>
        <p>
            &copy; 2024 Champions Cricket Academy. All rights reserved. | 
            <a href="privacy.jsp">Privacy Policy</a> | 
            <a href="terms.jsp">Terms of Service</a>
        </p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
