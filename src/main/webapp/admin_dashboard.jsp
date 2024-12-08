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
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(120deg, #4CAF50, #81c784); /* Green gradient background */
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
        h2 {
            color: white;
            font-size: 36px;
            margin-top: 20px;
            font-family: 'Pacifico', cursive;
        }
        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 80%;
            max-width: 1200px;
            padding: 20px;
            flex-direction: column;
        }
        .dashboard-stats {
            display: flex;
            justify-content: space-between;
            flex-wrap: nowrap;  /* Prevent wrapping */
            margin-top: 20px;
            width: 100%;
        }
        .stat-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 10px;
            width: 22%; /* Ensure each card takes equal width */
            text-align: center;
            transition: transform 0.3s ease;
            flex-grow: 1;  /* Ensure all cards are of equal size */
        }
        .stat-card:hover {
            transform: scale(1.05);
        }
        .stat-card h3 {
            margin: 0;
            font-size: 28px;
            color: #4CAF50; /* Green color for headings */
        }
        .stat-card p {
            margin: 5px 0;
            font-size: 22px;
            color: #333;
        }
        footer {
            background: linear-gradient(90deg, #333333, #000000);
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            position: relative;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.2);
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

    <footer>
        <p> © Copyright 2024 by Project Hub. All Rights Reserved.</p>
    </footer>

</body>
</html>
