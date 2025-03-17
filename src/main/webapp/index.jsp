<%@page import="com.example.UserServlet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    // get list of users
    List<User> users = (List<User>) request.getAttribute("users");
    if (users == null) {
        UserServlet us = new UserServlet();
        users = us.getAllUsers();
    }

    // get current date and time
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String currentDate = sdf.format(new Date());

    // count users
    int totalUsers = (users != null) ? users.size() : 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .info-bar {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background: #007bff;
            color: white;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        .btn {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
        }
        .btn-edit {
            background: #28a745;
        }
        .btn-delete {
            background: #dc3545;
        }
        .btn-add {
            background: #007bff;
            display: inline-block;
            margin: 10px 0;
            padding: 10px 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>User Management</h1>
    
    <div class="info-bar">
        <span>📅 Current Date: <%= currentDate %></span>
        <span>👥 Total Users: <%= totalUsers %></span>
    </div>
    
    <a href="add.jsp" class="btn btn-add">➕ Add New User</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <%
            for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td>
                <a href="edit.jsp?id=<%= user.getId() %>" class="btn btn-edit">✏️ Edit</a>
                <a href="users?action=delete&id=<%= user.getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure?')">🗑 Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>
