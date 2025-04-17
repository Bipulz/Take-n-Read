
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ReadSphere</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #F9FAFB 0%, #E5E7EB 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .form-container {
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
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
        }

        form {
            width: 100%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .form-group {
            text-align: left;
        }

        .form-group label {
            font-size: 15px;
            font-weight: 500;
            color: #374151;
            display: block;
            margin-bottom: 8px;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
            background: #F3E8FF;
            border-radius: 10px;
            padding: 0 15px;
            transition: background 0.3s ease;
        }

        .input-wrapper:hover {
            background: #E5E7EB;
        }

        .input-wrapper i {
            color: #6B7280;
            font-size: 18px;
            margin-right: 12px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 0;
            border: none;
            background: transparent;
            font-size: 16px;
            color: #374151;
            outline: none;
        }

        .form-group input::placeholder {
            color: #9CA3AF;
        }

        .form-group input:focus {
            background: transparent;
            box-shadow: 0 0 0 2px #A3BFFA;
        }

        .form-text {
            font-size: 13px;
            color: #9CA3AF;
            margin-top: 6px;
            display: block;
        }

        .form-check {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
            color: #374151;
        }

        .form-check input {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #A3BFFA;
        }

        .form-check label {
            cursor: pointer;
        }

        .form-btn {
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

        .form-btn:hover {
            background: linear-gradient(90deg, #7C9BF2 0%, #A3BFFA 100%); 
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }

        .message {
            text-align: center;
            margin-bottom: 10px;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 25px;
            }

            form {
                padding: 25px;
            }

            .form-group input {
                font-size: 15px;
            }

            .form-btn {
                font-size: 15px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <%@include file="view/Navbar.jsp" %>

    <div class="form-container">
        <% 
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="message" style="color: red;"><%= errorMessage %></p>
        <% 
                session.removeAttribute("errorMessage");
            } 
        %>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-wrapper">
                    <i class="fas fa-envelope"></i>
                    <input 
                        type="email" 
                        id="email" 
                        name="email"
                        aria-describedby="emailHelp" 
                        placeholder="Enter email" 
                        required
                    >
                </div>
                <small id="emailHelp" class="form-text">
                    We'll never share your email with anyone else.
                </small>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <i class="fas fa-lock"></i>
                    <input 
                        type="password" 
                        id="password" 
                        name="password"
                        placeholder="Enter password" 
                        required
                    >
                </div>
            </div>

            <div class="form-check">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Remember me</label>
            </div>

            <button type="submit" class="form-btn">Sign In</button>
        </form>
    </div>
</body>
</html>
