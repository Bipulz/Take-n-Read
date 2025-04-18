<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* Existing styles from the previous Navbar.jsp */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        .container {
            background: #FFFFFF;
            padding: 12px 40px;
            border-bottom: 1px solid #A3BFFA;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .left, .middle, .right {
            flex: 1;
        }

        .middle {
            display: flex;
            justify-content: center;
        }

        .right {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            align-items: center;
        }

        .brand {
            display: flex;
            align-items: center;
            font-size: 26px;
            font-weight: 700;
            color: #374151;
            position: relative;
            transition: transform 0.3s ease;
        }

        .brand i {
            margin-right: 10px;
            color: #A3BFFA;
            font-size: 24px;
            animation: pulse 2s infinite ease-in-out;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }

        .brand:hover {
            transform: scale(1.02);
        }

        .brand:hover i {
            transform: rotate(5deg) scale(1.1);
            color: #7C9BF2;
        }

        .search-form {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            padding: 8px 12px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            transition: border-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
        }

        .search-form:hover, .search-form:focus-within {
            border-color: transparent;
            border-image: linear-gradient(to right, #A3BFFA, #7C9BF2) 1;
            box-shadow: 0 4px 12px rgba(163, 191, 250, 0.3);
            transform: scale(1.01);
        }

        .search-form i {
            color: #4B5563;
            font-size: 16px;
            margin-right: 8px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .search-form input:focus ~ i {
            color: #7C9BF2;
            transform: scale(1.1) rotate(10deg);
        }

        .search-form input {
            padding: 8px 0;
            border: none;
            background: transparent;
            width: 100%;
            font-size: 14px;
            color: #374151;
            outline: none;
        }

        .search-form input::placeholder {
            color: #9CA3AF;
        }

        .button {
            padding: 8px 16px;
            border: none;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
            color: #FFFFFF;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            animation: fadeIn 0.5s ease-out;
        }

        .button i {
            font-size: 16px;
            padding-right: 6px;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .login-button, .register-button, .cart-button, .search-button {
            background: linear-gradient(135deg, #6B7280, #4B5563);
        }

        .login-button i, .register-button i, .cart-button i, .search-button i {
            color: #FFFFFF;
        }

        .login-button:hover, .register-button:hover, .cart-button:hover, .search-button:hover {
            background: #4B5563;
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .login-button:hover i, .register-button:hover i, .cart-button:hover i, .search-button:hover i {
            transform: rotate(10deg);
        }

        .profile-button {
            background: linear-gradient(135deg, #A3BFFA, #7C9BF2);
        }

        .profile-button i {
            color: #FFFFFF;
        }

        .profile-button:hover {
            background: #7C9BF2;
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(163, 191, 250, 0.3);
        }

        .profile-button:hover i {
            transform: rotate(10deg);
        }

        .navbar {
            background: #6B7280;
            background-image: linear-gradient(135deg, rgba(107, 114, 128, 0.95), rgba(75, 85, 99, 0.95));
            padding: 10px 40px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            position: sticky;
            top: 0;
            z-index: 1000;
            animation: fadeIn 0.5s ease-out;
        }

        .nav-links {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 24px;
        }

        .nav-links li {
            position: relative;
        }

        .nav-links a, .nav-link-button {
            text-decoration: none;
            color: #FFFFFF;
            font-weight: 500;
            padding: 8px 16px;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 6px;
            border-radius: 20px;
            transition: background 0.3s ease, color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .nav-links a:hover, .nav-link-button:hover {
            background: #4B5563;
            color: #A3BFFA;
            transform: scale(1.05);
            box-shadow: 0 0 8px rgba(163, 191, 250, 0.3);
        }

        .nav-links a i, .nav-link-button i {
            color: #A3BFFA;
            font-size: 14px;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .nav-links a:hover i, .nav-link-button:hover i {
            transform: rotate(10deg);
            color: #FFFFFF;
        }

        .nav-link-button {
            background: transparent;
            border: none;
            cursor: pointer;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
            opacity: 1;
            transform: translateY(0) scale(1);
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background: linear-gradient(180deg, #FFFFFF, #F9FAFB);
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.2);
            list-style: none;
            padding: 12px 0;
            min-width: 200px;
            border-radius: 15px;
            border: 1px solid #E5E7EB;
            top: 100%;
            left: 0;
            z-index: 1001;
            transform: translateY(-10px) scale(0.95);
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
            animation: fadeIn 0.3s ease-out;
        }

        .dropdown-menu li {
            padding: 8px 16px;
            transition: background 0.3s ease;
        }

        .dropdown-menu a {
            color: #374151;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: 500;
            font-size: 14px;
            border-radius: 10px;
            transition: background 0.3s ease, color 0.3s ease, transform 0.2s ease;
            position: relative;
        }

        .dropdown-menu a i {
            color: #A3BFFA;
            font-size: 14px;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .dropdown-menu li:hover {
            background: #E5E7EB;
        }

        .dropdown-menu a:hover {
            color: #A3BFFA;
            transform: scale(1.02);
        }

        .dropdown-menu a:hover i {
            transform: rotate(10deg);
            color: #7C9BF2;
        }

        .dropdown-menu a[data-hover] {
            overflow: hidden;
        }

        .dropdown-menu a[data-hover]::after {
            content: attr(data-hover);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            color: #A3BFFA;
            opacity: 0;
            transition: transform 0.3s ease, opacity 0.3s ease;
            white-space: nowrap;
        }

        .dropdown-menu a[data-hover]:hover::after {
            transform: translate(-50%, -50%) scale(1);
            opacity: 1;
        }

        .dropdown-menu a[data-hover]:hover span {
            opacity: 0;
            transform: scale(0);
        }

        .dropdown-menu a span {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .right .dropdown {
            position: relative;
        }

        .right .dropdown-menu {
            top: 100%;
            right: 0;
            left: auto;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px 20px;
            }

            .row {
                flex-direction: column;
                gap: 10px;
            }

            .middle, .right {
                width: 100%;
                justify-content: center;
            }

            .search-form {
                max-width: 100%;
            }

            .navbar {
                padding: 8px 20px;
            }

            .nav-links {
                flex-direction: column;
                gap: 12px;
            }

            .nav-links a, .nav-link-button {
                font-size: 14px;
            }

            .dropdown-menu {
                position: static;
                width: 100%;
                background: #F9FAFB;
                border-radius: 10px;
                border: none;
                box-shadow: none;
            }

            .right .dropdown-menu {
                position: static;
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .brand {
                font-size: 22px;
            }

            .brand i {
                font-size: 20px;
            }

            .button, .nav-link-button {
                padding: 6px 12px;
                font-size: 13px;
            }

            .search-form {
                padding: 6px 10px;
            }

            .search-form input {
                font-size: 13px;
            }

            .search-form i {
                font-size: 14px;
            }

            .search-button {
                padding: 6px 12px;
                font-size: 13px;
            }

            .nav-links a, .nav-link-button {
                font-size: 13px;
                padding: 6px 12px;
            }

            .dropdown-menu a {
                font-size: 13px;
                padding: 6px 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="left">
                <h3 class="brand"><i class="fas fa-book"></i> Take n' Read</h3>
            </div>
            <div class="middle">
                <form class="search-form" role="search" action="${pageContext.request.contextPath}/search" method="get">
                    <i class="fas fa-search"></i>
                    <input type="search" name="query" placeholder="Search books..." aria-label="Search">
                    <button class="button search-button" type="submit"><i class="fas fa-search"></i> Search</button>
                </form>
            </div>
            <div class="right">
                <% 
                    // Use the user variable from the parent JSP if it exists; otherwise, declare it
                    User user = null;
                    if (pageContext.getAttribute("user", PageContext.PAGE_SCOPE) == null) {
                        user = (User) session.getAttribute("user");
                        pageContext.setAttribute("user", user, PageContext.PAGE_SCOPE);
                    } else {
                        user = (User) pageContext.getAttribute("user", PageContext.PAGE_SCOPE);
                    }
                    if (user == null) { 
                %>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="button login-button"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="${pageContext.request.contextPath}/register.jsp" class="button register-button"><i class="fas fa-user-plus"></i> Register</a>
                <% 
                    } else { 
                        String displayName = user.getName() != null && !user.getName().isEmpty() ? user.getName() : user.getEmail();
                %>
                    <div class="dropdown">
                        <button class="button profile-button">
                            <i class="fas fa-user"></i> <%= displayName %>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/profile.jsp" data-hover="Visit Profile"><span><i class="fas fa-user-circle"></i> Profile</span></a></li>
                            <li><hr style="border: 1px solid #E5E7EB; margin: 8px 0;"></li>
                            <li><a href="${pageContext.request.contextPath}/logout" data-hover="Logout"><span><i class="fas fa-sign-out-alt"></i> Logout</span></a></li>
                        </ul>
                    </div>
                    <a href="${pageContext.request.contextPath}/cart.jsp" class="button cart-button"><i class="fas fa-shopping-cart"></i> Cart</a>
                <% 
                    } 
                %>
            </div>
        </div>
    </div>
    <nav class="navbar">
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li class="dropdown">
                <button class="nav-link-button"><i class="fas fa-book"></i> Book <i class="fas fa-chevron-down"></i></button>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="fas fa-book-open"></i> New Book</a></li>
                    <li><a href="#"><i class="fas fa-book"></i> Old Book</a></li>
                    <li><a href="#"><i class="fas fa-clock"></i> Recent Book</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fas fa-cogs"></i> Our Services</a></li>
            <li><a href="#"><i class="fas fa-tools"></i> Manage</a></li>
            <li><a href="#"><i class="fas fa-info-circle"></i> About Us</a></li>
        </ul>
    </nav>
</body>
</html>