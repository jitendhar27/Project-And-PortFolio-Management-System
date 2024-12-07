<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Project</title>
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
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 500px;
            margin: 20px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        input, textarea, button {
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

<header>
    <h1>ProjectHub</h1>
</header>

<nav>
	<a href="/student/dashboard">Dashboard</a>
    <a href="/student/view-profile">View Profile</a>
    <a href="/student/view-projects">View Projects</a>
    <a href="/student/add-project">Add Project</a>
    <a href="/student/edit-profile">Edit Profile</a>
    <a href="/logout" class="logout-btn">Logout</a>
</nav>

<h2>Add New Project</h2>
<form action="/student/add-project" method="POST">
    <label for="title">Project Title:</label>
    <input type="text" id="title" name="title" required>

    <label for="description">Project Description:</label>
    <textarea id="description" name="description" rows="4" required></textarea>

    <label for="progress">Progress (%):</label>
    <input type="text" id="progress" name="progress" min="0" max="100" required>
    
    <label for="file">Upload File:</label>
    <input type="file" id="file" name="file" required>

    <label for="mediaUrl">Media URL (Optional):</label>
    <input type="url" id="mediaUrl" name="mediaUrl">

    <button type="submit">Add Project</button>
</form>

<div class="back-link">
    <a href="/student/dashboard">Back to Dashboard</a>
</div>

</body>
</html>
