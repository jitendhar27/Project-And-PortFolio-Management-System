<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Before Login Dashboard</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
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
        color: #333;
        text-align: center;
    }
    .message {
        font-size: 18px;
        color: #333;
        margin-top: 20px;
        text-align: center;
    }
    .buttons {
        text-align: center;
        margin-top: 20px;
    }
    .buttons a {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin: 10px 5px;
    }
    .buttons a:hover {
        background-color: #45a049;
    }

    .about-us {
        background-color: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
    }

    .about-us p {
        font-size: 18px;
        color: #555;
    }
    .about-us h3 {
        color: #4CAF50;
    }
    .footer {
        background-color: #333;
        color: white;
        padding: 10px;
        text-align: center;
    }

</style>

</head>
<body>

<header>
    <h1>Welcome to the Student Portal</h1>
</header>

<nav>
    <a href="/home">Home</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
    <a href="/about-us">About Us</a>
</nav>

<div class="container">
    <h2>Student Portal Dashboard</h2>
    <div class="message">
        <p>Explore our portal to manage your projects, profile, and more!</p>
    </div>

    <div class="buttons">
        <a href="/login">Login</a>
        <a href="/register">Register</a>
    </div>
</div>

<div class="about-us">
    <h3>About Us</h3>
    <p>Our portal helps students track and manage their projects. Here, students can submit their work, monitor progress, and much more. Join us today and enhance your project management experience!</p>
</div>

<div class="footer">
    <p>&copy; 2024 Student Portal</p>
</div>

</body>
</html>
