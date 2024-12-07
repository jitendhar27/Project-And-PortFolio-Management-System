<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Projects</title>
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
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
            margin: 20px;
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
    <h2>Your Projects</h2>
    <% 
        // Get the list of projects from the request attribute
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
