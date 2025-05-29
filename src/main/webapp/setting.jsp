<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sportsperson Dashboard</title>
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
}

.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
}

.footer {
    position: fixed;
    bottom: 0;
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

/* Main Content - Scrollable */
.main-content {
    flex: 1;
    overflow-y: auto;
    margin-top: 80px;  /* Space for navbar */
    margin-bottom: 80px; /* Space for footer */
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Container Box */
.container {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
}

h2 {
    margin-bottom: 20px;
    font-weight: 600;
}

label {
    display: block;
    text-align: left;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px;
    width: 100%;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #45a049;
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="sportpersonDashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="trainingRegistrationForm.jsp">Application</a></li>
                    <li class="nav-item"><a class="nav-link" href="applicationHistory.jsp">Application History</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link active" href="setting.jsp">Settings</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact1.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="aboutUs1.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h2>Change Password</h2>
            <form action="ChangePasswordServlet" method="post">
                <label>Email:</label>
                <input type="email" name="email" required>
                
                <label>Old Password:</label>
                <input type="password" name="oldPassword" required>
                
                <label>New Password:</label>
                <input type="password" name="newPassword" required>
                
                <button type="submit">Change Password</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>
            &copy; 2024 Champions Cricket Academy. All rights reserved. | 
            <a href="privacy.jsp">Privacy Policy</a> | 
            <a href="terms.jsp">Terms of Service</a>
        </p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
