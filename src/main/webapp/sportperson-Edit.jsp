<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit SportPerson</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: 'Poppins', sans-serif;
    background: url('https://t4.ftcdn.net/jpg/08/40/03/97/360_F_840039763_PA1RtJjX0z0m7bT1VbKgwJtB4AUFCG2h.jpg') no-repeat center center fixed;
    background-size: cover;
    color: white;
    margin: 0;
    padding: 0;
}

.navbar {
	font-size: 20px;
	gap: 12px;
	position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
    
}
.container {
	margin:100px 30px;
	
}

.table {
    background-color: white;
    color: black;
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
        <a class="navbar-brand" href="sportperson-list.jsp">&lt;</a>
        <a class="navbar-brand" href="#">Champions Cricket Academy</a>
    </nav>
    <div class="container ">
        <h1 class="mb-4 text-center">Edit SportPerson</h1>

        <form action="sportperson?action=update" method="post">
            <!-- SportpersonId field is used as identifier and should be hidden -->
            <input type="hidden" name="sportpersonid" value="${sportperson.sportpersonid}">

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${sportperson.name}" required>
            </div>
            
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" class="form-control" required>
                    <option value="Male" ${sportperson.gender == 'Male' ? 'selected' : ''}>Male</option>
                    <option value="Female" ${sportperson.gender == 'Female' ? 'selected' : ''}>Female</option>
                    <option value="Other" ${sportperson.gender == 'Other' ? 'selected' : ''}>Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" class="form-control" value="${sportperson.dob}" required>
            </div>

            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" class="form-control" value="${sportperson.age}" required>
            </div>

            

            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" class="form-control" required>
                    <option value="Batting" ${sportperson.status == 'Batting' ? 'selected' : ''}>Batting</option>
                    <option value="Bowling" ${sportperson.status == 'Bowling' ? 'selected' : ''}>Bowling</option>
                    <option value="All Rounder" ${sportperson.status == 'All Rounder' ? 'selected' : ''}>All Rounder</option>
                </select>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${sportperson.email}" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" class="form-control" value="${sportperson.phone}" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" class="form-control" value="${sportperson.address}" required>
            </div>

            <div class="form-group">
                <label for="nationality">Nationality:</label>
                <input type="text" id="nationality" name="nationality" class="form-control" value="${sportperson.nationality}" required>
            </div>

            <button type="submit" class="btn btn-primary">Update SportPerson</button>
            <a href="sportperson-list.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

    <footer>
        <p>
            &copy; 2024 Champions Cricket Academy. All rights reserved.| 
            <a href="privacy.jsp">Privacy Policy</a> | 
            <a href="terms.jsp">Terms of Service</a>
        </p>
    </footer>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
