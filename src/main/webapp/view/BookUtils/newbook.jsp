<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectionDAO, model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Books - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
    <style>
        .success-message {
            color: green;
            text-align: center;
            margin: 10px 0;
            display: none;
        }
        .error-message {
            color: red;
            text-align: center;
            margin: 10px 0;
            display: none;
        }

    </style>
</head>
<body>
<% if (request.getAttribute("fromIndex") == null) { %>
    <%@ include file="../utils/Navbar.jsp" %>
<% } %>

<div class="book-container new-books">
    <h3>New Books</h3>
    <div id="message" class="success-message"></div>
    <div id="error" class="error-message"></div>
    <div class="books-grid">
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                conn = connectionDAO.getconn();
                String sql = "SELECT * FROM book WHERE status = 'active' AND user_email = 'admin@gmail.com' ORDER BY bookId DESC LIMIT 6";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                boolean hasBooks = false;
                while (rs.next()) {
                    hasBooks = true;
                    int bookId = rs.getInt("bookId");
                    String bookName = rs.getString("bookname");
                    String author = rs.getString("author");
                    String bookCategory = rs.getString("bookCategory") != null ? rs.getString("bookCategory") : "Uncategorized";
                    double price = rs.getDouble("price");
                    String photo = rs.getString("photo");
        %>
        <div class="book-card">
            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/<%= photo != null ? photo : "default.jpg" %>">
            <div class="book-info">
                <h4 class="book-title"><%= bookName != null ? bookName : "N/A" %></h4>
                <p class="book-author"><%= author != null ? author : "N/A" %></p>
                <p class="book-category"><i class="fas fa-bookmark"></i> <%= bookCategory %></p>
                <span class="price"><i class="fas fa-tag"></i> Rs. <%= price %></span>
                <div class="row">
                    <button class="btn add-cart" data-book-id="<%= bookId %>"><i class="fas fa-cart-plus"></i> Add to Cart</button>
                    <a href="${pageContext.request.contextPath}/view/BookUtils/adminBookDetails.jsp?bookId=<%= bookId %>" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                </div>
            </div>
        </div>
        <%
                }
                if (!hasBooks) {
        %>
        <p class="no-books">No new books available at the moment.</p>
        <%
                }
            } catch (SQLException e) {
                out.println("<div class='error-message'>An error occurred while loading books. Please try again later.</div>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    
                }
            }
        %>
    </div>
    <div class="view-al">
        <a href="${pageContext.request.contextPath}/view/BookUtils/newbook.jsp" class="btn"><i class="fas fa-book"></i> View All Books</a>
    </div>
</div>



<div class="section-divider"></div>

<script>
    function fetchCart() {
        fetch('${pageContext.request.contextPath}/FetchCartServlet')
            .then(response => response.json())
            .then(data => {
                const cartItems = document.getElementById('cart-items');
                const totalPrice = document.getElementById('total-price');
                cartItems.innerHTML = '';

                if (!data.success) {
                    cartItems.innerHTML = '<tr><td colspan="4">' + data.message + '</td></tr>';
                    totalPrice.textContent = 'Rs 0.00';
                    return;
                }

                if (data.cartItems.length === 0) {
                    cartItems.innerHTML = '<tr><td colspan="4">Your cart is empty.</td></tr>';
                    totalPrice.textContent = 'Rs 0.00';
                    return;
                }

                data.cartItems.forEach(item => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${item.bookName}</td>
                        <td>${item.author}</td>
                        <td class="quantity">${item.quantity}</td>
                        <td class="price">${item.price}</td>
                    `;
                    cartItems.appendChild(row);
                });

                totalPrice.textContent = 'Rs ' + data.totalCartPrice.toFixed(2);
            })
            .catch(error => {
                const cartItems = document.getElementById('cart-items');
                cartItems.innerHTML = '<tr><td colspan="4">Error loading cart.</td></tr>';
            });
    }

    document.addEventListener('DOMContentLoaded', function() {
        fetchCart();

        document.querySelectorAll('.add-cart').forEach(function(button) {
            button.addEventListener('click', function() {
                var bookId = this.getAttribute('data-book-id');
                var messageDiv = document.getElementById('message');
                var errorDiv = document.getElementById('error');

                fetch('${pageContext.request.contextPath}/AddToCartServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'bookId=' + encodeURIComponent(bookId)
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        messageDiv.textContent = data.message;
                        messageDiv.style.display = 'block';
                        setTimeout(() => { messageDiv.style.display = 'none'; }, 3000);
                        fetchCart(); // Refresh cart after successful addition
                    } else {
                        errorDiv.textContent = data.message;
                        errorDiv.style.display = 'block';
                        setTimeout(() => { errorDiv.style.display = 'none'; }, 3000);
                    }
                })
                .catch(error => {
                    errorDiv.textContent = 'An error occurred. Please try again.';
                    errorDiv.style.display = 'block';
                    setTimeout(() => { errorDiv.style.display = 'none'; }, 3000);
                });
            });
        });
    });
</script>
</body>
</html>