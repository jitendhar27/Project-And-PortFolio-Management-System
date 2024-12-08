<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(120deg, #4CAF50, #81c784);
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
            background: #81c784;
            transform: scale(1.1);
            color: black;
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        h2 {
            color: #fff;
            font-size: 36px;
            margin-bottom: 20px;
            font-family: 'Pacifico', cursive;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 18px;
            color: #555;
        }
        th {
            background: #f4f4f9;
            color: #333;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-projects {
            text-align: center;
            margin: 20px;
        }
        .action-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            margin: 0 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .action-btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
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
    <h2>Your Profile Details</h2>
    <table>
        <tr>
            <th>Username</th>
            <td>${student.username}</td>
        </tr>
        <tr>
            <th>Full Name</th>
            <td>${student.name}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${student.email}</td>
        </tr>
    </table>

    <div class="no-projects">
        <a href="/student/edit-profile" class="action-btn">Edit Profile</a>
        <a href="/student/dashboard" class="action-btn">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
