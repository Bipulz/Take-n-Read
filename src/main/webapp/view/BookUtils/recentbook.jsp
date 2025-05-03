<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectionDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
</head>
<body>
<% if (request.getAttribute("fromIndex") == null) { %>
    <%@ include file="../utils/Navbar.jsp" %>
<% } %>
    
    <div class="book-container recent-books">
        <h3>Recent Books</h3>
        <div class="books-grid">
            <% 
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    conn = connectionDAO.getconn();
                    String sql = "SELECT * FROM book WHERE status = 'pending' ORDER BY bookId DESC LIMIT 3";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();
                    boolean hasBooks = false;
                    while (rs.next()) {
                        hasBooks = true;
                        int bookId = rs.getInt("bookId");
                        String bookName = rs.getString("bookname");
                        String author = rs.getString("author");
                        double price = rs.getDouble("price");
                        String photo = rs.getString("photo");
                        String bookCategory = rs.getString("bookCategory") != null ? rs.getString("bookCategory") : "Uncategorized";
                        String userEmail = rs.getString("user_email");
                        boolean isAdminBook = "admin@gmail.com".equals(userEmail);
            %>
            <div class="book-card">
                <img alt="Book Cover" src="${pageContext.request.contextPath}/img/<%= photo %>">
                <div class="book-info">
                    <h4 class="book-title"><%= bookName %></h4>
                    <p class="book-author"><%= author %></p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> <%= bookCategory %></p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. <%= price %></span>
                    <div class="row">
                        <% if (isAdminBook) { %>
                            <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <% } %>
                        <a href="${pageContext.request.contextPath}/view/BookUtils/viewDetailsStatic-2.jsp?bookId=<%= bookId %>" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <% 
                    }
                    if (!hasBooks) {
            %>
                <p class="no-books">No books are being sold recently. <a href="${pageContext.request.contextPath}/view/BookUtils/sellBook.jsp">Sell a book now</a>.</p>
            <% 
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
            %>
                <p class="no-books">Error loading books: <%= e.getMessage() %></p>
            <% 
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
        <div class="view-al">
            <a href="${pageContext.request.contextPath}/view/BookUtils/oldbook.jsp" class="btn"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>
    <div class="section-divider"></div>
</body>
</html>