<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
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
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    box-sizing: border-box; /* Ensures padding does not exceed container width */
}

h1 {
    text-align: center;
    color: #333;
}

label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    color: #333;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    background-color: #f4f4f4;
    box-sizing: border-box; /* Ensures padding is included within the width */
}

button {
    width: 100%;
    padding: 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #45a049;
}

.error {
    color: red;
    font-size: 14px;
    text-align: center;
    margin-top: 10px;
}

a {
    display: inline-block;
    margin-top: 10px;
    text-align: center;
    color: #4CAF50;
    text-decoration: none;
    font-size: 14px;
}

a:hover {
    text-decoration: underline;
}
    	
    </style>
</head>
<body>

<header>
    <h1>Register</h1>
</header>

<nav>
    <a href="/home">Home</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
    <a href="/about-us">About Us</a>
</nav>

<div class="container">
    <form action="/register" method="post">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>
    <br>
    <a href="/">Back to Home</a>
</div>

</body>
</html>
