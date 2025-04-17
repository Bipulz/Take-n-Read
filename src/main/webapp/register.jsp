<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ReadSphere</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap">
    <style>
       
        .register-page {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #F9FAFB 0%, #E5E7EB 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .register-page .search-form {
            max-width: 450px;
            width: 100%;
            padding: 8px;
            border-radius: 25px;
            background: #E5E7EB;
            border: 2px solid #A3BFFA;
            display: flex;
            align-items: center;
        }

        .register-page .search-form input {
            padding: 10px 15px 10px 40px;
            font-size: 15px;
            border: none;
            background: transparent;
            width: 100%;
            color: #374151;
            font-family: 'Roboto', sans-serif;
            outline: none;
        }

        .register-page .search-form input::placeholder {
            color: #9CA3AF;
        }

        .register-page .search-form input:focus {
            background: #FFFFFF;
            box-shadow: none;
        }

        .register-page .form-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            width: 100%;
            max-width: 450px;
            margin: 2rem auto;
            background: #FFFFFF;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.04);
            transition: transform 0.3s ease;
        }

        .register-page .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.1);
        }

        .register-page .form-container form {
            width: 100%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .register-page .form-container .form-group {
            text-align: left;
        }

        .register-page .form-container .form-group label {
            font-size: 15px;
            font-weight: 500;
            color: #374151;
            display: block;
            margin-bottom: 8px;
        }

        .register-page .form-container .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
            background: #F3E8FF;
            border-radius: 10px;
            padding: 0 15px;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }

        .register-page .form-container .input-wrapper:hover {
            background: #E5E7EB;
            box-shadow: 0 0 8px rgba(163, 191, 250, 0.7);
        }

        .register-page .form-container .input-wrapper i {
            color: #6B7280;
            font-size: 18px;
            margin-right: 12px;
        }

        .register-page .form-container .form-group input[type="text"],
        .register-page .form-container .form-group input[type="email"],
        .register-page .form-container .form-group input[type="tel"],
        .register-page .form-container .form-group input[type="password"] {
            width: 100%;
            padding: 12px 0;
            border: none;
            background: transparent;
            font-size: 16px;
            color: #374151;
            outline: none;
        }

        .register-page .form-container .form-group input::placeholder {
            color: #9CA3AF;
        }

        .register-page .form-container .form-group input:focus {
            background: transparent;
            box-shadow: 0 0 0 2px #A3BFFA;
        }

        .register-page .form-container .form-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #A3BFFA;
            margin-right: 10px;
        }

        .register-page .form-container .form-btn {
            background: linear-gradient(90deg, #A3BFFA 0%, #7C9BF2 100%);
            color: #FFFFFF;
            padding: 14px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }

        .register-page .form-container .form-btn:hover {
            background: linear-gradient(90deg, #7C9BF2 0%, #A3BFFA 100%);
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(163, 191, 250, 0.7);
        }

        .register-page .form-container .message {
            text-align: center;
            margin-bottom: 10px;
            font-size: 14px;
            color: #374151;
        }

        @media (max-width: 480px) {
            .register-page .form-container {
                padding: 25px;
            }

            .register-page .form-container form {
                padding: 25px;
            }

            .register-page .form-container .form-group input {
                font-size: 15px;
            }

            .register-page .form-container .form-btn {
                font-size: 15px;
                padding: 12px;
            }
        }
    </style>
</head>
<body class="register-page">
 <%@include file="view/Navbar.jsp" %>

    <div class="form-container">
        <% 
            String errorMessage = (String) session.getAttribute("errorMessage");
            String successMessage = (String) session.getAttribute("successMessage");
            if (errorMessage != null) {
        %>
            <p class="message" style="color: #EF4444;"><%= errorMessage %></p>
        <% 
                session.removeAttribute("errorMessage");
            } 
            if (successMessage != null) {
        %>
            <p class="message" style="color: #10B981;"><%= successMessage %></p>
        <% 
                session.removeAttribute("successMessage");
            } 
        %>
        <form action="register" method="post">
            <div class="form-group">
                <label for="full-name">Full Name</label>
                <div class="input-wrapper">
                    <i class="fas fa-user"></i>
                    <input 
                        type="text" 
                        id="full-name" 
                        name="fname"
                        value="<%= request.getParameter("fname") != null ? request.getParameter("fname") : "" %>"
                        required
                    >
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-wrapper">
                    <i class="fas fa-envelope"></i>
                    <input 
                        type="email" 
                        id="email" 
                        name="email"
                        value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                        required
                    >
                </div>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <div class="input-wrapper">
                    <i class="fas fa-phone"></i>
                    <input 
                        type="tel" 
                        id="phone" 
                        name="phno"
                        value="<%= request.getParameter("phno") != null ? request.getParameter("phno") : "" %>"
                        required
                    >
                </div>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <i class="fas fa-lock"></i>
                    <input 
                        type="password" 
                        id="password" 
                        name="password"
                        required
                    >
                </div>
            </div>
            <div class="form-group">
                <input 
                    type="checkbox" 
                    id="accept-terms" 
                    name="acceptTerms"
                >
                <label for="accept-terms">I accept the terms and conditions</label>
            </div>
            <button type="submit" class="form-btn">Register</button>
        </form>
    </div>
</body>
</html>