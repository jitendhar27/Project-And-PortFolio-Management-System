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
        h2, h3 {
            color: #333;
            text-align: center;
        }
        .container {
            padding: 20px;
            width: 90%;
            margin: 0 auto;
        }
        .overview {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            width: 300px;
            margin: 10px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .card h4 {
            color: #4CAF50;
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
            display: inline-block;
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

<div class="container">
    <!-- Projects Overview Section -->
    <h2>Projects Overview</h2>
    <div class="overview">
        <% 
            List<Project> projects = (List<Project>) request.getAttribute("projects");
            int totalProjects = (projects != null) ? projects.size() : 0;
            int completedProjects = 0;
            int inProgressProjects = 0;

            if (projects != null) {
                for (Project project : projects) {
                    if ("Completed".equalsIgnoreCase(project.getProgress())) {
                        completedProjects++;
                    } else {
                        inProgressProjects++;
                    }
                }
            }
        %>
        <div class="card">
            <h4>Total Projects</h4>
            <p><%= totalProjects %></p>
        </div>
        <div class="card">
            <h4>Completed Projects</h4>
            <p><%= completedProjects %></p>
        </div>
        <div class="card">
            <h4>Projects in Progress</h4>
            <p><%= inProgressProjects %></p>
        </div>
    </div>

    <!-- Buttons Section -->
    <div class="buttons">
        <a href="/student/add-project" class="btn">Add New Project</a>
        <a href="/student/view-projects" class="btn">View All Projects</a>
    </div>
</div>

</body>
</html>
