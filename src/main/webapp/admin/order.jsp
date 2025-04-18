<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <i class="fas fa-book"></i>
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
                <span>Total Orders: 5</span>
            </div>
            <div class="summary-item">
                <i class="fas fa-book"></i>
                <span>Most Ordered Book: Muna Madan (2 orders)</span>
            </div>
            <div class="summary-item">
                <i class="fas fa-money-bill"></i>
                <span>Total Payment: Rs 1550.00</span>
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
                    <tr>
                        <td class="order-id">1</td>
                        <td class="name">Ramesh Shrestha</td>
                        <td class="email">ramesh@gmail.com</td>
                        <td class="address">Kathmandu, Nepal</td>
                        <td>9841234567</td>
                        <td class="book-name">Muna Madan</td>
                        <td class="author">Laxmi Prasad Devkota</td>
                        <td class="price">250.00</td>
                        <td class="payment-type"><span class="online">Online</span></td>
                    </tr>
                    <tr>
                        <td class="order-id">2</td>
                        <td class="name">Sita Thapa</td>
                        <td class="email">sita123@gmail.com</td>
                        <td class="address">Pokhara, Nepal</td>
                        <td>9851234568</td>
                        <td class="book-name">Muna Madan</td>
                        <td class="author">Laxmi Prasad Devkota</td>
                        <td class="price">250.00</td>
                        <td class="payment-type"><span class="online">Online</span></td>
                    </tr>
                    <tr>
                        <td class="order-id">3</td>
                        <td class="name">Hari Gurung</td>
                        <td class="email">hari@gmail.com</td>
                        <td class="address">Biratnagar, Nepal</td>
                        <td>9861234569</td>
                        <td class="book-name">Shirishko Phool</td>
                        <td class="author">Parijat</td>
                        <td class="price">350.00</td>
                        <td class="payment-type"><span class="online">Online</span></td>
                    </tr>
                    <tr>
                        <td class="order-id">4</td>
                        <td class="name">Gita Lama</td>
                        <td class="email">gita@gmail.com</td>
                        <td class="address">Lalitpur, Nepal</td>
                        <td>9871234570</td>
                        <td class="book-name">Seto Bagh</td>
                        <td class="author">Diamond Shumsher Rana</td>
                        <td class="price">400.00</td>
                        <td class="payment-type"><span class="online">Online</span></td>
                    </tr>
                    <tr>
                        <td class="order-id">5</td>
                        <td class="name">Anil Rai</td>
                        <td class="email">anil.rai@gmail.com</td>
                        <td class="address">Dharan, Nepal</td>
                        <td>9881234571</td>
                        <td class="book-name">Jhola</td>
                        <td class="author">Krishna Dharabasi</td>
                        <td class="price">300.00</td>
                        <td class="payment-type"><span class="online">Online</span></td>
                    </tr>
                    <tr class="no-orders">
                        <td colspan="9">No Orders Found</td>
                    </tr>
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