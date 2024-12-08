<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #4CAF50, #81c784);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: #373836;
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
            background: #81c784;
            transform: scale(1.1);
            color: black;
        }
        .container {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h2 {
            color: white;
            font-size: 36px;
            margin-bottom: 20px;
            font-family: 'Pacifico', cursive;
        }
        form {
            max-width: 600px;
            width: 100%;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
        }
        form label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }
        input, button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            color: #555;
        }
        input[readonly] {
            background-color: #f4f4f9;
            color: #888;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
        a {
            text-decoration: none;
            color: #f4f4f9;
            margin-top: 15px;
            display: inline-block;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #d9e7de;
        }
    </style>
</head>
<body>

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

    <div>
        <a href="/student/dashboard">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
