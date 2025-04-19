<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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
            padding: 30px 20px;
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px);
        }

        .profile-container {
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

        .profile-container:hover {
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

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            position: relative;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-right: 20px;
            object-fit: cover;
            border: 2px solid #A3BFFA;
        }

        .profile-name {
            font-size: 24px;
            font-weight: 700;
            color: #374151;
        }

        .edit-btn {
            position: absolute;
            top: 0;
            right: 0;
            padding: 8px 16px;
            background: #6B7280;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .edit-btn:hover {
            background: #7C9BF2;
            box-shadow: 0 6px 12px rgba(163, 191, 250, 0.4), 0 2px 4px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .edit-btn i {
            margin-right: 8px;
        }

        .profile-details {
            margin-bottom: 20px;
        }

        .profile-details div {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .profile-details i {
            color: #A3BFFA;
            margin-right: 10px;
            font-size: 16px;
        }

        .profile-details span.label {
            font-weight: 500;
            color: #374151;
            width: 120px;
        }

        .profile-details span.value {
            color: #6B7280;
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

            .profile-container {
                padding: 20px;
            }

            .profile-image {
                width: 80px;
                height: 80px;
            }

            .profile-name {
                font-size: 20px;
            }

            .edit-btn {
                padding: 10px;
                font-size: 13px;
            }
        }

        @media (max-width: 480px) {
            .main-content {
                padding: 20px 10px;
            }

            .profile-container {
                padding: 15px;
            }

            .profile-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .profile-image {
                margin-bottom: 15px;
                margin-right: 0;
            }

            .profile-name {
                font-size: 18px;
            }

            .profile-details span.label {
                width: 100px;
            }

            .edit-btn {
                font-size: 12px;
                padding: 8px;
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
        <div class="profile-container">
            <div class="profile-header">
                <img src="https://via.placeholder.com/100" alt="Profile Image" class="profile-image">
                <div>
                    <div class="profile-name">Bipul</div>
                </div>
                <button class="edit-btn"><i class="fas fa-edit"></i>Edit Profile</button>
            </div>

            <!-- Profile View -->
            <div class="profile-details">
                <div>
                    <i class="fas fa-user"></i>
                    <span class="label">Full Name:</span>
                    <span class="value">Bipul</span>
                </div>
                <div>
                    <i class="fas fa-phone"></i>
                    <span class="label">Phone Number:</span>
                    <span class="value">9845261354</span>
                </div>
                <div>
                    <i class="fas fa-envelope"></i>
                    <span class="label">Email:</span>
                    <span class="value">bipul@gmail.com</span>
                </div>
                <div>
                    <i class="fas fa-map-marker-alt"></i>
                    <span class="label">Address:</span>
                    <span class="value">Dulari, Morang</span>
                </div>
                <div>
                    <i class="fas fa-info-circle"></i>
                    <span class="label">Bio:</span>
                    <span class="value">Hey there!!</span>
                </div>
            </div>
        </div>
    </div>
<%@include file="../utils/footer.jsp" %>
</body>
</html>