<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReadSphere</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg.css">

<style type="text/css">

</style>
</head>
<body>
    <%@include file="view/Navbar.jsp" %>
    
 <%@ page import="model.connectionDAO, java.sql.Connection" %>


<%-- <!-- intially tested the database connection -->
<%
    Connection conn = connectionDAO.getconn();
    if (conn != null) {
        out.print("Database connection successful: ");
    } else {
        out.print("Database connection failed.");
    }
%> --%>

    <div class="section">
        <div class="bg-img"></div>
        <div class="overlay">
            <div class="content">
                <h1> ---</h1>
                <p>Get any book of your choice </p>
            </div>
        </div>
    </div>
    
    <%@include file="view/recentbook.jsp" %>
		<%-- <%@include file="overall_component/recentbook.jsp" %>  --%>
		  <%@include file="view/footer.jsp" %>
</body>	
</html>