<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Project</title>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #4CAF50, #81c784);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #373836;
        }
        nav {
            background: rgba(0, 0, 0, 0.8);
            display: flex;
            justify-content: center;
            padding: 10px 0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            width: 100%;
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
        h2 {
            color: white;
            font-size: 36px;
            margin-top: 20px;
            font-family: 'Pacifico', cursive;
        }
        form {
            max-width: 600px;
            width: 100%;
            margin: 20px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        }
        form label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }
        input, textarea, button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            color: #555;
        }
        input[type="file"] {
            border: none;
            background-color: #f4f4f9;
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
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #4CAF50;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
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
    <a href="/logout" class="logout-btn">Logout</a>
</nav>

<h2>Add New Project</h2>
<form action="/student/add-project" method="POST" enctype="multipart/form-data">
    <label for="title">Project Title:</label>
    <input type="text" id="title" name="title" required>

    <label for="description">Project Description:</label>
    <textarea id="description" name="description" rows="4" required></textarea>

    <label for="progress">Progress (%):</label>
    <input type="text" id="progress" name="progress" min="0" max="100" required>

    <label for="mediaUrl">Media URL (Optional):</label>
    <input type="url" id="mediaUrl" name="mediaUrl">

    <button type="submit">Add Project</button>
</form>

<div class="back-link">
    <a href="/student/dashboard">Back to Dashboard</a>
</div>

</body>
</html>
