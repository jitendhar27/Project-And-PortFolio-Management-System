<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .project-list {
            list-style-type: none;
            padding: 0;
        }
        .project-list li {
            background-color: #fff;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .project-list li a {
            color: #4CAF50;
            text-decoration: none;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 10px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .logout-btn {
            background-color: #f44336;
        }
        .logout-btn:hover {
            background-color: #e41f1f;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to the Student Dashboard</h1>
</header>

<div class="container">
    <!-- Display student details -->
    <h2>Student Details</h2>
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

    <!-- Display the list of projects -->
    <h3>Your Projects:</h3>
    <ul class="project-list">
        <% 
            // Get the list of projects from the request attribute
            List<Project> projects = (List<Project>) request.getAttribute("projects");
            if (projects != null && !projects.isEmpty()) {
                for (Project project : projects) {
        %>
        <li>
            <strong><%= project.getTitle() %></strong><br>
            Description: <%= project.getDescription() %><br>
            Progress: <%= project.getProgress() %><br>
            Project Id: <%= project.getId() %>
            Media URL: <a href="<%= project.getMediaUrl() %>" target="_blank"><%= project.getMediaUrl() %></a><br>
            <!-- Add Remove Button -->
            <form action="/student/remove-project" method="POST" style="display:inline;">
			    <input type="hidden" name="projectId" value="<%= project.getId() %>">
			    <button type="submit" class="btn" style="background-color: #f44336;">Remove</button>
			</form>


        </li>
        <% 
                }
            } else {
        %>
        <li>No projects found. <a href="/student/create-project" class="btn">Add a Project</a></li>
        <% 
            }
        %>
    </ul>
    <!-- Edit Profile and Logout Links -->
    <div class="buttons">
        <a href="/student/edit-profile" class="btn">Edit Profile</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>
    <div style="text-align: center; margin: 20px;">
	    <a href="/student/add-project" style="padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px;">Add New Project</a>
	</div>
    
</div>

</body>
</html>
