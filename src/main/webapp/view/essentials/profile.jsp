<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Take n' Read</title>
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
            overflow-x: hidden;
        }

        .main-content {
            padding: 40px 20px;
            max-width: 1600px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px);
        }

        .profile-container {
            background: linear-gradient(135deg, #FFFFFF, #F3F4F6);
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 16px 40px rgba(55, 65, 81, 0.35), 0 8px 16px rgba(0, 0, 0, 0.25);
            border: 1px solid #E5E7EB;
            max-width: 700px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: slideIn 0.5s ease-out;
        }

        .profile-container:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 48px rgba(55, 65, 81, 0.45), 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        @keyframes slideIn {
            from {
                transform: translateY(30px);
            }
            to {
                transform: translateY(0);
            }
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-image {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-right: 25px;
            object-fit: cover;
            border: 3px solid #A3BFFA;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .profile-image:hover {
            transform: scale(1.05);
        }

        .profile-name {
            font-size: 32px;
            font-weight: 700;
            color: #374151;
            background: linear-gradient(90deg, #374151, #A3BFFA);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .profile-details, .edit-form {
            margin-bottom: 30px;
        }

        .profile-details div, .edit-form div {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .profile-details i, .edit-form i {
            color: #A3BFFA;
            margin-right: 15px;
            font-size: 20px;
        }

        .profile-details span.label, .edit-form label {
            font-weight: 500;
            color: #374151;
            width: 150px;
        }

        .profile-details span.value {
            color: #6B7280;
        }

        .edit-form input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            background: #FFFFFF;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .edit-form input[type="text"]:focus {
            border-color: #A3BFFA;
            box-shadow: 0 0 8px rgba(163, 191, 250, 0.5);
            outline: none;
        }

        .edit-form input[type="file"] {
            display: none;
        }

        .edit-form label.file-label {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            background: #6B7280;
            color: #FFFFFF;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .edit-form label.file-label:hover {
            background: #7C9BF2;
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .file-name {
            margin-left: 15px;
            color: #6B7280;
            font-size: 16px;
        }

        .button-container {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .edit-button, .edit-form button {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            background: #6B7280;
            color: #FFFFFF;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .edit-button:hover, .edit-form button:hover {
            background: #7C9BF2;
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .edit-form button {
            background: #A3BFFA;
        }

        .edit-form button:hover {
            background: #7C9BF2;
        }

        .alert {
            padding: 20px;
            margin-bottom: 25px;
            border-radius: 10px;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .alert.error {
            background: #FEE2E2;
            border: 1px solid #F87171;
            color: #B91C1C;
        }

        .alert.success {
            background: #E0F2FE;
            border: 1px solid #A3BFFA;
            color: #1E40AF;
        }

        .alert i {
            font-size: 20px;
        }



        @media (max-width: 768px) {
            .main-content { padding: 30px 15px; }
            .profile-container { padding: 25px; }
            .profile-image { width: 160px; height: 160px; }
            .profile-name { font-size: 28px; }
            .profile-details div, .edit-form div { font-size: 16px; }
        }

        @media (max-width: 480px) {
            .main-content { padding: 20px 10px; }
            .profile-container { padding: 20px; }
            .profile-header { flex-direction: column; align-items: flex-start; }
            .profile-image { width: 140px; height: 140px; margin-bottom: 20px; margin-right: 0; }
            .profile-name { font-size: 24px; }
            .profile-details span.label, .edit-form label { width: 120px; }
            .edit-button, .edit-form button { font-size: 14px; padding: 10px 20px; }
            .alert { font-size: 14px; padding: 15px; }
            footer { padding: 15px 20px; font-size: 14px; }
        }
    </style>
    <script>
        function toggleEditForm() {
            const details = document.querySelector('.profile-details');
            const editForm = document.querySelector('.edit-form');
            const editButton = document.querySelector('.edit-button');
            details.style.display = details.style.display === 'none' ? 'block' : 'none';
            editForm.style.display = editForm.style.display === 'none' ? 'block' : 'none';
            editButton.style.display = details.style.display === 'none' ? 'none' : 'block';
        }

        function displayFileName(input) {
            const fileNameSpan = document.getElementById('file-name');
            fileNameSpan.textContent = input.files.length > 0 ? input.files[0].name : 'No file selected';
        }
    </script>
</head>
<body>
    <%@include file="../utils/Navbar.jsp" %>
    <div class="main-content">
        <div class="profile-container">
            <% 
                User users = (User) request.getAttribute("user");
                String errorMessage = (String) session.getAttribute("errorMessage");
                String successMessage = (String) session.getAttribute("successMessage");
                if (errorMessage != null) {
            %>
                <div class="alert error">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= errorMessage %>
                </div>
            <% 
                    session.removeAttribute("errorMessage");
                } 
                if (successMessage != null) {
            %>
                <div class="alert success">
                    <i class="fas fa-check-circle"></i>
                    <%= successMessage %>
                </div>
            <% 
                    session.removeAttribute("successMessage");
                } 
                if (user != null) {
            %>
                <div class="profile-header">
                    <img src="<%= user.getProfileImage() != null ? request.getContextPath() + "/" + user.getProfileImage() : "https://via.placeholder.com/200" %>?t=<%= System.currentTimeMillis() %>" 
                         alt="Profile Image" class="profile-image">
                    <div>
                        <div class="profile-name"><%= user.getName() %></div>
                    </div>
                </div>
                <div class="profile-details">
                    <div>
                        <i class="fas fa-user"></i>
                        <span class="label">Full Name:</span>
                        <span class="value"><%= user.getName() %></span>
                    </div>
                    <div>
                        <i class="fas fa-phone"></i>
                        <span class="label">Phone Number:</span>
                        <span class="value"><%= user.getPhno() %></span>
                    </div>
                    <div>
                        <i class="fas fa-envelope"></i>
                        <span class="label">Email:</span>
                        <span class="value"><%= user.getEmail() %></span>
                    </div>
                    <div>
                        <i class="fas fa-map-marker-alt"></i>
                        <span class="label">Address:</span>
                        <span class="value"><%= user.getAddress() != null ? user.getAddress() : "Not provided" %></span>
                    </div>
                    <div>
                        <i class="fas fa-landmark"></i>
                        <span class="label">Landmark:</span>
                        <span class="value"><%= user.getLandmark() != null ? user.getLandmark() : "Not provided" %></span>
                    </div>
                    <div>
                        <i class="fas fa-city"></i>
                        <span class="label">City:</span>
                        <span class="value"><%= user.getCity() != null ? user.getCity() : "Not provided" %></span>
                    </div>
                    <div>
                        <i class="fas fa-flag"></i>
                        <span class="label">State:</span>
                        <span class="value"><%= user.getState() != null ? user.getState() : "Not provided" %></span>
                    </div>
                    <div>
                        <i class="fas fa-mail-bulk"></i>
                        <span class="label">Zip Code:</span>
                        <span class="value"><%= user.getZip() != null ? user.getZip() : "Not provided" %></span>
                    </div>
                </div>
                <form class="edit-form" action="${pageContext.request.contextPath}/updateProfileAndImage" method="post" enctype="multipart/form-data" style="display: none;">
                    <div>
                        <i class="fas fa-user"></i>
                        <label>Full Name:</label>
                        <input type="text" name="name" value="<%= user.getName() %>" required>
                    </div>
                    <div>
                        <i class="fas fa-map-marker-alt"></i>
                        <label>Address:</label>
                        <input type="text" name="address" value="<%= user.getAddress() != null ? user.getAddress() : "" %>">
                    </div>
                    <div>
                        <i class="fas fa-landmark"></i>
                        <label>Landmark:</label>
                        <input type="text" name="landmark" value="<%= user.getLandmark() != null ? user.getLandmark() : "" %>">
                    </div>
                    <div>
                        <i class="fas fa-city"></i>
                        <label>City:</label>
                        <input type="text" name="city" value="<%= user.getCity() != null ? user.getCity() : "" %>">
                    </div>
                    <div>
                        <i class="fas fa-flag"></i>
                        <label>State:</label>
                        <input type="text" name="state" value="<%= user.getState() != null ? user.getState() : "" %>">
                    </div>
                    <div>
                        <i class="fas fa-mail-bulk"></i>
                        <label>Zip Code:</label>
                        <input type="text" name="zip" value="<%= user.getZip() != null ? user.getZip() : "" %>">
                    </div>
                    <div>
                        <i class="fas fa-upload"></i>
                        <label class="file-label" for="profileImage">Choose Profile Image</label>
                        <input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="displayFileName(this)">
                        <span id="file-name" class="file-name">No file selected</span>
                    </div>
                    <div class="button-container">
                        <button type="submit"><i class="fas fa-save"></i> Save Changes</button>
                        <button type="button" onclick="toggleEditForm()"><i class="fas fa-times"></i> Cancel</button>
                    </div>
                </form>
                <div class="button-container">
                    <button class="edit-button" onclick="toggleEditForm()"><i class="fas fa-edit"></i> Edit Profile</button>
                </div>
            <% } else { %>
                <div class="alert error">
                    <i class="fas fa-exclamation-circle"></i>
                    Unable to load profile. Please try again.
                </div>
            <% } %>
        </div>
    </div>
    <%@include file="../utils/footer.jsp" %>
</body>
</html>