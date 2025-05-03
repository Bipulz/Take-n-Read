<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details - Palpasa Cafe</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: #E5E7EB;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            color: #374151;
        }

        .main-content {
            padding: 30px 20px;
            max-width: 1400px;
            margin: 0 auto;
            min-height: calc(100vh - 200px);
        }

        .book-details-container {
            max-width: 1100px;
            margin: 0 auto;
            background: linear-gradient(135deg, #F9FAFB, #E5E7EB);
            border-radius: 16px;
            box-shadow: 0 12px 28px rgba(55, 65, 81, 0.3), 0 6px 12px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            border-left: 6px solid #374151; 
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .book-details-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 16px 32px rgba(55, 65, 81, 0.4), 0 8px 16px rgba(0, 0, 0, 0.25);
        }

        .image-container {
            background: linear-gradient(135deg, #F9FAFB, #E5E7EB); 
            width: 40%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 3rem;
        }

        .image-container img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
            border: 1px solid #E5E7EB;
        }

        .image-container:hover img {
            transform: scale(1.05);
        }

        .details-container {
            padding: 3rem;
            width: 60%;
            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .details-container h2 {
            font-size: 2.5rem;
            margin: 0;
            color: #374151;
            font-weight: 700;
            line-height: 1.3;
            position: relative;
            margin-bottom: 1rem;
        }

        .details-container h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #A3BFFA, #7C9BF2);
            border-radius: 2px;
        }

        .book-author {
            font-size: 1.2rem;
            color: #6B7280;
            font-style: italic;
            margin: 1rem 0;
            letter-spacing: 0.5px;
        }

        .book-category {
            font-size: 1.1rem;
            color: #6B7280;
            margin: 1rem 0;
            display: flex;
            align-items: center;
            gap: 10px;
            letter-spacing: 0.5px;
        }

        .category-tags {
            display: flex;
            gap: 12px;
            margin: 1rem 0;
        }

        .category-tag {
            padding: 6px 14px;
            border-radius: 12px;
            font-size: 0.9rem;
            font-weight: 500;
            color: #374151;
            background: #E5E7EB;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .category-tag.new {
            background: #A3BFFA;
            color: #FFFFFF;
        }

        .category-tag.old {
            background: #6B7280;
            color: #FFFFFF;
        }

        .category-tag:hover {
            background: #7C9BF2;
            color: #FFFFFF;
            transform: translateY(-2px);
        }

        .features {
            display: flex;
            gap: 20px;
            font-size: 1rem;
            color: #6B7280;
            margin: 1.5rem 0;
        }

        .features span {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #E5E7EB;
            padding: 8px 15px;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background 0.3s ease, transform 0.3s ease;
            letter-spacing: 0.5px;
        }

        .features span:hover {
            background: #d4d8e2;
            transform: translateY(-2px);
        }

        .features i {
            color: #A3BFFA;
            font-size: 1.1rem;
        }

        .price {
            font-size: 1.75rem;
            color: #374151;
            margin: 1.5rem 0;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .add-cart-btn {
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease, opacity 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            background: #6B7280;
            color: #FFFFFF;
            align-self: flex-end;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            position: relative;
            overflow: hidden;
        }

        .add-cart-btn:hover {
            background: #7C9BF2;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .add-cart-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.6s ease;
        }

        .add-cart-btn:hover::before {
            left: 100%;
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

        @media (max-width: 768px) {
            .main-content {
                padding: 25px 15px;
            }

            .book-details-container {
                flex-direction: column;
                max-width: 90%;
            }

            .image-container {
                width: 100%;
                padding: 2rem;
            }

            .details-container {
                width: 100%;
                padding: 2rem;
            }

            .details-container h2 {
                font-size: 2rem;
            }

            .book-author, .book-category {
                font-size: 1rem;
            }

            .category-tags {
                gap: 10px;
            }

            .category-tag {
                font-size: 0.8rem;
                padding: 4px 10px;
            }

            .features {
                font-size: 0.9rem;
                gap: 15px;
            }

            .features i {
                font-size: 1rem;
            }

            .price {
                font-size: 1.5rem;
            }

            .add-cart-btn {
                font-size: 0.9rem;
                padding: 10px 20px;
            }
        }

        @media (max-width: 480px) {
            .main-content {
                padding: 20px 10px;
            }

            .details-container h2 {
                font-size: 1.75rem;
            }

            .book-author, .book-category {
                font-size: 0.9rem;
            }

            .category-tags {
                gap: 8px;
            }

            .category-tag {
                font-size: 0.7rem;
                padding: 3px 8px;
            }

            .features {
                font-size: 0.8rem;
                gap: 10px;
            }

            .features i {
                font-size: 0.9rem;
            }

            .price {
                font-size: 1.25rem;
            }

            .add-cart-btn {
                font-size: 0.8rem;
                padding: 8px 16px;
            }

            footer {
                padding: 12px 20px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
   <%@include file="../utils/Navbar.jsp" %>
    <div class="main-content">
        <div class="book-details-container">
            <div class="image-container">
                <img alt="Book Cover" src="${pageContext.request.contextPath}/img/palpasa-cafe.jpg">
            </div>
            <div class="details-container">
                <div>
                    <h2>Palpasa Cafe</h2>
                    <p class="book-author">By Narayan Wagle</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Contemporary Fiction</p>
                    <div class="category-tags">
                        <span class="category-tag new">New</span>
<!--                         <span class="category-tag old">Old</span> -->
                    </div>
                    <div class="features">
                        <span><i class="fas fa-undo"></i> Return Available</span>
                        <span><i class="fas fa-truck"></i> Free Shipping</span>
                    </div>
                    <p class="price">Rs. 350</p>
                </div>
                <a href="#" class="add-cart-btn"><i class="fas fa-cart-plus"></i> Add to Cart</a>
            </div>
        </div>
    </div>
    <%@include file="../utils/footer.jsp" %>
</body>
</html>