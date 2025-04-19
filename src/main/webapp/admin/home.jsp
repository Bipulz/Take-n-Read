<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take n' Read Admin Dashboard</title>
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
        }

        header {
            background: #FFFFFF;
            padding: 15px 40px;
            border-bottom: 2px solid #A3BFFA;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 28px;
            font-weight: 700;
            color: #374151;
        }

        .logo i {
            margin-right: 8px;
            color: #A3BFFA;
            font-size: 20px;
        }

        nav {
            background: #6B7280;
            padding: 12px 40px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav a {
            color: #FFFFFF;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        nav a:hover {
            color: #A3BFFA;
        }

        nav a i {
            color: #A3BFFA;
            font-size: 15px;
        }

        .main-content {
            text-align: center;
            padding: 40px 20px;
        }

        .main-content h1 {
            font-size: 36px;
            margin-bottom: 40px;
            color: #374151;
            font-weight: 700;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            background: #FFFFFF;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.04);
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
            text-decoration: none;
            color: inherit;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 10px rgba(163, 191, 250, 0.7);
            cursor: pointer;
        }

        .card i {
            font-size: 40px;
            margin-bottom: 20px;
            color: #A3BFFA;
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #374151;
            font-weight: 500;
        }

        .card .divider {
            border: none;
            border-top: 2px dashed #E5E7EB;
            margin: 10px 0;
        }

        .card:nth-child(2) i {
            color: #F87171;
        }

        .card:nth-child(3) i {
            color: #FBBF24;
        }

        .card:nth-child(4) i {
            color: #6B7280;
        }

        footer {
            background: #6B7280;
            color: #FFFFFF;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        footer p {
            font-size: 14px;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            header {
                padding: 10px 20px;
            }

            nav {
                padding: 10px 20px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .main-content h1 {
                font-size: 28px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 24px;
            }

            nav a {
                font-size: 14px;
            }

            .main-content h1 {
                font-size: 24px;
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
        <h1></h1>
        <div class="cards">
            <a href="addbook.jsp" class="card">
                <i class="fas fa-plus-square"></i>
                <h3>Add Books</h3>
                <hr class="divider">
            </a>
            <a href="allBook.jsp" class="card">
                <i class="fas fa-book-open"></i>
                <h3>All Books</h3>
                <hr class="divider">
            </a>
            <a href="order.jsp" class="card">
                <i class="fas fa-box-open"></i>
                <h3>Order</h3>
                <hr class="divider">
            </a>
				<a href="${pageContext.request.contextPath}/logout" class="card">
				    <i class="fas fa-sign-out-alt"></i>
				    <h3>Logout</h3>
				    <hr class="divider">
				</a>
</div>
    </div>

    <footer>
        <p>© Copyright Design and Developed by Take n' Read Team</p>
    </footer>
</body>
</html>