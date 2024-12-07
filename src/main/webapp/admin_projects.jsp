<%@ include file="admin_navbar.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Project" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Projects</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: white;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9f5ff;
        }
        .search-bar {
            margin: 20px auto;
            text-align: center;
        }
        .search-bar input[type="text"] {
            width: 300px;
            padding: 10px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease-in-out;
        }
        .search-bar input[type="text"]:focus {
            border-color: #007bff;
        }
        .search-bar button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }
        .search-bar button:hover {
            background-color: #0056b3;
        }
        .action-buttons button {
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            padding: 5px;
        }
        .action-buttons button:hover {
            color: #0056b3;
        }
        .edit-form input[type="text"] {
            padding: 8px;
            width: 200px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
    <h1>Manage Projects</h1>

    <div class="search-bar">
        <input type="text" id="searchInput" onkeyup="filterProjects()" placeholder="Search by Student ID...">
        <button onclick="filterProjects()">Search</button>
    </div>

    <table>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Progress</th>
            <th>Student ID</th>
            <th>Actions</th>
        </tr>
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
    </table>
</body>
</html>
