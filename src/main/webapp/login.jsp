<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: 'Poppins', sans-serif;
    background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
    margin: 0;
    overflow-y: auto;
}

.navbar-container {
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 1000;
}

.login-container {
    background: white;
    padding: 45px;
    margin-top: 100px;
    margin-bottom: 50px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px;
    text-align: center;
}

footer {
    width: 100%;
    background-color: black;
    color: white;
    padding: 20px 0;
    text-align: center;
    position: relative;
    bottom: 0;
}

footer a {
    color: #ffc107;
    text-decoration: none;
}

.form-group {
    text-align: left;
    margin-bottom: 15px;
}

.btn-primary {
    width: 100%;
}

.error-message {
    color: red;
    margin-bottom: 10px;
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
                <span class="text-white">Champions Cricket Academy</span>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="MainPage.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    
    <!-- Login Container -->
    <div class="login-container">
        <h2>Login</h2>
        <% String msg = request.getParameter("msg"); %>
        <% if (msg != null && msg.equals("Invalid credentials")) { %>
            <div class="error-message">Invalid email or password. Please try again.</div>
        <% } %>
        
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Role:</label>
                <select name="role" class="form-control" required>
                    <option value="sportperson">Sportsperson</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <p class="register-link">Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
    
    <!-- Footer Container -->
    <footer>
        <p>
            &copy; 2024 Champions Cricket Academy. All rights reserved. | <a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a>
        </p>
    </footer>
</body>
</html>
