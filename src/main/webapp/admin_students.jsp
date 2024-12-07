<%@ include file="admin_navbar.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }
        h1 {
            color: #333;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        .search-bar input {
            width: 300px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            text-align: left;
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        button {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .action-buttons form {
            display: inline;
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
                    <form method="post" action="/admin/remove-student">
                        <input type="hidden" name="studentId" value="<%= student.getId() %>">
                        <button type="submit">Remove</button>
                    </form>
                    <form method="post" action="/admin/edit-student">
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
</body>
</html>
