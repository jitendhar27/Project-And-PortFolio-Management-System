<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Project</title>
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
    </style>
</head>
<body>
    <h2 style="text-align: center;">Add New Project</h2>
    <form action="/student/add-project" method="POST">
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
    <br>
    <div style="text-align: center;">
        <a href="/student/dashboard">Back to Dashboard</a>
    </div>
</body>
</html>
