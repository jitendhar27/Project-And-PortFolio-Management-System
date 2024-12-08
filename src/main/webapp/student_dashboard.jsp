<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
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
        .logout-btn {
            background-color: #f44336;
        }
        .logout-btn:hover {
            background-color: #e41f1f;
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
        .overview {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .card {
            background: white;
            color: #333;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            width: 300px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 12px 20px rgba(0, 0, 0, 0.4);
        }
        .card h4 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #4CAF50;
        }
        .card p {
            font-size: 20px;
            font-weight: bold;
        }
        .buttons {
            margin-top: 40px;
        }
        .btn {
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
        .btn:hover {
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
