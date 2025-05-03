<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectionDAO, model.User, model.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details</title>
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

        .seller-details {
            margin-top: 2rem;
            padding: 1.5rem;
            background: #FFFFFF;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .seller-details h3 {
            font-size: 1.5rem;
            color: #374151;
            margin-bottom: 1rem;
        }

        .seller-details .seller-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .seller-details .seller-info img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #E5E7EB;
        }

        .seller-details p {
            font-size: 1rem;
            color: #6B7280;
            margin: 0.5rem 0;
        }

        .seller-details .contact-icon {
            color: #A3BFFA;
            margin-right: 0.5rem;
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

            .image-container, .details-container {
                width: 100%;
                padding: 2rem;
            }

            .details-container h2 {
                font-size: 2rem;
            }

            .book-author, .book-category {
                font-size: 1rem;
            }

            .price {
                font-size: 1.5rem;
            }

            .seller-details h3 {
                font-size: 1.25rem;
            }

            .seller-details .seller-info img {
                width: 50px;
                height: 50px;
            }
        }
    </style>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>
    <div class="main-content">
        <div class="book-details-container">
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                User seller = null;
                try {
                    conn = connectionDAO.getconn();
                    // Fetch book details
                    String bookSql = "SELECT * FROM book WHERE bookId = ? AND status = 'pending' AND user_email != 'admin@gmail.com'";
                    stmt = conn.prepareStatement(bookSql);
                    stmt.setInt(1, bookId);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        String bookName = rs.getString("bookname");
                        String author = rs.getString("author");
                        String bookCategory = rs.getString("bookCategory") != null ? rs.getString("bookCategory") : "Uncategorized";
                        double price = rs.getDouble("price");
                        String photo = rs.getString("photo");
                        String userEmail = rs.getString("user_email");

                        // Fetch seller details from User table
                        UserDAO userDao = new UserDAO(conn);
                        seller = userDao.getUserByEmail(userEmail);
                        String sellerName = (seller != null && seller.getName() != null) ? seller.getName() : userEmail.split("@")[0];
                        String sellerPhone = (seller != null && seller.getPhno() != null) ? seller.getPhno() : "Not provided";
                        String sellerProfileImage = (seller != null && seller.getProfileImage() != null) 
                            ? request.getContextPath() + "/" + seller.getProfileImage() + "?t=" + System.currentTimeMillis()
                            : "https://via.placeholder.com/60";
            %>
            <div class="image-container">
                <img alt="Book Cover" src="${pageContext.request.contextPath}/img/<%= photo %>">
            </div>
            <div class="details-container">
                <div>
                    <h2><%= bookName %></h2>
                    <p class="book-author">By <%= author %></p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> <%= bookCategory %></p>
                    <div class="category-tags">
                        <span class="category-tag old">Old</span>
                    </div>
                    <div class="features">
                        <span><i class="fas fa-undo"></i> Return Available</span>
                        <span><i class="fas fa-truck"></i> Free Shipping</span>
                    </div>
                    <p class="price">Rs. <%= price %></p>
                </div>
                <div class="seller-details">
                    <h3>Seller Information</h3>
                    <div class="seller-info">
                        <img src="<%= sellerProfileImage %>" alt="Seller Profile" class="seller-profile-img">
                        <div>
                            <p><strong><%= sellerName %></strong></p>
                            <p><i class="fas fa-phone contact-icon"></i> Phone: <%= sellerPhone %></p>
                            <p><i class="fas fa-envelope contact-icon"></i> Email: <%= userEmail %></p>
                        </div>
                    </div>
                    <p><i class="fas fa-info-circle"></i> Contact Instructions: Contact via phone or email to inquire about or purchase the book. Typically responds within 24 hours.</p>
                </div>
            </div>
            <% 
                    } else {
            %>
                <p class="no-books">Book not found or not available.</p>
            <% 
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
            %>
                <p class="no-books">Error loading book details: <%= e.getMessage() %></p>
            <% 
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
    </div>
    <%@include file="../utils/footer.jsp" %>
</body>
</html>