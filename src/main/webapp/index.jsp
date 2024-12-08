<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Before Login Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> <!-- Added font link -->
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(120deg, #4CAF50, #81c784); /* Green gradient background */
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        color: rgb(55, 56, 54);
    }
    nav {
        background: rgba(0, 0, 0, 0.9);
        display: flex;
        justify-content: center;
        padding: 10px 0;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    }
    nav a {
        color: white;
        text-decoration: none;
        margin: 0 15px;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }
    nav a:hover {
        background: #81c784; /* Light green on hover */
        transform: scale(1.1);
        color: black;
    }
    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .center-box {
        background: white;
        color: #333;
        border-radius: 15px;
        padding: 50px;
        width: 700px;
        text-align: center;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
        animation: slideIn 1s ease-in-out;
    }
    @keyframes slideIn {
        from {
            transform: translateY(50px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
    .center-box h2 {
        font-size: 38px;
        margin-bottom: 20px;
        color: #4CAF50; /* Green color for heading */
        font-family: 'Pacifico', cursive; /* Applied the same font */
    }
    .center-box .message {
        font-family: 'Times New Roman', serif; /* Updated font-family */
        font-size: 24px;
        color: #000000; /* Dark black color */
        margin: 20px 0;
    }
    .center-box .buttons {
        margin-top: 20px;
    }
    .center-box .buttons a {
        padding: 15px 30px;
        background: linear-gradient(90deg, #000000, #4CAF50); /* Green gradient button */
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin: 10px;
        font-size: 16px;
        font-weight: bold;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .center-box .buttons a:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        background: #81c784; /* Light green on hover */
        color: black;
    }
    .footer {
        background: linear-gradient(90deg, #333333, #000000);
        color: white;
        text-align: center;
        padding: 1px;
        font-size: 14px;
        box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.2);
    }
    </style>
</head>
<body>

<nav>
    <a href="/home">Home</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
    <a href="/about-us">About Us</a>
</nav>

<div class="container">
    <div class="center-box">
        <h2>Projects & Portfolios</h2>
        <div class="message">
            <p>Explore our portal to manage your projects, profile, and more!</p>
        </div>
        <div class="buttons">
            <a href="/login">Login</a>
            <a href="/register">Register</a>
        </div>
    </div>
</div>

<div class="footer">
    <p> © Copyright 2024 by Project Hub. All Rights Reserved.</p>
</div>
</body>
</html>