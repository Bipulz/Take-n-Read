<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - ReadSphere</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
    </style>
</head>
<body>
    <h1>Welcome, <%= ((model.User) session.getAttribute("user")).getName() %>!</h1>
    <p>You have successfully logged in.</p>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</body>
</html>