<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectionDAO, model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        }

        header {
            background: #FFFFFF;
            padding: 12px 40px;
            border-bottom: 1px solid #A3BFFA;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 26px;
            font-weight: 700;
            color: #374151;
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .logo i {
            margin-right: 10px;
            color: #A3BFFA;
            font-size: 22px;
            transition: color 0.3s ease;
        }

        .logo:hover i {
            color: #7C9BF2;
        }

        .checkout-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px;
            padding: 20px;
        }

        .cart-section, .payment-section {
            background: #FFFFFF;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
            border: 1px solid #E5E7EB;
            width: 48%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .cart-section:hover, .payment-section:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .cart-section h2, .payment-section h2 {
            font-size: 20px;
            font-weight: 700;
            color: #374151;
            margin-bottom: 15px;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th, .cart-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #E5E7EB;
            font-size: 14px;
            color: #374151;
        }

        .cart-table th {
            font-weight: 500;
            background: linear-gradient(135deg, #6B7280, #4B5563);
            color: #FFFFFF;
            text-transform: uppercase;
            font-size: 13px;
        }

        .cart-table th i {
            color: #FFFFFF;
            margin-right: 6px;
            font-size: 14px;
            transition: transform 0.3s ease;
        }

        .cart-table th:hover i {
            transform: rotate(15deg);
        }

        .cart-table td.price::before {
            content: 'Rs ';
            color: #4B5563;
        }

        .cart-table td.quantity::before {
            content: '';
        }

        .cart-table td.quantity::after {
            content: 'x';
            color: #4B5563;
            margin-left: 4px;
        }

        .cart-table tbody tr {
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .cart-table tbody tr:nth-child(even) {
            background: #F9FAFB;
        }

        .cart-table tbody tr:hover {
            background: #E8EDFF;
            transform: scale(1.01);
        }

        .total-price {
            margin-top: 15px;
            padding: 10px;
            background: #E8EDFF;
            border-radius: 4px;
            text-align: right;
            font-size: 15px;
            font-weight: bold;
            color: #374151;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .total-price:hover {
            background: #D3DFFF;
            transform: scale(1.02);
        }

        .total-price span {
            color: #4B5563;
        }

        .remove-button {
            background: #F87171;
            color: #FFFFFF;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.2s ease;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .remove-button:hover {
            background: #DC2626;
            transform: scale(1.1);
        }

        .remove-button i {
            font-size: 14px;
            transition: transform 0.3s ease;
        }

        .remove-button:hover i {
            transform: rotate(10deg);
        }

        .payment-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
            position: relative;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 500;
            color: #374151;
            transition: color 0.3s ease;
        }

        .form-group:hover label {
            color: #7C9BF2;
        }

        .form-group input, .form-group select {
            padding: 10px;
            border: 1px solid #D1D5DB;
            border-radius: 4px;
            font-size: 14px;
            color: #374151;
            background: #F9FAFB;
            outline: none;
            transition: border-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:hover, .form-group select:hover {
            border-color: #A3BFFA;
            transform: scale(1.02);
            box-shadow: 0 0 5px rgba(163, 191, 250, 0.3);
        }

        .form-group input:focus, .form-group select:focus {
            border-color: #A3BFFA;
            box-shadow: 0 0 5px rgba(163, 191, 250, 0.5);
            transform: scale(1.02);
        }

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .order-button, .continue-button {
            text-decoration: none;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            display: flex;
            align-items: center;
            gap: 6px;
            background: #7C9BF2;
            color: #FFFFFF;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .order-button:hover, .continue-button:hover {
            background: #5A7CBA;
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .order-button i, .continue-button i {
            font-size: 16px;
            transition: transform 0.3s ease;
        }

        .order-button:hover i, .continue-button:hover i {
            transform: rotate(15deg);
        }

        .error-message {
            text-align: center;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            background: #F8D7DA;
            color: #721C24;
        }

        @media (max-width: 768px) {
            .checkout-container {
                flex-direction: column;
                padding: 10px;
            }

            .cart-section, .payment-section {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>

    <div class="checkout-container">
        <div class="cart-section">
            <h2>Cart Items</h2>
            <%
                User users = (User) session.getAttribute("user");

                if (users == null) {
                    response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+to+view+cart&redirectPage=" + java.net.URLEncoder.encode("/view/order/cart.jsp", "UTF-8"));
                    return;
                }
            %>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th><i class="fas fa-book"></i> Book Name</th>
                        <th><i class="fas fa-user"></i> Author</th>
                        <th><i class="fas fa-sort-numeric-up"></i> Quantity</th>
                        <th><i class="fas fa-money-bill-wave"></i> Price</th>
                        <th><i class="fas fa-trash"></i> Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        double totalPrice = 0.0;
                        boolean hasItems = false;

                        try {
                            conn = connectionDAO.getconn();
                            if (conn == null) {
                                out.println("<tr><td colspan='5' class='error-message'>Error: Database connection failed.</td></tr>");
                            } else {
                                String sql = "SELECT * FROM cart WHERE userID = ?";
                                stmt = conn.prepareStatement(sql);
                                stmt.setInt(1, user.getId());
                                rs = stmt.executeQuery();

                                while (rs.next()) {
                                    hasItems = true;
                                    int cartId = rs.getInt("cartID");
                                    String bookName = rs.getString("bookName");
                                    String author = rs.getString("author");
                                    double price = rs.getDouble("price");
                                    double itemTotal = rs.getDouble("total_price");
                                    int quantity = rs.getInt("quantity");
                    %>
                    <tr>
                        <td><%= bookName != null ? bookName : "N/A" %></td>
                        <td><%= author != null ? author : "N/A" %></td>
                        <td class="quantity"><%= quantity %></td>
                        <td class="price"><%= price %></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post" style="display:inline;">
                                <input type="hidden" name="cartId" value="<%= cartId %>">
                                <input type="hidden" name="redirectPage" value="/view/order/cart.jsp">
                                <button type="submit" class="remove-button"><i class="fas fa-trash"></i> Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                    totalPrice += itemTotal;
                                }

                                if (!hasItems) {
                    %>
                    <tr>
                        <td colspan="5">Your cart is empty.</td>
                    </tr>
                    <%
                                }
                            }
                        } catch (SQLException e) {
                            out.println("<tr><td colspan='5' class='error-message'>Error loading cart: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
            <div class="total-price">
                Total Price: <span>Rs <%= String.format("%.2f", totalPrice) %></span>
            </div>
        </div>

        <div class="payment-section">
            <h2>Payment Details</h2>
            <form class="payment-form" action="${pageContext.request.contextPath}/OrderServlet" method="post">
                <input type="hidden" name="redirectPage" value="/view/order/cart.jsp">
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter Name" value="<%= user.getName() != null ? user.getName() : "" %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter Email" value="<%= user.getEmail() != null ? user.getEmail() : "" %>" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="mobile">Mobile No</label>
                        <input type="text" id="mobile" name="phone" placeholder="Enter Mobile No" value="<%= user.getPhno() != null ? user.getPhno() : "" %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" placeholder="Enter Address" value="<%= user.getAddress() != null ? user.getAddress() : "" %>" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="landmark">Landmark</label>
                        <input type="text" id="landmark" name="landmark" placeholder="Locality" value="<%= user.getLandmark() != null ? user.getLandmark() : "" %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" id="city" name="city" placeholder="City" value="<%= user.getCity() != null ? user.getCity() : "" %>" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="state">State</label>
                        <input type="text" id="state" name="state" placeholder="State" value="<%= user.getState() != null ? user.getState() : "" %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="pincode">Pin Code</label>
                        <input type="text" id="pincode" name="pincode" placeholder="Pin Code" value="<%= user.getZip() != null ? user.getZip() : "" %>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="payment-type">Payment Type</label>
                    <input type="text" id="payment-type" name="paymentType" value="Cash on Delivery" readonly>
                </div>
                <div class="action-buttons">
                    <button type="submit" class="order-button">
                        <i class="fas fa-shopping-cart"></i> Order Now
                    </button>
                    <a href="${pageContext.request.contextPath}/view/BookUtils/newbook.jsp" class="continue-button">
                        <i class="fas fa-home"></i> Continue Shopping
                    </a>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../utils/footer.jsp" %>
</body>
</html>