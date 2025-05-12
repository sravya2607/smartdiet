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
    <title>User Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* General Reset */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #1e90ff, #87cefa);
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: linear-gradient(135deg, #34495e, #2c3e50);
            color: #ecf0f1;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            padding: 20px 15px;
            position: fixed;
            height: 100%;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 700;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #ecf0f1;
            font-size: 18px;
            display: block;
            padding: 10px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar ul li a:hover {
            background: rgba(236, 240, 241, 0.2);
            color: #1e90ff;
        }

        /* Main Content */
        .main-content {
            margin-left: 300px;
            padding: 40px;
            flex: 1;
        }

        .profile-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-width: 900px;
            margin: 0 auto;
            padding: 40px;
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        .profile-card h3 {
            font-size: 28px;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }

        /* Profile Picture Styling */
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 20px auto;
            border: 5px solid;
            border-image: linear-gradient(135deg, #1e90ff, #00c6ff) 1;
            box-shadow: 0 5px 15px rgba(30, 144, 255, 0.5);
        }

        .profile-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            text-align: left;
            margin-top: 20px;
        }

        .profile-info b {
            color: #555;
            font-weight: 500;
        }

        .profile-info .info {
            color: #777;
            font-weight: 400;
        }

        .profile-btn {
            background: linear-gradient(135deg, #1e90ff, #87cefa);
            color: #fff;
            font-size: 18px;
            border: none;
            padding: 14px 40px;
            border-radius: 50px;
            cursor: pointer;
            margin-top: 30px;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .profile-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(30, 144, 255, 0.4);
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .profile-info {
                grid-template-columns: 1fr;
            }

            .sidebar {
                width: 100px;
                padding: 10px;
            }

            .sidebar ul li a {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>User Dashboard</h2>
        <ul>
            <li><a href="userdashboard.jsp">Dashboard</a></li>
            <li><a href="userprofile.jsp">Profile</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="profile-card">
            <h3>Your Profile</h3>

         
            <!-- User Info -->
            <div class="profile-info">
                <b>Name:</b> <span class="info"><%= user.getName() %></span>
                <b>Email:</b> <span class="info"><%= user.getEmail() %></span>
                <b>Contact:</b> <span class="info"><%= user.getContactno() %></span>
                <b>Gender:</b> <span class="info"><%= user.getGender() %></span>
                <b>Height:</b> <span class="info"><%= user.getHeight() %></span>
                <b>Weight:</b> <span class="info"><%= user.getWeight() %></span>
                <b>BMI:</b> <span class="info"><%= user.getBmi() %></span>
                <b>Health Goal:</b> <span class="info"><%= user.getGoal() %></span>
            </div>

            <!-- Update Profile Button -->
            <button class="profile-btn" onclick="window.location.href='updateuserprofile.jsp'">Update Profile</button>
        </div>
    </div>
</body>
</html>
