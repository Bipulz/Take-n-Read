<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ReadSphere</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap">
    <style>
        .register-page {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #FFFFFF;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .register-page .search-form {
            max-width: 450px;
            width: 90%;
            padding: 10px;
            border-radius: 50px;
            background: #F7F7F9;
            border: 1px solid #D1D5DB;
            display: flex;
            align-items: center;
            margin: 1.5rem auto;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .register-page .search-form:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .register-page .search-form input {
            padding: 12px 15px 12px 45px;
            font-size: 16px;
            border: none;
            background: transparent;
            width: 100%;
            color: #1F2A44;
            font-family: 'Roboto', sans-serif;
            outline: none;
        }

        .register-page .search-form input::placeholder {
            color: #6B7280;
        }

        .register-page .search-form input:focus {
            background: #FFFFFF;
            border-radius: 50px;
            box-shadow: 0 0 0 2px #3B82F6;
        }

        .register-page .form-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 15px;
            width: 100%;
            max-width: 480px;
            margin: 2rem auto;
            background: #FFFFFF;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .register-page .form-container:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
        }

        .register-page .form-container form {
            width: 100%;
            padding: 35px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .register-page .form-container .form-group {
            text-align: left;
        }

        .register-page .form-container .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #1F2A44;
            display: block;
            margin-bottom: 10px;
            letter-spacing: 0.5px;
        }

        .register-page .form-container .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
            background: #F7F7F9;
            border-radius: 12px;
            padding: 0 15px;
            transition: all 0.3s ease;
            border: 1px solid #D1D5DB;
        }

        .register-page .form-container .input-wrapper:hover {
            background: #FFFFFF;
            box-shadow: 0 0 8px rgba(59, 130, 246, 0.2);
            border-color: #3B82F6;
        }

        .register-page .form-container .input-wrapper i {
            color: #6B7280;
            font-size: 20px;
            margin-right: 12px;
            transition: color 0.3s ease;
        }

        .register-page .form-container .input-wrapper:hover i {
            color: #3B82F6;
        }

        .register-page .form-container .form-group input[type="text"],
        .register-page .form-container .form-group input[type="email"],
        .register-page .form-container .form-group input[type="tel"],
        .register-page .form-container .form-group input[type="password"] {
            width: 100%;
            padding: 14px 0;
            border: none;
            background: transparent;
            font-size: 16px;
            color: #1F2A44;
            outline: none;
        }

        .register-page .form-container .form-group input::placeholder {
            color: #6B7280;
        }

        .register-page .form-container .form-group input:focus {
            background: transparent;
            box-shadow: none;
        }

        .register-page .form-container .form-group input[type="checkbox"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: #3B82F6;
            margin-right: 12px;
            border-radius: 4px;
        }

        .register-page .form-container .form-btn {
            background: linear-gradient(90deg, #3B82F6 0%, #60A5FA 100%);
            color: #FFFFFF;
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .register-page .form-container .form-btn:hover {
            background: linear-gradient(90deg, #60A5FA 0%, #3B82F6 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.4);
        }

        .register-page .form-container .form-btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.6s ease, height 0.6s ease;
        }

        .register-page .form-container .form-btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .register-page .form-container .message {
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
            color: #1F2A44;
            background: #F7F7F9;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #D1D5DB;
        }

        @media (max-width: 480px) {
            .register-page .form-container {
                padding: 20px;
                max-width: 90%;
            }

            .register-page .form-container form {
                padding: 20px;
            }

            .register-page .form-container .form-group input {
                font-size: 15px;
            }

            .register-page .form-container .form-btn {
                font-size: 15px;
                padding: 14px;
            }

            .register-page .search-form {
                max-width: 95%;
                padding: 8px;
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
            <p class="message" style="color: #EF4444; background: #FEE2E2;"><%= errorMessage %></p>
        <% 
                session.removeAttribute("errorMessage");
            } 
            if (successMessage != null) {
        %>
            <p class="message" style="color: #10B981; background: #D1FAE5;"><%= successMessage %></p>
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
                        placeholder="Enter your full name"
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
                        placeholder="Enter your email"
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
                        placeholder="Enter your phone number"
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
                        placeholder="Create a password"
                        required
                    >
                </div>
            </div>
            <div class="form-group">
                <div style="display: flex; align-items: center;">
                    <input 
                        type="checkbox" 
                        id="accept-terms" 
                        name="acceptTerms"
                    >
                    <label for="accept-terms" style="font-weight: 500; font-size: 15px;">I accept the terms and conditions</label>
                </div>
            </div>
            <button type="submit" class="form-btn">Create Account</button>
        </form>
    </div>
</body>
</html>