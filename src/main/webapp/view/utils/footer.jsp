<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="footer">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap');

        .footer {
            background: #1F2937;
            color: #F9FAFB;
            padding: 2rem 0;
            font-family: 'Inter', sans-serif;
            margin-top: 2rem;
            border-top: 3px solid #A3BFFA;
            position: relative;
            overflow: hidden;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .footer:hover {
            border-top-color: #7C9BF2;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at 10% 20%, rgba(163, 191, 250, 0.15), transparent 70%);
            z-index: 1;
            opacity: 0.5;
        }

        .footer-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            position: relative;
            z-index: 2;
        }

        .footer-column {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
            padding: 0.5rem;
        }

        .footer-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #A3BFFA;
            margin-bottom: 0.75rem;
            position: relative;
        }

        .footer-title::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 30px;
            height: 2px;
            background: linear-gradient(90deg, #A3BFFA, #7C9BF2);
            border-radius: 1px;
            transition: width 0.3s ease;
        }

        .footer-column:hover .footer-title::after {
            width: 50px;
        }

        .footer-description {
            font-size: 0.85rem;
            color: #D1D5DB;
            line-height: 1.4;
            font-weight: 400;
            max-width: 250px;
            word-wrap: break-word;
        }

        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .footer-links li a {
            color: #D1D5DB;
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: color 0.3s ease, transform 0.3s ease, text-shadow 0.3s ease;
        }

        .footer-links li a:hover {
            color: #7C9BF2;
            transform: translateX(4px);
            text-shadow: 0 0 8px rgba(124, 155, 242, 0.5);
        }

        .social-links {
            display: flex;
            gap: 0.75rem;
            margin-top: 0.5rem;
        }

        .social-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            background: #6B7280;
            color: #F9FAFB;
            border-radius: 50%;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .social-icon:hover {
            background: #A3BFFA;
            transform: scale(1.2);
            box-shadow: 0 0 10px rgba(163, 191, 250, 0.6);
        }

        .footer-contact {
            font-size: 0.85rem;
            color: #D1D5DB;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: color 0.3s ease, text-shadow 0.3s ease;
        }

        .footer-contact:hover {
            color: #7C9BF2;
            text-shadow: 0 0 8px rgba(124, 155, 242, 0.5);
        }



        .footer-bottom {
            text-align: center;
            padding-top: 1rem;
            margin-top: 1rem;
            border-top: 1px solid #374151;
            font-size: 0.8rem;
            color: #D1D5DB;
            font-weight: 400;
            position: relative;
        }

        .footer-bottom::before {
            content: '📚';
            position: absolute;
            top: -0.5rem;
            left: 50%;
            transform: translateX(-50%);
            font-size: 1rem;
            color: #A3BFFA;
            background: #1F2937;
            padding: 0 0.5rem;
        }

        @media (max-width: 768px) {
            .footer-container {
                grid-template-columns: 1fr;
                gap: 1.25rem;
                text-align: center;
            }

            .social-links {
                justify-content: center;
            }

            .footer-links {
                align-items: center;
            }

            .footer-contact {
                justify-content: center;
            }

            .footer-title::after {
                left: 50%;
                transform: translateX(-50%);
            }

            .footer-description {
                max-width: 100%;
            }

            .footer-static {
                margin-top: 0.5rem;
            }
        }

        @media (max-width: 480px) {
            .footer {
                padding: 1.5rem 0;
                margin-top: 1.5rem;
            }

            .footer-container {
                padding: 0 1rem;
                gap: 1rem;
            }

            .footer-title {
                font-size: 1.1rem;
            }

            .footer-description, .footer-links li a, .footer-contact {
                font-size: 0.8rem;
            }

            .social-icon {
                width: 32px;
                height: 32px;
            }



            .footer-bottom {
                font-size: 0.75rem;
            }

            .footer-bottom::before {
                font-size: 0.9rem;
            }
        }
    </style>
    <div class="footer-container">
        <div class="footer-column">
            <h4 class="footer-title">Take n' Read</h4>
            <p class="footer-description">
                Buy and sell books online. Explore Nepali and global reads.
            </p>
            <div class="social-links">
                <a href="#" class="social-icon"><i class="fa-brands fa-facebook"></i></a>
                <a href="#" class="social-icon"><i class="fa-brands fa-x-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
                <a href="#" class="social-icon"><i class="fa-brands fa-tiktok"></i></a>
            </div>
          
        </div>
        <div class="footer-column">
            <h4 class="footer-title">Quick Links</h4>
            <ul class="footer-links">
                <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="#"><i class="fas fa-cogs"></i> Our Services</a></li>
                <li><a href="#"><i class="fas fa-tools"></i> Manage</a></li>
                <li><a href="#"><i class="fas fa-info-circle"></i> About Us</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4 class="footer-title">Contact</h4>
            <p class="footer-contact"><i class="fas fa-envelope"></i> info@takeNread.com</p>
            <p class="footer-contact"><i class="fas fa-phone-alt"></i> +977 1-2345678</p>
     
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2025 Take n' Read. All rights reserved.</p>
    </div>
</footer>