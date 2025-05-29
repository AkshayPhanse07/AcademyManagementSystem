<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Sportsperson</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Add Sportsperson from Application</h2>

    <form action="AddSportpersonServlet" method="post" class="mt-4">
        <div class="form-group">
            <label for="applicationId">Enter Application ID:</label>
            <input type="text" class="form-control" id="applicationId" name="applicationId" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Sportsperson</button>
    </form>

    <a href="registration.jsp" class="btn btn-secondary">Back to Registration</a>
</div>

</body>
</html>
