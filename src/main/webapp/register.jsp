<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ReadSphere</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <style>
       
        :root {
            --primary: #6B7280;        /* Soft gray for buttons */
            --primary-dark: #4B5563;   /* Darker soft gray for hover */
            --accent: #F3E8FF;         /* Pale lavender */
            --background: #F9FAFB;     /* Very light gray background */
            --text: #374151;           /* Soft charcoal for text */
            --white: #FFFFFF;          /* Pure white */
            --input-bg: #E5E7EB;       /* Light gray for inputs */
            --placeholder: #9CA3AF;    /* Mid-gray for placeholder */
        }

        .form-container {
            background: var(--white);
            padding: 2rem;
            border-radius: 10px;
            border: 1px solid var(--input-bg); 
            width: 100%;
            max-width: 400px;
            margin: 2rem auto;
            font-family: "Comic Sans MS", "Comic Sans", sans-serif;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: var(--text);
            font-size: 16px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px 15px;
            border: none;
            border-radius: 20px;
            background: var(--input-bg);
            font-family: "Comic Sans MS", "Comic Sans", sans-serif;
            font-size: 16px;
            color: var(--text);
        }

        input[type="text"]::placeholder,
        input[type="email"]::placeholder,
        input[type="tel"]::placeholder,
        input[type="password"]::placeholder {
            color: var(--placeholder);
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        input[type="password"]:focus {
            outline: none;
            background: var(--white);
            box-shadow: 0 0 0 2px var(--primary); 
        }

        .form-text {
            display: block;
            margin-top: 0.5rem;
            color: var(--placeholder);
            font-size: 14px;
        }

        .form-btn {
            width: 100%;
            padding: 10px 25px;
            background: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 20px;
            font-family: "Comic Sans MS", "Comic Sans", sans-serif;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .form-btn:hover {
            background: var(--primary-dark);
            transform: scale(1.03);
        }

        .form-btn:focus {
            outline: none;
            box-shadow: 0 0 0 2px var(--primary);
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="view/Navbar.jsp" %>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="full-name">Full Name</label>
                <input 
                    type="text" 
                    id="full-name" 
                    name="fullName"
                    placeholder="Enter full name" 
                    required
                >
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input 
                    type="email" 
                    id="email" 
                    name="email"
                    aria-describedby="emailHelp" 
                    placeholder="Enter email" 
                    required
                >
                <small id="emailHelp" class="form-text">
                    We'll never share your email with anyone else.
                </small>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input 
                    type="tel" 
                    id="phone" 
                    name="phone"
                    placeholder="Enter phone number" 
                    required
                >
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input 
                    type="password" 
                    id="password" 
                    name="password"
                    placeholder="Create a password" 
                    required
                >
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input 
                    type="password" 
                    id="confirm-password" 
                    name="confirmPassword"
                    placeholder="Confirm your password" 
                    required
                >
            </div>

            <button type="submit" class="form-btn">Register</button>
        </form>
    </div>
</body>
</html>