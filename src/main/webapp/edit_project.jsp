<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Project</title>
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
            text-align: center;
            color: #333;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input, textarea, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        textarea {
            resize: vertical;
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
        .cancel-btn {
            background-color: #f44336;
        }
        .cancel-btn:hover {
            background-color: #e41f1f;
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
    <a href="/logout">Logout</a>
</nav>

<div class="container">
    <h2>Edit Project</h2>
    <form action="/student/update-project" method="POST">
        <input type="hidden" name="projectId" value="<%= request.getAttribute("projectId") %>">

        <label for="title">Project Title:</label>
        <input type="text" id="title" name="title" value="<%= request.getAttribute("projectTitle") %>" required>

        <label for="description">Project Description:</label>
        <textarea id="description" name="description" rows="5" required><%= request.getAttribute("projectDescription") %></textarea>

        <label for="progress">Progress (%):</label>
        <input type="number" id="progress" name="progress" min="0" max="100" value="<%= request.getAttribute("projectProgress") %>" required>

        <label for="mediaUrl">Media URL:</label>
        <input type="url" id="mediaUrl" name="mediaUrl" value="<%= request.getAttribute("projectMediaUrl") %>">

        <button type="submit">Save Changes</button>
        <a href="/student/view-projects" class="cancel-btn" style="text-decoration: none; color: white; padding: 10px; display: inline-block;">Cancel</a>
    </form>
</div>

</body>
</html>
