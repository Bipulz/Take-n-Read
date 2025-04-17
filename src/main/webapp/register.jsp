	
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Register - ReadSphere</title>
	    <style>
	        .form-container {
	            background: #fff;
	            padding: 20px;
	            border-radius: 10px;
	            border: 1px solid #e5e7eb;
	            max-width: 400px;
	            margin: 20px auto;
	            font-family: "Comic Sans MS", sans-serif;
	        }
	        .form-group {
	            margin-bottom: 15px;
	        }
	        label {
	            display: block;
	            margin-bottom: 5px;
	            font-weight: bold;
	            color: #374151;
	        }
	        input[type="text"],
	        input[type="email"],
	        input[type="tel"],
	        input[type="password"] {
	            width: 100%;
	            padding: 10px;
	            border: none;
	            border-radius: 20px;
	            background: #e5e7eb;
	            font-family: "Comic Sans MS", sans-serif;
	        }
	        input[type="checkbox"] {
	            margin-right: 10px;
	        }
	        .form-btn {
	            width: 100%;
	            padding: 10px;
	            background: #6b7280;
	            color: #fff;
	            border: none;
	            border-radius: 20px;
	            font-family: "Comic Sans MS", sans-serif;
	            cursor: pointer;
	        }
	        .form-btn:hover {
	            background: #4b5563;
	        }
	        .message {
	            text-align: center;
	            margin-bottom: 10px;
	        }
	    </style>
	</head>
	<body>
	 <%@include file="view/Navbar.jsp" %>
	
	    <div class="form-container">
	        <% 
	            String errorMessage = (String) session.getAttribute("errorMessage");
	            String successMessage = (String) session.getAttribute("successMessage");
	            if (errorMessage != null) {
	        %>
	            <p class="message" style="color: red;"><%= errorMessage %></p>
	        <% 
	                session.removeAttribute("errorMessage");
	            } 
	            if (successMessage != null) {
	        %>
	            <p class="message" style="color: green;"><%= successMessage %></p>
	        <% 
	                session.removeAttribute("successMessage");
	            } 
	        %>
	        <form action="register" method="post">
	            <div class="form-group">
	                <label for="full-name">Full Name</label>
	                <input 
	                    type="text" 
	                    id="full-name" 
	                    name="fname"
	                    value="<%= request.getParameter("fname") != null ? request.getParameter("fname") : "" %>"
	                    required
	                >
	            </div>
	            <div class="form-group">
	                <label for="email">Email Address</label>
	                <input 
	                    type="email" 
	                    id="email" 
	                    name="email"
	                    value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
	                    required
	                >
	            </div>
	            <div class="form-group">
	                <label for="phone">Phone Number</label>
	                <input 
	                    type="tel" 
	                    id="phone" 
	                    name="phno"
	                    value="<%= request.getParameter("phno") != null ? request.getParameter("phno") : "" %>"
	                    required
	                >
	            </div>
	            <div class="form-group">
	                <label for="password">Password</label>
	                <input 
	                    type="password" 
	                    id="password" 
	                    name="password"
	                    required
	                >
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