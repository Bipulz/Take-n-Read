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
    background: linear-gradient(135deg, #F9FAFB 0%, #E8EDFF 100%);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
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

.order-container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    margin-bottom: 50px;
    flex: 1;
}

.order-section {
    background: #FFFFFF;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
    border: 1px solid #E5E7EB;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.order-section:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.order-section h2 {
    font-size: 24px;
    font-weight: 700;
    color: #374151;
    margin-bottom: 15px;
    position: relative;
    display: inline-block;
}

.order-section h2::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 50%;
    height: 3px;
    background: linear-gradient(90deg, #A3BFFA, #7C9BF2);
    border-radius: 2px;
}

.order-table {
    width: 100%;
    border-collapse: collapse;
}

.order-table th, .order-table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #E5E7EB;
    font-size: 14px;
    color: #374151;
}

.order-table th {
    font-weight: 500;
    background: linear-gradient(135deg, #6B7280, #4B5563);
    color: #FFFFFF;
    text-transform: uppercase;
    font-size: 13px;
}

.order-table th i {
    color: #FFFFFF;
    margin-right: 6px;
    font-size: 14px;
    transition: transform 0.3s ease;
}

.order-table th:hover i {
    transform: rotate(15deg);
}

.order-table td.price::before {
    content: 'Rs ';
    color: #4B5563;
}

.order-table tbody tr {
    background: linear-gradient(90deg, #FFFFFF 0%, #F9FAFB 100%);
    transition: background 0.3s ease, transform 0.3s ease;
}

.order-table tbody tr:nth-child(even) {
    background: linear-gradient(90deg, #F9FAFB 0%, #FFFFFF 100%);
}

.order-table tbody tr:hover {
    background: linear-gradient(90deg, #E8EDFF 0%, #D3DFFF 100%);
    transform: scale(1.01);
}

.order-table td i {
    margin-right: 8px;
    color: #7C9BF2;
    font-size: 16px;
}

.back-button {
    margin-top: 20px;
    padding: 10px 20px;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    background: #7C9BF2;
    color: #FFFFFF;
    transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.back-button:hover {
    background: #5A7CBA;
    transform: scale(1.05);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.back-button i {
    font-size: 16px;
    transition: transform 0.3s ease;
}

.back-button:hover i {
    transform: translateX(-5px);
}

footer {
    background-color: #2D3748;
    color: white;
    text-align: center;
    padding: 15px;
    font-size: 14px;
    position: relative;
    width: 100%;
    margin-top: auto;
}

@media (max-width: 768px) {
    .order-container {
        padding: 10px;
    }

    .order-section {
        width: 100%;
    }

    .order-table th, .order-table td {
        font-size: 12px;
        padding: 8px;
    }

    .order-section h2 {
        font-size: 20px;
    }

    .back-button {
        font-size: 12px;
        padding: 8px 16px;
    }
}
    </style>
</head>
<body>
 <%@include file="../utils/Navbar.jsp" %>

    <div class="order-container">
        <div class="order-section">
            <h2>Your Orders</h2>
            <table class="order-table">
                <thead>
                    <tr>
                        <th><i class="fas fa-id-badge"></i> Order ID</th>
                        <th><i class="fas fa-book"></i> Book Name</th>
                        <th><i class="fas fa-user"></i> Author</th>
                        <th><i class="fas fa-money-bill-wave"></i> Price</th>
                        <th><i class="fas fa-credit-card"></i> Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User users = (User) session.getAttribute("user");
                        if (users == null) {
                            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+to+view+orders&redirectPage=" + java.net.URLEncoder.encode("/view/order/userOrder.jsp", "UTF-8"));
                            return;
                        }

                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        boolean hasOrders = false;

                        try {
                            conn = connectionDAO.getconn();
                            if (conn == null) {
                                out.println("<tr><td colspan='5'>Error: Database connection failed.</td></tr>");
                            } else {
                                String sql = "SELECT * FROM book_order WHERE user_name = ? ORDER BY id DESC";
                                stmt = conn.prepareStatement(sql);
                                stmt.setString(1, users.getName());
                                rs = stmt.executeQuery();

                                while (rs.next()) {
                                    hasOrders = true;
                                    String orderId = rs.getString("order_id");
                                    String bookName = rs.getString("book_name");
                                    String author = rs.getString("author");
                                    double price = rs.getDouble("price");
                                    String payment = rs.getString("payment");
                    %>
                    <tr>
                        <td><i class="fas fa-id-card"></i> <%= orderId %></td>
                        <td><i class="fas fa-book-open"></i> <%= bookName %></td>
                        <td><i class="fas fa-user-pen"></i> <%= author %></td>
                        <td class="price"><%= price %></td>
                        <td><i class="fas fa-money-check-alt"></i> <%= payment %></td>
                    </tr>
                    <%
                                }

                                if (!hasOrders) {
                    %>
                    <tr>
                        <td colspan="5">No orders found.</td></tr>
                    <%
                                }
                            }
                        } catch (SQLException e) {
                            out.println("<tr><td colspan='5'>Error loading orders: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignore */ }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* Ignore */ }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignore */ }
                        }
                    %>
                </tbody>
            </table>
            <button class="back-button" onclick="window.location.href='${pageContext.request.contextPath}/view/BookUtils/newbook.jsp'"><i class="fas fa-arrow-left"></i> Back to Home</button>
        </div>
    </div>
    <%@include file="../utils/footer.jsp" %>
</body>
</html>