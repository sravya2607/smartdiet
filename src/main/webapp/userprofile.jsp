<%@ page import="com.klef.jfsd.springboot.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | Nutrition Tracker</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #2E7D32;
            --accent-color: #8BC34A;
            --danger-color: #FF5733;
            --warning-color: #FFC107;
            --info-color: #2196F3;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #757575;
            --text-color: #333;
            --white: #ffffff;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--light-gray);
            color: var(--text-color);
            line-height: 1.6;
        }

        /* Main Content */
        .main-content {
            margin-left: 270px;
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        /* Profile Card */
        .profile-card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
            animation: slideIn 0.5s ease-in-out;
        }

        .profile-card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profile-card h3 {
            font-size: 1.8rem;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .profile-card h3 i {
            color: var(--primary-color);
        }

        /* Profile Picture */
        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin: 1rem auto;
            border: 3px solid var(--primary-color);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Profile Info */
        .profile-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.2rem;
            text-align: left;
            margin: 1.5rem 0;
        }

        .profile-info b {
            color: var(--dark-gray);
            font-weight: 500;
            font-size: 1rem;
        }

        .profile-info .info {
            color: var(--text-color);
            font-weight: 400;
            font-size: 0.95rem;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.8rem 2rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
        }

        @media (max-width: 768px) {
            .profile-card h3 {
                font-size: 1.5rem;
            }

            .profile-info {
                grid-template-columns: 1fr;
            }

            .profile-image {
                width: 100px;
                height: 100px;
            }

            .btn-primary {
                padding: 0.6rem 1.5rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <!-- Main Content -->
    <div class="main-content">
        <div class="profile-card">
            <h3><i class="fas fa-user"></i> Your Profile</h3>
            <!-- Profile Picture -->
            <img src="https://via.placeholder.com/120" alt="Profile Picture" class="profile-image">
            <!-- User Info -->
            <div class="profile-info">
                <div><b>Name:</b> <span class="info"><%= user.getName() %></span></div>
                <div><b>Email:</b> <span class="info"><%= user.getEmail() %></span></div>
                <div><b>Contact:</b> <span class="info"><%= user.getContactno() %></span></div>
                <div><b>Gender:</b> <span class="info"><%= user.getGender() %></span></div>
                <div><b>Height:</b> <span class="info"><%= user.getHeight() %> cm</span></div>
                <div><b>Weight:</b> <span class="info"><%= user.getWeight() %> kg</span></div>
                <div><b>BMI:</b> <span class="info"><%= user.getBmi() %></span></div>
                <div><b>Health Goal:</b> <span class="info"><%= user.getGoal() %></span></div>
            </div>
            <!-- Update Profile Button -->
            <button class="btn btn-primary" onclick="window.location.href='updateuserprofile.jsp'">Update Profile</button>
        </div>
    </div>
</body>
</html>
