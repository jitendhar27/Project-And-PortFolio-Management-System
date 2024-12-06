<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
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
    </style>
</head>
<body>
    <h2 style="text-align: center;">Edit Profile</h2>
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
    <br>
    <div style="text-align: center;">
        <a href="/student/dashboard">Back to Dashboard</a>
    </div>
</body>
</html>
