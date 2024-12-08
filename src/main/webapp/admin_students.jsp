<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students</title>
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
        .action-buttons input[type="email"] {
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
        function filterStudents() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll(".student-row");

            rows.forEach(row => {
                const username = row.querySelector(".username").textContent.toLowerCase();
                if (username.includes(input)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
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
        <h1>Manage Students</h1>

        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search by username..." onkeyup="filterStudents()">
        </div>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Student> students = (List<Student>) request.getAttribute("students");
                    for (Student student : students) {
                %>
                <tr class="student-row">
                    <td><%= student.getName() %></td>
                    <td><%= student.getEmail() %></td>
                    <td class="username"><%= student.getUsername() %></td>
                    <td class="action-buttons">
                        <form method="post" action="/admin/remove-student" style="display:inline;">
                            <input type="hidden" name="studentId" value="<%= student.getId() %>">
                            <button type="submit">Remove</button>
                        </form>
                        <form method="post" action="/admin/edit-student" style="display:inline;">
                            <input type="hidden" name="studentId" value="<%= student.getId() %>">
                            <input type="text" name="name" value="<%= student.getName() %>" required>
                            <input type="email" name="email" value="<%= student.getEmail() %>" required>
                            <button type="submit">Edit</button>
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
