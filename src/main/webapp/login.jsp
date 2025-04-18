<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ReadSphere</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap">
    <style>
        .login-page {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #FFFFFF;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .login-page .search-form {
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

        .login-page .search-form:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-page .search-form input {
            padding: 12px 15px 12px 45px;
            font-size: 16px;
            border: none;
            background: transparent;
            width: 100%;
            color: #1F2A44;
            font-family: 'Roboto', sans-serif;
            outline: none;
        }

        .login-page .search-form input::placeholder {
            color: #6B7280;
        }

        .login-page .search-form input:focus {
            background: #FFFFFF;
            border-radius: 50px;
            box-shadow: 0 0 0 2px #3B82F6;
        }

        .login-page .form-container {
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

        .login-page .form-container:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
        }

        .login-page .form-container form {
            width: 100%;
            padding: 35px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .login-page .form-container .form-group {
            text-align: left;
        }

        .login-page .form-container .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #1F2A44;
            display: block;
            margin-bottom: 10px;
            letter-spacing: 0.5px;
        }

        .login-page .form-container .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
            background: #F7F7F9;
            border-radius: 12px;
            padding: 0 15px;
            transition: all 0.3s ease;
            border: 1px solid #D1D5DB;
        }

        .login-page .form-container .input-wrapper:hover {
            background: #FFFFFF;
            box-shadow: 0 0 8px rgba(59, 130, 246, 0.2);
            border-color: #3B82F6;
        }

        .login-page .form-container .input-wrapper i {
            color: #6B7280;
            font-size: 20px;
            margin-right: 12px;
            transition: color 0.3s ease;
        }

        .login-page .form-container .input-wrapper:hover i {
            color: #3B82F6;
        }

        .login-page .form-container .form-group input {
            width: 100%;
            padding: 14px 0;
            border: none;
            background: transparent;
            font-size: 16px;
            color: #1F2A44;
            outline: none;
            font-family: 'Roboto', sans-serif;
        }

        .login-page .form-container .form-group input::placeholder {
            color: #6B7280;
        }

        .login-page .form-container .form-group input:focus {
            background: transparent;
            box-shadow: none;
        }

        .login-page .form-container .form-text {
            font-size: 13px;
            color: #6B7280;
            margin-top: 6px;
            display: block;
        }

        .login-page .form-container .form-check {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
            color: #1F2A44;
        }

        .login-page .form-container .form-check input {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: #3B82F6;
            border-radius: 4px;
        }

        .login-page .form-container .form-check label {
            cursor: pointer;
            font-weight: 500;
        }

        .login-page .form-container .form-btn {
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

        .login-page .form-container .form-btn:hover {
            background: linear-gradient(90deg, #60A5FA 0%, #3B82F6 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.4);
        }

        .login-page .form-container .form-btn::before {
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

        .login-page .form-container .form-btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .login-page .form-container .message {
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
            .login-page .form-container {
                padding: 20px;
                max-width: 90%;
            }

            .login-page .form-container form {
                padding: 20px;
            }

            .login-page .form-container .form-group input {
                font-size: 15px;
            }

            .login-page .form-container .form-btn {
                font-size: 15px;
                padding: 14px;
            }

            .login-page .search-form {
                max-width: 95%;
                padding: 8px;
            }
        }
    </style>
</head>
<body class="login-page">
    <%@include file="view/Navbar.jsp" %>

    <div class="form-container">
        <% 
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="message" style="color: #EF4444; background: #FEE2E2;"><%= errorMessage %></p>
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