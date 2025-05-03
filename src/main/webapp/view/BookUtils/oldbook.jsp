<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectionDAO" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Added Books - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
</head>
<body>
<% if (request.getAttribute("fromIndex") == null) { %>
    <%@ include file="../utils/Navbar.jsp" %>
<% } %>
    <div class="book-container old-books">
        <h3>Old Books</h3>
        <div class="books-grid">
            <% 
                User user = (User) session.getAttribute("user");
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    conn = connectionDAO.getconn();
                    String sql;
                    if (user == null) {
                     
                        sql = "SELECT * FROM book WHERE user_email != 'admin@gmail.com' AND status = 'pending'";
                        stmt = conn.prepareStatement(sql);
                    } else {
                        
                        sql = "SELECT * FROM book WHERE user_email = ? AND user_email != 'admin@gmail.com' AND status = 'pending'";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, user.getEmail());
                    }
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
            %>
            <div class="book-card">
                <img alt="Book Cover" src="${pageContext.request.contextPath}/img/<%= photo %>">
                <div class="book-info">
                    <h4 class="book-title"><%= bookName %></h4>
                    <p class="book-author"><%= author %></p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> <%= bookCategory %></p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. <%= price %></span>
                    <div class="row">
                        <a href="${pageContext.request.contextPath}/view/BookUtils/userBookDetails.jsp?bookId=<%= bookId %>" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <% 
                    }
                    if (!hasBooks) {
            %>
                <p class="no-books">No books are being sold. <a href="${pageContext.request.contextPath}/view/BookUtils/sellBook.jsp">Sell a book now</a>.</p>
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
</body>
</html>