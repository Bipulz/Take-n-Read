<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        .thank-you-container {
            background: linear-gradient(135deg, #F9FAFB 0%, #E8EDFF 100%);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px); /* Adjust for navbar and footer */
            color: #374151;
            padding: 20px;
        }

        .thank-you-container .inner {
            background: #FFFFFF;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 90%;
            max-width: 500px;
            border: 1px solid #E5E7EB;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .header {
            font-size: 32px;
            font-weight: 700;
            color: #374151;
            margin-bottom: 15px;
        }

        .message {
            font-size: 18px;
            font-weight: 400;
            color: #4B5563;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .icons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .tick {
            font-size: 40px;
            color: #4CAF50;
            animation: bounce 0.6s ease-in-out;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-15px); }
            60% { transform: translateY(-7px); }
        }

        .view-order-button {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            background: #7C9BF2;
            color: #FFFFFF;
            transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin: 0 auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-decoration: none;
        }

        .view-order-button:hover {
            background: #5A7CBA;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .view-order-button i {
            font-size: 18px;
            transition: transform 0.3s ease;
        }

        .view-order-button:hover i {
            transform: rotate(15deg);
        }

        @media (max-width: 768px) {
            .thank-you-container .inner {
                padding: 20px;
            }

            .header {
                font-size: 24px;
            }

            .message {
                font-size: 16px;
            }

            .tick {
                font-size: 30px;
            }

            .view-order-button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>
    <div class="thank-you-container">
        <div class="inner">
            <div class="header">Thank You!</div>
            <div class="message">Your order is successfully done. Your order will be delivered within 7 days to your provided address.</div>
            <div class="icons">
                <i class="fas fa-check tick"></i>
                <i class="fas fa-check tick"></i>
            </div>
            <a href="${pageContext.request.contextPath}/view/order/userOrder.jsp" class="view-order-button">
                <i class="fas fa-eye"></i> View Order
            </a>
        </div>
    </div>
    <%@include file="../utils/footer.jsp" %>
</body>
</html>