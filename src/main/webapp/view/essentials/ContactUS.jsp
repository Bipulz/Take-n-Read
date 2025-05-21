<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Take n' Read</title>
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

        .contact-container {
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

        .contact-content {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
            margin-bottom: 80px;
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

        .contact-info {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .contact-info:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 4px 8px rgba(0, 0, 0, 0.1);
            transform: scale(1.02);
        }

        .contact-info h3 {
            font-size: 24px;
            font-weight: 600;
            color: #2D3748;
            margin-bottom: 20px;
        }

        .contact-info p {
            font-size: 16px;
            color: #718096;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .contact-info i {
            color: #A1BFFA;
            margin-right: 10px;
            font-size: 20px;
        }

        .contact-map {
            max-width: 1100px;
            margin: 0 auto 80px;
            padding: 30px;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
            animation-delay: 0.6s;
        }

        .contact-map iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .divider {
            width: 100px;
            height: 3px;
            background: #A1BFFA;
            margin: 60px auto;
            border-radius: 3px;
            box-shadow: 0 2px 4px rgba(161, 191, 250, 0.3);
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

            .contact-container {
                padding: 30px;
            }

            .contact-content {
                flex-direction: column;
                align-items: center;
            }

            .contact-map {
                padding: 20px;
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
        <h1>Contact Us</h1>
        <p>We're here to help! Reach out with any questions, feedback, or inquiries about Take n' Read.</p>
    </div>

    <div class="contact-container">
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
            <div class="contact-info">
                <h3>Contact Information</h3>
                <p><i class="fas fa-envelope"></i>Email: support@takenread.com</p>
                <p><i class="fas fa-phone"></i>Phone: +977-123-456-7890</p>
                <p><i class="fas fa-map-marker-alt"></i>Address: Itahari International College, Itahari, Nepal</p>
                <p><i class="fas fa-clock"></i>Hours: Mon-Fri, 9 AM - 5 PM</p>
            </div>
        </div>

        <div class="divider"></div>

        <div class="contact-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d258.10767574384494!2d87.30204282185163!3d26.655449964027643!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ef6ea070e7b18b%3A0x2959e2a3e2bf54e0!2sItahari%20International%20College!5e1!3m2!1sen!2snp!4v1745247779414!5m2!1sen!2snp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>

    <%@include file="../utils/footer.jsp" %>
</body>
</html>