<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReadSphere</title>
    <!-- Font Awesome CDN with a local fallback -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" 
          onerror="this.onerror=null; this.href='${pageContext.request.contextPath}/css/fontawesome/all.min.css';">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Navbar CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css?v=4">
</head>
<body>
    <!-- Upper Navbar -->
    <div class="container">
        <div class="row">
            <div class="left">
                <h3 class="brand">Take n' Read</h3>
            </div>
            <div class="middle">
                <form class="search-form" role="search" action="${pageContext.request.contextPath}/search" method="get">
                    <input type="search" name="query" placeholder="Search books..." aria-label="Search">
                    <button class="button search-button" type="submit"><i class="fas fa-search"></i> Search</button>
                </form>
            </div>
            <div class="right">
                <a href="${pageContext.request.contextPath}/login.jsp" class="button login-button"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="${pageContext.request.contextPath}/register.jsp" class="button register-button"><i class="fas fa-user-plus"></i> Register</a>
            </div>
        </div>
    </div>

    <!-- Main Navbar -->
    <nav class="navbar">
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li class="dropdown">
                <a href="#">Book</a>
                <ul class="dropdown-menu">
                    <li><a href="#">New Book</a></li>
                    <li><a href="#">Old Book</a></li>
                    <li><a href="#">Recent Book</a></li>
                </ul>
            </li>
            <li><a href="#">Our Services</a></li>
            <li><a href="#">About Us</a></li>
        </ul>
    </nav>
</body>
</html>