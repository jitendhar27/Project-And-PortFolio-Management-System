<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Projects</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fa;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .container {
            padding: 20px;
        }
        .search-bar {
            text-align: center;
            margin-bottom: 30px;
        }
        .search-bar input {
            width: 300px;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            text-align: left;
            padding: 15px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(odd) {
            background-color: #f9f9f9; /* White for odd rows */
        }
        tr:nth-child(even) {
            background-color: #e0e0e0; /* Grey for even rows */
        }
        tr:hover {
            background-color: #d1d1d1; /* Darker grey on hover */
        }
        .action-buttons form {
            display: inline;
            margin: 0 5px;
        }
        .action-buttons input[type="text"],
        .action-buttons input[type="number"] {
            padding: 6px 12px;
            margin: 0 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background-color: #0056b3;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        /* Navbar Styles */
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
    </style>
    <script>
        function filterProjects() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const rows = document.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                const studentIdCell = rows[i].getElementsByTagName('td')[3];
                if (studentIdCell) {
                    const studentId = studentIdCell.textContent || studentIdCell.innerText;
                    rows[i].style.display = studentId.toLowerCase().indexOf(filter) > -1 ? '' : 'none';
                }
            }
        }
    </script>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <a href="/admin/dashboard">Dashboard</a>
        <a href="/admin/students">Manage Students</a>
        <a href="/admin/projects">Manage Projects</a>
        <a href="/admin/logout">Logout</a>
    </nav>

    <div class="container">
        <h1>Manage Projects</h1>

        <div class="search-bar">
            <input type="text" id="searchInput" onkeyup="filterProjects()" placeholder="Search by Student ID...">
            <button onclick="filterProjects()">Search</button>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Progress</th>
                    <th>Student ID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Project> projects = (List<Project>) request.getAttribute("projects");
                    for (Project project : projects) {
                %>
                <tr>
                    <td><%= project.getTitle() %></td>
                    <td><%= project.getDescription() %></td>
                    <td><%= project.getProgress() %></td>
                    <td><%= project.getStudent().getId() %></td>
                    <td class="action-buttons">
                        <form method="post" action="/admin/remove-project" style="display:inline;">
                            <input type="hidden" name="projectId" value="<%= project.getId() %>">
                            <button type="submit" title="Remove Project">
                                Remove
                            </button>
                        </form>
                        <form method="post" action="/admin/edit-project" style="display:inline;">
                            <input type="hidden" name="projectId" value="<%= project.getId() %>">
                            <div class="edit-form">
                                <input type="text" name="title" value="<%= project.getTitle() %>">
                                <input type="text" name="description" value="<%= project.getDescription() %>">
                                <input type="text" name="progress" value="<%= project.getProgress() %>">
                            </div>
                            <button type="submit" title="Edit Project">
                                Edit
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2024 Project Hub. All rights reserved.</p>
    </footer>

</body>
</html>
