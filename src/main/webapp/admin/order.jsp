<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectionDAO, model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details - Take n' Read</title>
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
            border-bottom: 2px solid;
            border-image: linear-gradient(to right, #A3BFFA, #7C9BF2) 1;
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
        }

        .logo i {
            margin-right: 10px;
            color: #A3BFFA;
            font-size: 22px;
        }

        nav {
            background: #6B7280;
            padding: 10px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav a {
            color: #FFFFFF;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        nav a:hover {
            background: #A3BFFA;
            color: #FFFFFF;
        }

        nav a i {
            color: #A3BFFA;
            font-size: 14px;
        }

        .main-content {
            padding: 30px 20px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .main-content h1 {
            font-size: 26px;
            color: #374151;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 700;
        }

        .divider {
            height: 4px;
            background: linear-gradient(to right, #A3BFFA, #FFFFFF);
            margin-bottom: 20px;
            border-radius: 2px;
        }

        .summary-card {
            background: #FFFFFF;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            transition: box-shadow 0.3s ease;
        }

        .summary-card:hover {
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0%, 100% { box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
            50% { box-shadow: 0 8px 16px rgba(163, 191, 250, 0.5); }
        }

        .summary-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: #374151;
            transition: opacity 0.3s ease;
        }

        .summary-item:hover {
            animation: fadeHover 0.5s ease;
        }

        @keyframes fadeHover {
            0% { opacity: 0.7; }
            100% { opacity: 1; }
        }

        .summary-item i {
            color: #A3BFFA;
            font-size: 16px;
            transition: transform 0.3s ease;
        }

        .summary-item:hover i {
            transform: scale(1.2);
        }

        .table-controls {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            padding: 8px 12px;
            width: 350px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 4px 8px rgba(0, 0, 0, 0.05);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .search-bar:hover, .search-bar:focus-within {
            border-color: #A3BFFA;
            box-shadow: 0 6px 12px rgba(163, 191, 250, 0.3), 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .search-bar.no-results {
            animation: shake 0.5s ease;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .search-bar input {
            border: none;
            outline: none;
            font-size: 14px;
            color: #374151;
            width: 100%;
        }

        .search-bar input::placeholder {
            color: #9CA3AF;
        }

        .search-bar i {
            color: #4B5563;
            margin-right: 8px;
        }

        .table-container {
            background: #FFFFFF;
            border-radius: 16px;
            box-shadow: 0 10px 24px rgba(0, 0, 0, 0.25);
            overflow-x: auto;
            overflow: hidden;
            position: relative;
            border: 1px solid #E5E7EB;
            min-width: 100%;
        }

        .table-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, #F9FAFB 25%, transparent 25%, transparent 75%, #F9FAFB 75%),
                        linear-gradient(45deg, #F9FAFB 25%, transparent 25%, transparent 75%, #F9FAFB 75%);
            background-size: 20px 20px;
            background-position: 0 0, 10px 10px;
            opacity: 0.07;
            z-index: -1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            font-size: 14px;
            color: #374151;
            table-layout: fixed;
        }

        table, th, td {
            box-sizing: border-box;
        }

        thead {
            background: linear-gradient(135deg, #6B7280, #4B5563);
            color: #FFFFFF;
            position: sticky;
            top: 0;
            z-index: 10;
            animation: fadeInHeader 0.5s ease-out;
        }

        @keyframes fadeInHeader {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        th {
            padding: 12px 14px;
            text-align: center;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 13px;
            transition: box-shadow 0.3s ease;
        }

        th:hover {
            box-shadow: inset 0 0 6px rgba(163, 191, 250, 0.4);
        }

        th.name, th.email, th.address, th.book-name, th.author {
            text-align: left;
        }

        tbody tr {
            border-bottom: 1px solid #E5E7EB;
            transition: background 0.2s ease, opacity 0.2s ease;
            animation: slideIn 0.5s ease-out forwards;
            will-change: background, opacity;
            backface-visibility: hidden;
            transform: translateZ(0);
            contain: layout;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        tbody tr:nth-child(even) {
            background: #F9FAFB;
        }

        tbody tr:hover {
            background: #E8EDFF;
            opacity: 0.95;
        }

        td {
            padding: 12px 14px;
            font-size: 14px;
            font-weight: 400;
            text-align: center;
            border-right: 1px solid #E5E7EB;
        }

        td:last-child {
            border-right: none;
        }

        td.name, td.email, td.address, td.book-name, td.author {
            text-align: left;
        }

        td.email {
            white-space: normal;
            max-width: 350px; 
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        }

        td.order-id {
            font-size: 13px;
        }

        td.price::before {
            content: 'Rs ';
            color: #4B5563;
        }

        td.payment-type span {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
            background: #10B981;
            color: #FFFFFF;
            position: relative;
            overflow: hidden;
        }

        td.payment-type span::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            animation: shine 2s infinite;
        }

        @keyframes shine {
            0% { left: -100%; }
            50% { left: 100%; }
            100% { left: 100%; }
        }

        .no-orders {
            display: none;
            text-align: center;
            color: #6B7280;
            font-size: 14px;
            font-weight: 500;
            padding: 20px;
        }

        .no-orders.show {
            display: table-row;
        }

        footer {
            background: #FFFFFF;
            padding: 15px 40px;
            text-align: center;
            color: #6B7280;
            font-size: 14px;
            border-top: 1px solid #A3BFFA;
            margin-top: 30px;
        }

        @media (max-width: 900px) {
            th.email, td.email {
                min-width: 300px;
            }
            th.address, td.address {
                min-width: 180px;
            }
        }

        @media (max-width: 768px) {
            header {
                padding: 10px 20px;
            }

            nav {
                padding: 8px 20px;
            }

            .main-content {
                padding: 25px 15px;
            }

            .main-content h1 {
                font-size: 22px;
            }

            .summary-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .table-controls {
                flex-direction: column;
                align-items: center;
            }

            .search-bar {
                width: 100%;
            }

            .table-container {
                margin: 0 10px;
            }

            table {
                font-size: 13px;
            }

            th, td {
                padding: 8px 10px;
            }

            footer {
                padding: 12px 20px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 22px;
            }

            .main-content h1 {
                font-size: 20px;
                margin-bottom: 15px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 6px 8px;
            }

            .search-bar {
                padding: 6px 10px;
            }

            .summary-item {
                font-size: 13px;
            }

            .summary-item i {
                font-size: 14px;
            }

            footer {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fa-solid fa-book-open-reader"></i>
            Take n' Read
        </div>
    </header>

    <nav>
        <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
    </nav>

    <div class="main-content">
        <h1>Order Details</h1>
        <div class="divider"></div>
        <div class="summary-card">
            <div class="summary-item">
                <i class="fas fa-shopping-cart"></i>
                <span>Total Orders: <span id="totalOrders">0</span></span>
            </div>
            <div class="summary-item">
                <i class="fas fa-book"></i>
                <span>Most Ordered Book: <span id="mostOrdered">N/A</span></span>
            </div>
            <div class="summary-item">
                <i class="fas fa-money-bill"></i>
                <span>Total Payment: Rs <span id="totalPayment">0.00</span></span>
            </div>
        </div>
        <div class="table-controls">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search orders by book name...">
            </div>
        </div>
        <div class="table-container">
            <table id="orderTable">
                <thead>
                    <tr>
                        <th class="order-id" style="min-width: 50px;">Order Id</th>
                        <th class="name" style="min-width: 140px;">Name</th>
                        <th class="email" style="min-width: 350px;">EMail</th> 
                        <th class="address" style="min-width: 200px;">Address</th>
                        <th style="min-width: 120px;">Ph No</th>
                        <th class="book-name" style="min-width: 160px;">Book Name</th>
                        <th class="author" style="min-width: 140px;">Author</th>
                        <th style="min-width: 100px;">Price</th>
                        <th style="min-width: 120px;">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User user = (User) session.getAttribute("user");
                        if (user == null) {
                            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+to+view+orders&redirectPage=" + java.net.URLEncoder.encode("/view/order.jsp", "UTF-8"));
                            return;
                        }

                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        boolean hasOrders = false;

                        try {
                            conn = connectionDAO.getconn();
                            if (conn == null) {
                                out.println("<tr><td colspan='9'>Error: Database connection failed.</td></tr>");
                            } else {
                                String sql;
                                if (user.getEmail().equalsIgnoreCase("admin@gmail.com")) {
                                    // Admin sees all orders
                                    sql = "SELECT * FROM book_order ORDER BY id DESC";
                                } else {
                                    // Normal user sees orders for admin-added books
                                    sql = "SELECT bo.* FROM book_order bo JOIN book b ON bo.book_name = b.bookname WHERE b.user_email = 'admin@gmail.com' AND bo.user_name = ? ORDER BY bo.id DESC";
                                    stmt = conn.prepareStatement(sql);
                                    stmt.setString(1, user.getName());
                                }
                                if (!user.getEmail().equalsIgnoreCase("admin@gmail.com")) {
                                    stmt = conn.prepareStatement(sql);
                                    stmt.setString(1, user.getName());
                                } else {
                                    stmt = conn.prepareStatement(sql);
                                }
                                rs = stmt.executeQuery();

                                int totalOrders = 0;
                                double totalPayment = 0.0;
                                String mostOrderedBook = "N/A";
                                int maxOrderCount = 0;

                                java.util.Map<String, Integer> bookOrderCount = new java.util.HashMap<>();

                                while (rs.next()) {
                                    hasOrders = true;
                                    totalOrders++;
                                    String orderId = rs.getString("order_id");
                                    String userName = rs.getString("user_name");
                                    String email = rs.getString("email");
                                    String address = rs.getString("address");
                                    String phone = rs.getString("phone");
                                    String bookName = rs.getString("book_name");
                                    String author = rs.getString("author");
                                    double price = rs.getDouble("price");
                                    String payment = rs.getString("payment");
                                    totalPayment += price;

                                    // Track most ordered book
                                    bookOrderCount.merge(bookName, 1, Integer::sum);
                                    int count = bookOrderCount.get(bookName);
                                    if (count > maxOrderCount) {
                                        maxOrderCount = count;
                                        mostOrderedBook = bookName;
                                    }
                    %>
                    <tr>
                        <td class="order-id"><%= orderId %></td>
                        <td class="name"><%= userName %></td>
                        <td class="email"><%= email %></td>
                        <td class="address"><%= address %></td>
                        <td><%= phone %></td>
                        <td class="book-name"><%= bookName %></td>
                        <td class="author"><%= author %></td>
                        <td class="price"><%= price %></td>
                        <td class="payment-type"><span><%= payment %></span></td>
                    </tr>
                    <%
                                }

                                // Update summary card dynamically
                                out.println("<script>");
                                out.println("document.getElementById('totalOrders').textContent = '" + totalOrders + "';");
                                out.println("document.getElementById('mostOrdered').textContent = '" + mostOrderedBook + "';");
                                out.println("document.getElementById('totalPayment').textContent = '" + String.format("%.2f", totalPayment) + "';");
                                out.println("</script>");
                            }
                        } catch (SQLException e) {
                            out.println("<tr><td colspan='9'>Error loading orders: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignore */ }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* Ignore */ }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignore */ }
                        }

                        if (!hasOrders) {
                    %>
                    <tr class="no-orders">
                        <td colspan="9">No Orders Found</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        © 2025 Take n' Read. All rights reserved.
    </footer>

    <script>
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('#orderTable tbody tr:not(.no-orders)');
            const noOrdersRow = document.querySelector('#orderTable .no-orders');
            const searchBar = document.querySelector('.search-bar');
            let visibleRows = 0;

            rows.forEach(row => {
                const bookName = row.querySelector('.book-name').textContent.toLowerCase();
                const isVisible = bookName.includes(searchTerm);
                row.style.display = isVisible ? '' : 'none';
                if (isVisible) visibleRows++;
            });

            noOrdersRow.classList.toggle('show', visibleRows === 0);
            searchBar.classList.toggle('no-results', visibleRows === 0);
            if (visibleRows > 0) searchBar.classList.remove('no-results');
        });
    </script>
</body>
</html>