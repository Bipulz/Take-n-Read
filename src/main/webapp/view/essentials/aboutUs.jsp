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

        .overview-section {
            max-width: 1100px;
            margin: 0 auto 80px;
            padding: 30px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 0.9s;
        }

        .overview-section h2 {
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

        .team-section {
            max-width: 1100px;
            margin: 0 auto 80px;
            padding: 30px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 1.2s;
        }

        .team-section h2 {
            font-size: 36px;
            font-weight: 600;
            color: #2D3748;
            text-align: center;
            margin-bottom: 40px;
            letter-spacing: 0.5px;
        }

        .team-list {
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .team-list:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 4px 8px rgba(0, 0, 0, 0.1);
            transform: scale(1.02);
        }

        .team-list ul {
            list-style: none;
            padding: 0;
            text-align: center;
        }

        .team-list li {
            font-size: 18px;
            color: #2D3748;
            margin-bottom: 10px;
            line-height: 1.6;
        }

        .contact-section {
            max-width: 1100px;
            margin: 0 auto 80px;
            padding: 30px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 1.5s;
        }

        .contact-section h2 {
            font-size: 36px;
            font-weight: 600;
            color: #2D3748;
            text-align: center;
            margin-bottom: 40px;
            letter-spacing: 0.5px;
        }

        .contact-content {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
        }

        .contact-form {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .contact-form:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 4px 8px rgba(0, 0, 0, 0.1);
            transform: scale(1.02);
        }

        .contact-form h3 {
            font-size: 24px;
            font-weight: 600;
            color: #2D3748;
            margin-bottom: 20px;
        }

        .contact-form label {
            font-size: 14px;
            color: #4B5563;
            display: block;
            margin-bottom: 5px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            font-size: 14px;
            color: #2D3748;
            background: #F9FAFB;
            transition: border-color 0.3s ease;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #A1BFFA;
            outline: none;
        }

        .contact-form textarea {
            resize: vertical;
            min-height: 100px;
        }

        .contact-form button {
            width: 100%;
            padding: 12px;
            background: #A1BFFA;
            border: none;
            border-radius: 8px;
            color: #FFFFFF;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .contact-form button:hover {
            background: #4DB6AC;
        }

        .contact-form .success-message {
            display: none;
            color: #4DB6AC;
            font-size: 16px;
            text-align: center;
            margin-top: 15px;
        }

        .contact-map {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
        }

        .contact-map iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
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

            .overview-section {
                padding: 20px;
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

            .team-section {
                padding: 20px;
            }

            .team-section h2 {
                font-size: 28px;
            }

            .contact-section {
                padding: 20px;
            }

            .contact-section h2 {
                font-size: 28px;
            }

            .contact-content {
                flex-direction: column;
                align-items: center;
            }

            .contact-map iframe {
                height: 300px;
            }
        }
    </style>
    <script>
        function validateForm(event) {
            event.preventDefault();
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const message = document.getElementById('message').value.trim();
            const successMessage = document.querySelector('.success-message');

            if (name === '' || email === '' || message === '') {
                alert('All fields must be filled, and message cannot be empty!');
                return false;
            }

            successMessage.style.display = 'block';
            successMessage.textContent = 'Message sent successfully!';
            document.querySelector('.contact-form form').reset();
            setTimeout(() => {
                successMessage.style.display = 'none';
            }, 3000);
            return true;
        }
    </script>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>
    <div class="hero-section">
        <h1>Take n' Read</h1>
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

        <div class="overview-section">
            <h2>Project Overview</h2>
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-seedling"></i></div>
                    <div class="timeline-content">
                        <h3>2025 - Ideation</h3>
                        <p>Our team formed for the Advanced Programming coursework at Itahari International College and brainstormed Take n' Read, a platform to connect book lovers through buying, selling, and sharing literature, aiming to make reading accessible and sustainable.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-lightbulb"></i></div>
                    <div class="timeline-content">
                        <h3>2025 - Design & Planning</h3>
                        <p>We refined the concept through group discussions, designing a user-friendly system with admin-curated book listings, user-driven sales, and community features for reviews and recommendations.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-code"></i></div>
                    <div class="timeline-content">
                        <h3>2025 - Development</h3>
                        <p>Using Java, JSP, and MySQL, we built the platform, implementing features like secure user authentication, responsive design, and direct buyer-seller communication, overcoming challenges like CSS conflicts through teamwork.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-rocket"></i></div>
                    <div class="timeline-content">
                        <h3>2025 - Completion</h3>
                        <p>We delivered a fully functional Take n' Read platform, tested and polished, ready to foster a vibrant community of book enthusiasts with seamless book exchange capabilities.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="team-section">
            <h2>Meet Our Team</h2>
            <div class="team-list">
                <ul>
                    <li>Bipul Bhandari</li>
                    <li>Bibek Luitel</li>
                    <li>Deepti Dhungana</li>
                    <li>Divyam Adhikari</li>
                    <li>Roshan Bishwas Tharu</li>
                </ul>
            </div>
        </div>

        <div class="divider"></div>

        <div class="contact-section">
            <h2>Contact Us</h2>
            <div class="contact-content">
                <div class="contact-form">
                    <h3>Get in Touch</h3>
                    <form action="${pageContext.request.contextPath}/contact" method="post" onsubmit="return validateForm(event)">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" required>
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                        <label for="message">Message</label>
                        <textarea id="message" name="message" required></textarea>
                        <button type="submit">Send Message</button>
                    </form>
                    <div class="success-message"></div>
                </div>
                <div class="contact-map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d258.10767574384494!2d87.30204282185163!3d26.655449964027643!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ef6ea070e7b18b%3A0x2959e2a3e2bf54e0!2sItahari%20International%20College!5e1!3m2!1sen!2snp!4v1745247779414!5m2!1sen!2snp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </div>

    <%@include file="../utils/footer.jsp" %>
</body>
</html>