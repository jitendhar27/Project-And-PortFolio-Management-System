<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-align: center;
        }
        nav {
            background-color: #333;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #575757;
        }
        .container {
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 500px;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<header>
    <h1>ProjectHub</h1>
</header>

<!-- Navbar -->
<nav>
	<a href="/student/dashboard">Dashboard</a>
    <a href="/student/view-profile">View Profile</a>
    <a href="/student/view-projects">View Projects</a>
    <a href="/student/add-project">Add Project</a>
    <a href="/student/edit-profile">Edit Profile</a>
    <a href="/logout">Logout</a>
</nav>

<div class="container">
    <h2>Edit Profile</h2>
    <form action="/student/edit-profile" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${student.username}" readonly>

        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" value="${student.name}" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${student.email}" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="${student.password}" required>

        <button type="submit">Save Changes</button>
    </form>

    
    <div style="text-align: center;">
        <a href="/student/dashboard">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
