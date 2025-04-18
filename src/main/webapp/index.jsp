<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take 'n Read : Homepage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg.css">
</head>
<body>

    <%@include file="./view/Navbar.jsp" %>

    <div class="section">
        <div class="bg-img"></div>
        <div class="overlay">
            <div class="content">
                <% 
                    String message = "Discover Your Next Favorite Book! Log in to explore our vast collection.";
                    String displayName = "Guest";
                    try {
                        if (user != null) {
                            displayName = user.getName() != null && !user.getName().isEmpty() ? user.getName() : user.getEmail();
                        }
                    } catch (Exception e) {
                        displayName = "Guest";
                    }
                %>
<h1><%= user == null ? "Welcome to Take n' Read" : "Welcome back, " + displayName + "!" %></h1>
<p><%= "Explore your personalized library and discover something new." %></p>

            </div>
        </div>
    </div>

    <%@include file="view/book.jsp" %>
    <%@include file="view/footer.jsp" %>
</body>	
</html>