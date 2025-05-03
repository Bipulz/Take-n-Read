	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="jakarta.servlet.http.HttpSession" %>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Add Book - Take n' Read</title>
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
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            min-height: calc(100vh - 200px);
	        }
	
	        .form-container {
	            background: linear-gradient(135deg, #FFFFFF, #F9FAFB);
	            padding: 25px;
	            border-radius: 16px;
	            box-shadow: 0 12px 28px rgba(55, 65, 81, 0.3), 0 6px 12px rgba(0, 0, 0, 0.2);
	            border: 1px solid #E5E7EB;
	            max-width: 600px;
	            width: 100%;
	            transition: transform 0.3s ease, box-shadow 0.3s ease;
	            animation: slideIn 0.5s ease-out;
	            position: relative;
	        }
	
	        .form-container:hover {
	            transform: translateY(-4px);
	            box-shadow: 0 16px 32px rgba(55, 65, 81, 0.4), 0 8px 16px rgba(0, 0, 0, 0.25);
	        }
	
	        @keyframes slideIn {
	            from {
	                transform: translateY(20px);
	            }
	            to {
	                transform: translateY(0);
	            }
	        }
	
	        .form-container h2 {
	            font-size: 26px;
	            color: #374151;
	            margin-bottom: 20px;
	            text-align: center;
	            font-weight: 700;
	            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
	        }
	
	        .success-message {
	            color: green;
	            font-weight: bold;
	            text-align: center;
	            margin-bottom: 15px;
	            display: flex;
	            align-items: center;
	            justify-content: center;
	        }
	
	        .success-message::before {
	            content: "✓ ";
	        }
	
	        .error-message {
	            color: #F87171;
	            text-align: center;
	            margin-bottom: 15px;
	            font-size: 14px;
	        }
	
	        .divider {
	            height: 4px;
	            background: linear-gradient(to right, #A3BFFA, #FFFFFF);
	            margin-bottom: 20px;
	            border-radius: 2px;
	        }
	
	        .form-group {
	            margin-bottom: 18px;
	            position: relative;
	        }
	
	        .form-group label {
	            font-size: 14px;
	            color: #374151;
	            font-weight: 500;
	            margin-bottom: 8px;
	            display: block;
	            transition: transform 0.2s ease, color 0.2s ease;
	        }
	
	        .form-group label span {
	            color: #F87171;
	        }
	
	        .form-group input:focus + label,
	        .form-group select:focus + label {
	            transform: translateY(-2px);
	            color: #A3BFFA;
	        }
	
	        .form-group input,
	        .form-group select {
	            width: 100%;
	            padding: 10px 10px 10px 40px;
	            border: 1px solid #E5E7EB;
	            border-radius: 8px;
	            font-size: 14px;
	            color: #374151;
	            background: #FFFFFF;
	            transition: border-color 0.3s ease, box-shadow 0.3s ease;
	            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	        }
	
	        .form-group input:focus,
	        .form-group select:focus {
	            outline: none;
	            border-color: #A3BFFA;
	            background: #F9FAFB;
	            box-shadow: 0 0 8px rgba(163, 191, 250, 0.4), 0 2px 4px rgba(0, 0, 0, 0.1);
	        }
	
	        .form-group i {
	            position: absolute;
	            left: 12px;
	            top: 40px;
	            color: #A3BFFA;
	            font-size: 16px;
	            transition: color 0.3s ease, transform 0.3s ease;
	        }
	
	        .form-group input:focus ~ i,
	        .form-group select:focus ~ i {
	            color: #7C9BF2;
	            transform: scale(1.1);
	        }
	
	        .form-group.file-group {
	            position: relative;
	        }
	
	        .form-group.file-group input[type="file"] {
	            display: none;
	        }
	
	        .form-group.file-group .file-label {
	            background: #6B7280;
	            color: #FFFFFF;
	            padding: 6px 12px;
	            border-radius: 8px;
	            font-size: 13px;
	            cursor: pointer;
	            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
	            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	            display: inline-flex;
	            align-items: center;
	            justify-content: center;
	            width: 120px;
	            text-align: center;
	        }
	
	        .form-group.file-group .file-label:hover {
	            background: #A3BFFA;
	            transform: scale(1.05);
	            box-shadow: 0 4px 8px rgba(163, 191, 250, 0.3);
	        }
	
	        .form-group.file-group .file-name {
	            display: none;
	            font-size: 13px;
	            color: #374151;
	            margin-left: 10px;
	            overflow: hidden;
	            text-overflow: ellipsis;
	            white-space: nowrap;
	            max-width: 200px;
	        }
	
	        .form-group.file-group .file-name.visible {
	            display: inline-block;
	        }
	
	        .form-group.price-group input {
	            padding-left: 55px;
	        }
	
	        .form-group.price-group .rs-prefix {
	            position: absolute;
	            left: 12px;
	            top: 40px;
	            color: #A3BFFA;
	            font-size: 16px;
	            font-weight: 500;
	            transition: color 0.3s ease, transform 0.3s ease;
	        }
	
	        .form-group.price-group input:focus ~ .rs-prefix {
	            color: #7C9BF2;
	            transform: scale(1.1);
	        }
	
	        .submit-btn {
	            width: 100%;
	            padding: 12px;
	            background: #6B7280;
	            color: #FFFFFF;
	            border: none;
	            border-radius: 8px;
	            font-size: 14px;
	            font-weight: 500;
	            cursor: pointer;
	            position: relative;
	            overflow: hidden;
	            transition: background 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        }
	
	        .submit-btn:hover {
	            background: #7C9BF2;
	            box-shadow: 0 6px 12px rgba(163, 191, 250, 0.4), 0 2px 4px rgba(0, 0, 0, 0.1);
	            transform: translateY(-2px);
	        }
	
	        .submit-btn::before {
	            content: '';
	            position: absolute;
	            top: 0;
	            left: -100%;
	            width: 100%;
	            height: 100%;
	            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
	            transition: left 0.6s ease;
	        }
	
	        .submit-btn:hover::before {
	            left: 100%;
	        }
	
	        .submit-btn i {
	            margin-right: 8px;
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
	            header {
	                padding: 10px 20px;
	            }
	
	            nav {
	                padding: 8px 20px;
	            }
	
	            .main-content {
	                padding: 25px 15px;
	            }
	
	            .form-container {
	                padding: 20px;
	            }
	
	            .form-container h2 {
	                font-size: 22px;
	            }
	
	            .form-group input,
	            .form-group select {
	                padding: 8px 8px 8px 36px;
	                font-size: 13px;
	            }
	
	            .form-group i,
	            .form-group .rs-prefix {
	                top: 38px;
	                font-size: 14px;
	                left: 10px;
	            }
	
	            .form-group.price-group input {
	                padding-left: 50px;
	            }
	
	            .submit-btn {
	                padding: 10px;
	                font-size: 13px;
	            }
	
	            .form-group.file-group .file-label {
	                padding: 5px 10px;
	                font-size: 12px;
	                width: 110px;
	            }
	
	            .form-group.file-group .file-name {
	                font-size: 12px;
	                max-width: 180px;
	            }
	        }
	
	        @media (max-width: 480px) {
	            .logo {
	                font-size: 22px;
	            }
	
	            .main-content {
	                padding: 20px 10px;
	            }
	
	            .form-container {
	                padding: 15px;
	            }
	
	            .form-container h2 {
	                font-size: 20px;
	                margin-bottom: 15px;
	            }
	
	            .form-group label {
	                font-size: 13px;
	            }
	
	            .form-group input,
	            .form-group select {
	                font-size: 12px;
	                padding: 8px 8px 8px 36px;
	            }
	
	            .form-group i,
	            .form-group .rs-prefix {
	                top: 38px;
	                font-size: 13px;
	                left: 10px;
	            }
	
	            .form-group.price-group input {
	                padding-left: 50px;
	            }
	
	            .submit-btn {
	                font-size: 12px;
	                padding: 8px;
	            }
	
	            .form-group.file-group .file-label {
	                font-size: 11px;
	                padding: 4px 8px;
	                width: 100px;
	            }
	
	            .form-group.file-group .file-name {
	                font-size: 11px;
	                max-width: 160px;
	            }
	
	            footer {
	                padding: 12px 20px;
	                font-size: 12px;
	            }
	        }
	    </style>
	</head>
	<body>
	    <header>
	        <div class="logo">
	            Take n' Read
	        </div>
	    </header>
	
	    <nav>
	        <a href="${pageContext.request.contextPath}/admin/home.jsp"><i class="fas fa-home"></i> Home</a>
	        <a href="${pageContext.request.contextPath}/admin/allBook.jsp"><i class="fas fa-book"></i> View Books</a>
	    </nav>
	
	    <div class="main-content">
	        <div class="form-container">
	            <h2>Add New Book</h2>
	            <div class="divider"></div>
	            <% 
	                String success = request.getParameter("success");
	                String error = request.getParameter("error");
	                if (success != null) {
	            %>
	                <div class="success-message" id="successMessage">Book added successfully</div>
	            <% 
	                } else if (error != null && (error.contains("All required fields must be filled") || error.contains("Photo upload failed"))) {
	            %>
	                <div class="error-message">Please fill all the details</div>
	            <% 
	                } else if (error != null) {
	            %>
	                <div class="error-message"><%= error %></div>
	            <% 
	                }
	            %>
	            <form action="${pageContext.request.contextPath}/AdminAddBookServlet" method="post" enctype="multipart/form-data">
	                <div class="form-group">
	                    <label for="bookName">Book Name<span>*</span></label>
	                    <input type="text" id="bookName" name="bookName" required>
	                    <i class="fas fa-book"></i>
	                </div>
	                <div class="form-group">
	                    <label for="authorName">Author Name<span>*</span></label>
	                    <input type="text" id="authorName" name="authorName" required>
	                    <i class="fas fa-user"></i>
	                </div>
	                <div class="form-group price-group">
	                    <label for="price">Price (NPR)<span>*</span></label>
	                    <input type="number" id="price" name="price" step="0.01" required>
	                    <span class="rs-prefix">NPR</span>
	                </div>
	                <div class="form-group">
	                    <label for="category">Book Category</label>
	                    <select id="category" name="category">
	                        <option value="" disabled selected>--select--</option>
	                        <option value="fiction">Fiction</option>
	                        <option value="non-fiction">Non-Fiction</option>
	                        <option value="science">Science</option>
	                        <option value="history">History</option>
	                        <option value="biography">Biography</option>
	                        <option value="fantasy">Fantasy</option>
	                        <option value="mystery">Mystery</option>
	                        <option value="romance">Romance</option>
	                        <option value="thriller">Thriller</option>
	                        <option value="self-help">Self-Help</option>
	                    </select>
	                    <i class="fas fa-list"></i>
	                </div>
	                <div class="form-group">
	                    <label for="status">Book Status</label>
	                    <select id="status" name="status">
	                        <option value="" disabled selected>--select--</option>
	                        <option value="active">Active</option>
	                        <option value="inactive">Inactive</option>
	                    </select>
	                    <i class="fas fa-toggle-on"></i>
	                </div>
	                <div class="form-group file-group">
	                    <label for="photo">Upload Photo</label>
	                    <input type="file" id="photo" name="photo" accept="image/*">
	                    <label for="photo" class="file-label">Choose File</label>
	                    <span class="file-name"></span>
	                </div>
	                <button type="submit" class="submit-btn"><i class="fas fa-plus"></i>Add Book</button>
	            </form>
	        </div>
	    </div>
	
	    <footer>
	        © 2025 Take n' Read. All rights reserved.
	    </footer>
	
	    <script>
	        const fileInput = document.getElementById('photo');
	        const fileLabel = document.querySelector('.file-label');
	        const fileName = document.querySelector('.file-name');
	
	        fileInput.addEventListener('change', () => {
	            if (fileInput.files.length > 0) {
	                fileLabel.textContent = 'Added';
	                fileName.textContent = fileInput.files[0].name;
	                fileName.classList.add('visible');
	            } else {
	                fileLabel.textContent = 'Choose File';
	                fileName.textContent = '';
	                fileName.classList.remove('visible');
	            }
	        });
	
	        const successMessage = document.getElementById('successMessage');
	        if (successMessage) {
	            setTimeout(() => {
	                successMessage.style.display = 'none';
	            }, 3000);
	        }
	    </script>
	</body>
	</html>