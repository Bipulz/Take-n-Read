<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.connectionDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Books - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
</head>
<body>
<% if (request.getAttribute("fromIndex") == null) { %>
    <%@ include file="../utils/Navbar.jsp" %>
<% } %>

<div class="book-container new-books">
    <h3>New Books</h3>
    <div class="books-grid">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                conn = connectionDAO.getconn();
                stmt = conn.createStatement();
                // Show only active books, newest first, limited to 6
                rs = stmt.executeQuery("SELECT * FROM book WHERE status = 'active' ORDER BY bookid DESC LIMIT 6");
                while (rs.next()) {
        %>
        <div class="book-card">
            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/<%= rs.getString("photo") %>">
            <div class="book-info">
                <h4 class="book-title"><%= rs.getString("bookname") %></h4>
                <p class="book-author"><%= rs.getString("author") %></p>
                <p class="book-category"><i class="fas fa-bookmark"></i> <%= rs.getString("bookCategory") %></p>
                <span class="price"><i class="fas fa-tag"></i> Rs. <%= rs.getDouble("price") %></span>
                <div class="row">
                    <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                    <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                </div>
            </div>
        </div>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
        %>
        <div class="error">Error loading books. Please try again later.</div>
        <%
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
    <div class="view-al">
        <a href="#" class="btn"><i class="fas fa-book"></i> View All Books</a>
    </div>
</div>
<div class="section-divider"></div>
</body>
</html>