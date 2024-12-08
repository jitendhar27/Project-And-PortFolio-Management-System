<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Projects</title>
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
            color: #fff;
            font-size: 36px;
            margin-bottom: 20px;
            font-family: 'Pacifico', cursive;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
            margin: 20px 0;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
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
        .action-btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            margin: 0 5px;
            cursor: pointer;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .action-btn:hover {
            transform: scale(1.05);
        }
        .edit-btn {
            background-color: #4CAF50;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
        .delete-btn {
            background-color: #f44336;
        }
        .delete-btn:hover {
            background-color: #e41f1f;
        }
        .no-projects {
            text-align: center;
            color: white;
        }
        .no-projects p {
            font-size: 18px;
        }
        .no-projects a {
            color: #f4f4f9;
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
    <a href="/logout">Logout</a>
</nav>

<div class="container">
    <h2>Your Projects</h2>
    <% 
        List<Project> projects = (List<Project>) request.getAttribute("projects");
        if (projects != null && !projects.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Progress (%)</th>
                <th>Media URL</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (Project project : projects) { %>
            <tr>
                <td><%= project.getTitle() %></td>
                <td><%= project.getDescription() %></td>
                <td><%= project.getProgress() %></td>
                <td>
                    <% if (project.getMediaUrl() != null && !project.getMediaUrl().isEmpty()) { %>
                        <a href="<%= project.getMediaUrl() %>" target="_blank">View Media</a>
                    <% } else { %>
                        N/A
                    <% } %>
                </td>
                <td>
                    <form action="/student/edit-project" method="GET" style="display:inline;">
                        <input type="hidden" name="projectId" value="<%= project.getId() %>">
                        <button type="submit" class="action-btn edit-btn">Edit</button>
                    </form>
                    <form action="/student/remove-project" method="POST" style="display:inline;">
                        <input type="hidden" name="projectId" value="<%= project.getId() %>">
                        <button type="submit" class="action-btn delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% 
        } else { 
    %>
    <div class="no-projects">
        <p>No projects found. <a href="/student/add-project">Add a new project</a></p>
    </div>
    <% } %>
</div>

</body>
</html>
