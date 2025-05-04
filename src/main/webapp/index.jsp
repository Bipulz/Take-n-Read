<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="model.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take 'n Read : Homepage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg.css">
</head>
<body>

    <%@ include file="./view/utils/Navbar.jsp" %>

    <div class="section">
        <div class="bg-img"></div>
        <div class="overlay">
            <div class="content">
                <%
                    User userr = (User) session.getAttribute("user");
                    String displayName = "Guest";

                    if (userr != null) {
                        displayName = (user.getName() != null && !user.getName().isEmpty()) ? user.getName() : user.getEmail();
                %>
                        <h1>Welcome back, <%= displayName %>!</h1>
                     <p>Explore your personalized library and discover something new.</p>
                <%
                    } else {
                %>
                        <h1>Welcome to Take n' Read </h1>
                       <p> "Discover Your Next Favorite Book! Log in to explore our vast collection.</p>

                <%
                    }
                %>
                
            </div>
        </div>
    </div>

<%
    request.setAttribute("fromIndex", true);
%>

<jsp:include page="view/BookUtils/recentbook.jsp" />
<jsp:include page="view/BookUtils/newbook.jsp" />
<jsp:include page="view/BookUtils/oldbook.jsp" />

    <%@ include file="view/utils/footer.jsp" %>
</body>
</html>
