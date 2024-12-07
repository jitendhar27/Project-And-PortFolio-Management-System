<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
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
    <h1>About Us</h1>
</header>

<nav>
    <a href="/home">Home</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
    <a href="/about-us">About Us</a>
</nav>

<div class="container">
    <h2>About the Student Portal</h2>
    <p>Our portal is designed to provide a comprehensive project tracking and portfolio management system for students. With an easy-to-use interface, students can manage their profiles, add projects, track progress, and collaborate on projects.</p>
    <p>We aim to help students stay organized, keep track of their academic projects, and build a professional portfolio that can be shared with potential employers.</p>

    <div class="about-us">
        <h3>Our Vision</h3>
        <p>Our vision is to empower students to manage their academic projects effectively, helping them grow professionally and academically.</p>
    </div>
</div>

<div class="footer">
    <p>&copy; 2024 Student Portal</p>
</div>

</body>
</html>
