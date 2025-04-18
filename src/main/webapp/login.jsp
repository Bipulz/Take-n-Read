<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: #F9FAFB;
            min-height: 100vh;
            color: #374151;
            overflow-x: hidden;
        }


        .logo {
            display: flex;
            align-items: center;
            font-size: 26px;
            font-weight: 700;
            color: #374151;
        }

        .logo i {
            margin-right: 10px;
            color: #A3BFFA;
            font-size: 22px;
        }

        .main-content {
            padding: 30px 20px;
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px);
        }

        .form-container {
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 12px 28px rgba(55, 65, 81, 0.3), 0 6px 12px rgba(0, 0, 0, 0.2);
            border: 1px solid #E5E7EB;
            max-width: 480px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: slideIn 0.5s ease-out;
            position: relative;
        }

        .form-container:hover {
            transform W translateY(-4px);
            box-shadow: 0 16px 32px rgba(55, 65, 81, 0.4), 0 8px 16px rgba(0, 0, 0, 0.25);
        }

        @keyframes slideIn {
            from {
                transform: translateY(20px);
            }
            to {
                transform: translateY(0);
            }
        }

        .form-container h2 {
            font-size: 26px;
            color: #374151;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 700;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .divider {
            height: 4px;
            background: linear-gradient(to right, #A3BFFA, #FFFFFF);
            margin-bottom: 20px;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 18px;
            position: relative;
        }

        .form-group label {
            font-size: 14px;
            color: #374151;
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            transition: transform 0.2s ease, color 0.2s ease;
        }

        .form-group label span {
            color: #F87171;
        }

        .form-group input:focus + label {
            transform: translateY(-2px);
            color: #A3BFFA;
        }

        .form-group input {
            width: 100%;
            padding: 10px 10px 10px 40px;
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            font-size: 14px;
            color: #374151;
            background: #FFFFFF;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .form-group input:focus {
            outline: none;
            border-color: #A3BFFA;
            background: #F9FAFB;
            box-shadow: 0 0 8px rgba(163, 191, 250, 0.4), 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group i {
            position: absolute;
            left: 12px;
            top: 40px;
            color: #A3BFFA;
            font-size: 16px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .form-group input:focus ~ i {
            color: #7C9BF2;
            transform: scale(1.1);
        }

        .form-check {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: #374151;
            margin-bottom: 20px;
        }

        .form-check input {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #A3BFFA;
            border-radius: 4px;
        }

        .form-check label {
            cursor: pointer;
            font-weight: 500;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background: #6B7280;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: background 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .submit-btn:hover {
            background: #7C9BF2;
            box-shadow: 0 6px 12px rgba(163, 191, 250, 0.4), 0 2px 4px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.6s ease;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn i {
            margin-right: 8px;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .alert.error {
            background: #FEE2E2;
            border: 1px solid #F87171;
            color: #B91C1C;
        }

        .alert.success {
            background: #E0F2FE;
            border: 1px solid #A3BFFA;
            color: #1E40AF;
        }

        .alert i {
            font-size: 18px;
        }

        .alert a {
            color: #A3BFFA;
            text-decoration: none;
            font-weight: 500;
            margin-left: auto;
        }

        .alert a:hover {
            text-decoration: underline;
        }

        footer {
            background: #FFFFFF;
            padding: 15px 40px;
            text-align: center;
            color: #6B7280;
            font-size: 14px;
            border-top: 1px solid #A3BFFA;
            margin-top: 30px;
        }

        @media (max-width: 768px) {
            header {
                padding: 10px 20px;
            }

            .main-content {
                padding: 25px 15px;
            }

            .form-container {
                padding: 20px;
            }

            .form-container h2 {
                font-size: 22px;
            }

            .form-group input {
                padding: 8px 8px 8px 36px;
                font-size: 13px;
            }

            .form-group i {
                top: 38px;
                font-size: 14px;
                left: 10px;
            }

            .submit-btn {
                padding: 10px;
                font-size: 13px;
            }

            .alert {
                font-size: 13px;
                padding: 12px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 22px;
            }

            .main-content {
                padding: 20px 10px;
            }

            .form-container {
                padding: 15px;
            }

            .form-container h2 {
                font-size: 20px;
                margin-bottom: 15px;
            }

            .form-group label {
                font-size: 13px;
            }

            .form-group input {
                font-size: 12px;
                padding: 8px 8px 8px 36px;
            }

            .form-group i {
                top: 38px;
                font-size: 13px;
                left: 10px;
            }

            .submit-btn {
                font-size: 12px;
                padding: 8px;
            }

            .alert {
                font-size: 12px;
                padding: 10px;
            }

            footer {
                padding: 12px 20px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

 <%@include file="view/Navbar.jsp" %>
    <div class="main-content">
        <div class="form-container">
            <h2>Sign In</h2>
            <div class="divider"></div>
            <% 
                String errorMessage = (String) session.getAttribute("errorMessage");
                String successMessage = (String) session.getAttribute("successMessage");
                if (errorMessage != null) {
            %>
                <div class="alert error">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= errorMessage %>
                    <a href="${pageContext.request.contextPath}/login.jsp">Dismiss</a>
                </div>
            <% 
                    session.removeAttribute("errorMessage");
                } 
                if (successMessage != null) {
            %>
                <div class="alert success">
                    <i class="fas fa-check-circle"></i>
                    <%= successMessage %>
                    <a href="home.jsp">Continue</a>
                </div>
            <% 
                    session.removeAttribute("successMessage");
                } 
            %>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="email">Email Address<span>*</span></label>
                    <i class="fas fa-envelope"></i>
                    <input 
                        type="email" 
                        id="email" 
                        name="email"
                        placeholder="Enter email" 
                        required
                    >
                </div>
                <div class="form-group">
                    <label for="password">Password<span>*</span></label>
                    <i class="fas fa-lock"></i>
                    <input 
                        type="password" 
                        id="password" 
                        name="password"
                        placeholder="Enter password" 
                        required
                    >
                </div>
                <div class="form-check">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember me</label>
                </div>
                <button type="submit" class="submit-btn"><i class="fas fa-sign-in-alt"></i>Sign In</button>
            </form>
        </div>
    </div>

    <footer>
        © 2025 Take n' Read. All rights reserved.
    </footer>
</body>
</html>