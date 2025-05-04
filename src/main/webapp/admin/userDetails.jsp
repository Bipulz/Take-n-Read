<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.UserDAO, model.User, model.connectionDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details - Take n' Read</title>
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
            border-bottom: 1px solid #A3BFFA;
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
            max-width: 1200px;
            margin: 0 auto;
        }

        .main-content h1 {
            font-size: 26px;
            color: #374151;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 700;
        }

        .message {
            text-align: center;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
        }

        .message.success {
            background: #A3BFFA;
            color: #FFFFFF;
        }

        .message.error {
            background: #F87171;
            color: #FFFFFF;
        }

        .table-container {
            background: #FFFFFF;
            border-radius: 16px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
            overflow-x: auto;
            animation: fadeIn 0.5s ease-out;
            border: 1px solid #E5E7EB;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
            color: #374151;
        }

        thead {
            background: linear-gradient(135deg, #6B7280, #4B5563);
            color: #FFFFFF;
        }

        th {
            padding: 12px 18px;
            text-align: center;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 14px;
        }

        th.id, th.name, th.email, th.image {
            text-align: left;
        }

        tbody tr {
            border-bottom: 1px solid #E5E7EB;
            transition: background 0.2s ease;
        }

        tbody tr:nth-child(even) {
            background: #F9FAFB;
        }

        tbody tr:hover {
            background: #E8EDFF;
        }

        td {
            padding: 12px 18px;
            font-size: 16px;
            font-weight: 400;
            text-align: center;
            border-right: 1px solid #E5E7EB;
        }

        td:last-child {
            border-right: none;
        }

        td.id, td.name, td.email, td.image {
            text-align: left;
        }

        td.image {
            width: 100px;
            height: 100px;
            overflow: hidden;
        }

        td.image img {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            object-fit: cover;
            display: block;
        }

        .no-users {
            display: none;
            text-align: center;
            color: #6B7280;
            font-size: 16px;
            font-weight: 500;
            padding: 25px;
        }

        .no-users.show {
            display: table-row;
        }

        .action-btn {
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .action-btn.delete {
            background: #F87171;
            color: #FFFFFF;
        }

        .action-btn.delete:hover {
            background: #DC2626;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .action-btn.disabled {
            background: #D1D5DB;
            color: #6B7280;
            cursor: not-allowed;
            box-shadow: none;
        }

        .action-btn.disabled:hover {
            background: #D1D5DB;
            transform: none;
            box-shadow: none;
        }

        .action-btn i {
            font-size: 14px;
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

            .main-content h1 {
                font-size: 22px;
            }

            .table-container {
                margin: 0 10px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px 14px;
            }

            td.image, td.image img {
                width: 80px;
                height: 80px;
            }

            .action-btn {
                padding: 8px 14px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 22px;
            }

            .main-content h1 {
                font-size: 20px;
                margin-bottom: 15px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 8px 12px;
            }

            td.image, td.image img {
                width: 60px;
                height: 60px;
            }

            .action-btn {
                padding: 6px 12px;
                font-size: 12px;
            }

            .action-btn i {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fa-solid fa-book-open-reader"></i>
            Take n' Read
        </div>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/admin/home.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="${pageContext.request.contextPath}/admin/addbook.jsp"><i class="fas fa-plus"></i> Add Book</a>
    </nav>

    <div class="main-content">
        <h1>User Details</h1>
        <% 
            String successMessage = request.getParameter("success");
            String errorMessage = request.getParameter("error");
            if (successMessage != null) {
        %>
            <div class="message success">
                <%= successMessage %>
            </div>
        <% 
            } else if (errorMessage != null) {
        %>
            <div class="message error">
                <%= errorMessage %>
            </div>
        <% 
            }
        %>
        <div class="table-container">
            <table id="userTable">
                <thead>
                    <tr>
                        <th class="id" style="width: 8%;">ID</th>
                        <th class="image" style="width: 10%;">Image</th>
                        <th class="name" style="width: 18%;">Name</th>
                        <th class="email" style="width: 18%;">Email</th>
                        <th style="width: 12%;">Phone</th>
                        <th style="width: 18%;">Address</th>
                        <th style="width: 12%;">Landmark</th>
                        <th style="width: 12%;">City</th>
                        <th style="width: 12%;">State</th>
                        <th style="width: 12%;">Zip</th>
                        <th style="width: 10%;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        UserDAO dao = new UserDAO(connectionDAO.getconn());
                        List<User> users = dao.getAllUsers();
                        if (users != null && !users.isEmpty()) {
                            for (User user : users) {
                                String imagePath = user.getProfileImage() != null ? user.getProfileImage() : "images/default-user.png";
                                boolean isAdmin = "admin@gmail.com".equals(user.getEmail());
                    %>
                    <tr>
                        <td class="id"><%= user.getId() %></td>
                        <td class="image"><img src="${pageContext.request.contextPath}/<%= imagePath %>" alt="<%= user.getName() %>'s image" onerror="this.src='${pageContext.request.contextPath}/images/default-user.png'; this.alt='Default User Image';"></td>
                        <td class="name"><%= user.getName() %></td>
                        <td class="email"><%= user.getEmail() %></td>
                        <td><%= user.getPhno() %></td>
                        <td><%= user.getAddress() != null ? user.getAddress() : "Not provided" %></td>
                        <td><%= user.getLandmark() != null ? user.getLandmark() : "Not provided" %></td>
                        <td><%= user.getCity() != null ? user.getCity() : "Not provided" %></td>
                        <td><%= user.getState() != null ? user.getState() : "Not provided" %></td>
                        <td><%= user.getZip() != null ? user.getZip() : "Not provided" %></td>
                        <td class="action">
                            <% if (isAdmin) { %>
                                <button class="action-btn disabled" disabled><i class="fas fa-trash"></i> Delete</button>
                            <% } else { %>
                                <a href="${pageContext.request.contextPath}/DeleteUserServlet?userId=<%= user.getId() %>" onclick="return confirm('Are you sure you want to delete this user?');">
                                    <button class="action-btn delete"><i class="fas fa-trash"></i> Delete</button>
                                </a>
                            <% } %>
                        </td>
                    </tr>
                    <% 
                            }
                        } else {
                    %>
                    <tr class="no-users show">
                        <td colspan="11">No Users Found</td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        © 2025 Take n' Read. All rights reserved.
    </footer>
</body>
</html>