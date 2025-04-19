<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #F0F4F8, #E6E9F0);
            color: #2D3748;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
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

        .hero-section {
            position: relative;
            background: linear-gradient(135deg, rgba(161, 191, 250, 0.1), rgba(255, 255, 255, 0.3));
            padding: 100px 20px;
            text-align: center;
            margin-bottom: 60px;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.2), transparent);
            transform: translateY(-20%);
            animation: parallax 20s linear infinite;
        }

        @keyframes parallax {
            0% { transform: translateY(-20%); }
            100% { transform: translateY(20%); }
        }

        .hero-section h1 {
            font-size: 48px;
            font-weight: 700;
            color: #2D3748;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        .hero-section p {
            font-size: 20px;
            color: #718096;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .about-container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 40px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 0.3s;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .about-content {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
            margin-bottom: 80px;
        }

        .about-card {
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            border-radius: 16px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.05);
            padding: 30px;
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            transition: box-shadow 0.3s ease, transform 0.3s ease, border 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .about-card:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 4px 8px rgba(0, 0, 0, 0.1);
            transform: scale(1.05);
            border: 2px solid rgba(161, 191, 250, 0.3);
        }

        .about-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.5), rgba(249, 250, 251, 0.3));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .about-card:hover::before {
            opacity: 1;
        }

        .about-card i {
            font-size: 48px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .about-card:hover i {
            transform: scale(1.2);
        }

        .about-card.buy i {
            color: #A1BFFA;
        }

        .about-card.sell i {
            color: #FF9999;
        }

        .about-card.connect i {
            color: #4DB6AC;
        }

        .about-card h3 {
            font-size: 24px;
            font-weight: 600;
            color: #2D3748;
            margin-bottom: 12px;
            letter-spacing: 0.5px;
        }

        .about-card p {
            font-size: 16px;
            color: #718096;
            line-height: 1.6;
        }

        .divider {
            width: 100px;
            height: 3px;
            background: #A1BFFA;
            margin: 60px auto;
            border-radius: 3px;
            box-shadow: 0 2px 4px rgba(161, 191, 250, 0.3);
        }

        .mission-section {
            background: linear-gradient(135deg, #F9FAFB, #E6E9F0);
            border-radius: 16px;
            padding: 50px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.05);
            text-align: center;
            margin-bottom: 80px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 0.6s;
        }

        .mission-section h2 {
            font-size: 36px;
            font-weight: 600;
            color: #2D3748;
            margin-bottom: 20px;
            letter-spacing: 0.5px;
        }

        .mission-section p {
            font-size: 18px;
            color: #718096;
            max-width: 900px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .timeline-section {
            max-width: 1100px;
            margin: 0 auto 80px;
            padding: 30px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 0.9s;
        }

        .timeline-section h2 {
            font-size: 36px;
            font-weight: 600;
            color: #2D3748;
            text-align: center;
            margin-bottom: 40px;
            letter-spacing: 0.5px;
        }

        .timeline {
            position: relative;
            padding: 30px 0;
        }

        .timeline::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, #A1BFFA, #4DB6AC);
            transform: translateX(-50%);
            opacity: 0.5;
        }

        .timeline-item {
            display: flex;
            align-items: center;
            margin-bottom: 50px;
            position: relative;
            width: 100%;
        }

        .timeline-item:nth-child(odd) {
            flex-direction: row;
        }

        .timeline-item:nth-child(even) {
            flex-direction: row-reverse;
        }

        .timeline-content {
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            border-radius: 12px;
            padding: 25px;
            width: 45%;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .timeline-content:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 4px 8px rgba(0, 0, 0, 0.1);
            transform: scale(1.03);
        }

        .timeline-content h3 {
            font-size: 20px;
            font-weight: 600;
            color: #2D3748;
            margin-bottom: 10px;
            letter-spacing: 0.3px;
        }

        .timeline-content p {
            font-size: 16px;
            color: #718096;
            line-height: 1.6;
        }

        .timeline-icon {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #A1BFFA, #4DB6AC);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFFFF;
            font-size: 24px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .timeline-icon:hover {
            transform: translateX(-50%) scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 80px 15px;
            }

            .hero-section h1 {
                font-size: 36px;
            }

            .hero-section p {
                font-size: 18px;
            }

            .about-container {
                padding: 30px;
            }

            .about-card {
                flex: 0 0 90%;
                padding: 25px;
            }

            .mission-section {
                padding: 40px;
            }

            .mission-section h2 {
                font-size: 28px;
            }

            .mission-section p {
                font-size: 16px;
            }

            .timeline::before {
                left: 25px;
            }

            .timeline-item {
                flex-direction: column !important;
                align-items: flex-start;
            }

            .timeline-content {
                width: 100%;
                margin-left: 60px;
            }

            .timeline-icon {
                left: 25px;
                width: 40px;
                height: 40px;
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>

    <div class="hero-section">
        <h1>Welcome to Take n' Read</h1>
        <p>A vibrant community where book lovers buy, sell, and share stories, connecting through the love of literature.</p>
    </div>

    <div class="about-container">
        <div class="about-content">
            <div class="about-card buy">
                <i class="fas fa-book-open"></i>
                <h3>Buy Books</h3>
                <p>Explore admin-curated books for instant purchase or connect with users to buy their unique listings.</p>
            </div>
            <div class="about-card sell">
                <i class="fas fa-hand-holding-dollar"></i>
                <h3>Sell Books</h3>
                <p>List your books and reach buyers directly, turning your old reads into new opportunities.</p>
            </div>
            <div class="about-card connect">
                <i class="fas fa-users"></i>
                <h3>Connect & Share</h3>
                <p>Join a community of readers to exchange books, stories, and ideas, fostering a love for reading.</p>
            </div>
        </div>

        <div class="divider"></div>

        <div class="mission-section">
            <h2>Our Mission</h2>
            <p>At Take n' Read, we believe every book deserves a new home. Our platform empowers users to buy and sell books effortlessly—whether through direct purchases of admin-listed titles or personal connections with user-listed books. We’re building a community where stories are shared, connections are made, and reading thrives.</p>
        </div>

        <div class="divider"></div>

        <div class="timeline-section">
            <h2>Our Journey</h2>
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-seedling"></i></div>
                    <div class="timeline-content">
                        <h3>2023 - The Idea</h3>
                        <p>Take n' Read was born from a passion to connect book lovers and make literature accessible.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-book"></i></div>
                    <div class="timeline-content">
                        <h3>2024 - Launch</h3>
                        <p>We launched our platform, enabling users to buy admin-curated books and sell their own.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-users"></i></div>
                    <div class="timeline-content">
                        <h3>2025 - Community Growth</h3>
                        <p>Our community thrives, with thousands of books exchanged and stories shared.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="../utils/footer.jsp" %>
</body>
</html>