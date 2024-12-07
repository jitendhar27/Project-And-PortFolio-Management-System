<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_navbar.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>
<%@ page import="com.klef.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .dashboard-stats {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .stat-card {
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 10px;
            width: 250px;
            text-align: center;
        }
        .stat-card h2 {
            margin: 0;
            font-size: 36px;
            color: #007bff;
        }
        .stat-card p {
            margin: 5px 0;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Admin Dashboard</h2>

    <%
        // Fetching the students list from the request
        List<Student> students = (List<Student>) request.getAttribute("students");

        // Initialize project counters
        int totalProjects = 0;
        int ongoingProjects = 0;
        int completedProjects = 0;

        // Calculate project stats
        if (students != null) {
            for (Student student : students) {
                List<Project> projects = student.getProjects();
                if (projects != null) {
                    totalProjects += projects.size();
                    for (Project project : projects) {
                        if ("Ongoing".equals(project.getProgress())) {
                            ongoingProjects++;
                        } else if ("Completed".equals(project.getProgress())) {
                            completedProjects++;
                        }
                    }
                }
            }
        }
    %>

    <!-- Dashboard Stats -->
    <div class="dashboard-stats">
        <div class="stat-card">
            <h3>Total Students</h3>
            <p><%= students != null ? students.size() : 0 %></p>
        </div>
        <div class="stat-card">
            <h3>Total Projects</h3>
            <p><%= totalProjects %></p>
        </div>
        <div class="stat-card">
            <h3>Ongoing Projects</h3>
            <p><%= ongoingProjects %></p>
        </div>
        <div class="stat-card">
            <h3>Completed Projects</h3>
            <p><%= completedProjects %></p>
        </div>
    </div>
</div>

</body>
</html>
