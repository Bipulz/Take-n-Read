<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Features</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #F0F4F8, #E6E9F0);
            color: #333;
            min-height: 100vh;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 20%, transparent 20%);
            background-size: 20px 20px;
            opacity: 0.3;
            z-index: -1;
        }

        .features-container {
            max-width: 1400px;
            margin: 60px auto;
            padding: 30px;
        }

        .features-row {
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
            justify-content: center;
        }

        .feature-card {
            background: linear-gradient(135deg, #FFFFFF, #F5F7FA);
            border-radius: 16px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            transition: box-shadow 0.2s ease;
            position: relative;
            overflow: hidden;
            flex: 0 0 auto;
            text-decoration: none;
            color: inherit;
        }

        .feature-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            cursor: pointer;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.15);
            opacity: 0;
            transition: opacity 0.2s ease;
        }

        .feature-card:hover::before {
            opacity: 0.4;
        }

        .feature-card i {
            font-size: 48px;
            margin-bottom: 15px;
            transition: transform 0.2s ease;
        }

        .feature-card:hover i {
            transform: scale(1.05);
        }

        .feature-card.sell i {
            color: #A1BFFA;
        }

        .feature-card.profile i {
            color: #A1BFFA;
        }

        .feature-card.order i {
            color: #D4AF37;
        }

        .feature-card.wishlist i {
            color: #FF9999;
        }

        .feature-card.notifications i {
            color: #A3CFFA;
        }

        .feature-card h3 {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            position: relative;
        }

        .feature-card h3::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 1px;
            border-bottom: 2px dashed #A1BFFA;
        }

        .feature-card p {
            font-size: 14px;
            color: #666;
        }

        .coming-soon {
            display: inline-block;
            margin-top: 15px;
            padding: 6px 12px;
            background: #4DB6AC;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: 500;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(77, 182, 172, 0.3);
            text-transform: uppercase;
        }

        /* First row: Larger cards */
        .features-row:first-child .feature-card {
            flex: 0 0 350px;
            padding: 40px;
        }

        .features-row:first-child .feature-card i {
            font-size: 56px;
        }

        .features-row:first-child .feature-card h3 {
            font-size: 24px;
        }

        /* Second row: Smaller cards */
        .features-row:last-child .feature-card {
            flex: 0 0 300px;
        }

        @media (max-width: 768px) {
            .features-row {
                flex-direction: column;
                align-items: center;
            }

            .feature-card {
                padding: 20px;
                flex: 0 0 90%;
            }

            .features-row:first-child .feature-card {
                padding: 30px;
                flex: 0 0 90%;
            }

            .features-row:first-child .feature-card i {
                font-size: 48px;
            }
        }
    </style>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>

    <div class="features-container">
      
        <div class="features-row">
            <a href="${pageContext.request.contextPath}/view/BookUtils/sellBook.jsp" class="feature-card sell">
                <i class="fas fa-book-open"></i>
                <h3>Sell Old Book</h3>
                <p>List Your Books</p>
            </a>
            <a href="${pageContext.request.contextPath}/view/essentials/profile.jsp" class="feature-card profile">
                <i class="fas fa-user-shield"></i>
                <h3>Login & Security</h3>
                <p>Edit Profile</p>
            </a>
        </div>
     
        <div class="features-row">
            <a href="${pageContext.request.contextPath}/view/order/userOrder.jsp" class="feature-card order">
                <i class="fas fa-box"></i>
                <h3>My Order</h3>
                <p>Track your Order</p>
            </a>
            <div class="feature-card wishlist">
                <i class="fas fa-heart"></i>
                <h3>Wishlist</h3>
                <p>View Saved Items</p>
                <span class="coming-soon">Coming Soon</span>
            </div>
            <div class="feature-card notifications">
                <i class="fas fa-bell"></i>
                <h3>Notifications</h3>
                <p>Stay Updated</p>
                <span class="coming-soon">Coming Soon</span>
            </div>
        </div>
    </div>

    <%@include file="../utils/footer.jsp" %>
</body>
</html>