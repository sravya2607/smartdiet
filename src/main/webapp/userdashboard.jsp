<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve the user object from the session
    User u = (User) session.getAttribute("user");

    // If the user is null, redirect to the login page
    if (u == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return; // Prevent further execution
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
        }



        /* Main Content */
        .main-content {
            margin-left: 270px;
            padding: 30px;
        }

        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome h1 {
            font-size: 36px;
            margin: 0;
            color: #4CAF50;
        }

        .welcome p {
            font-size: 18px;
            color: #555;
        }

        .section {
            background-color: #ffffff;
            padding: 25px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .section h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .section p {
            font-size: 18px;
            margin-bottom: 15px;
            color: #777;
        }

        button {
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .logout-btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 30px;
            background-color: #FF5733;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
        }
        .logout-btn:hover {
            background-color: #FF2E00;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .side-nav {
                width: 200px;
            }

            .main-content {
                margin-left: 220px;
                padding: 20px;
            }

            .welcome h1 {
                font-size: 28px;
            }

            .section h2 {
                font-size: 22px;
            }

            button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="welcome">
            <h1>Welcome, <span id="user-name"><%= u.getName() %></span>!</h1>
            <p>Track your nutrition and improve your health.</p>
        </div>

        <!-- User Overview Section -->
        <div class="section" id="user-overview">
            <h2>User Overview</h2>
           
            <p>Nutrient Deficits: <span id="deficits">None</span></p>
            <a href="userprofile.jsp">
                <button>View Profile</button>
            </a>
        </div>

        <!-- Diet Plan Section -->
        <div class="section" id="dietplans">
            <h2>Diet Plan</h2>
            <p>Today's Meal Plan: <span id="meal-plan">Grilled Chicken Salad</span></p>
            <button onclick="viewDietPlan()">View/Update Diet Plan</button>
        </div>

        
    </div>

    <script src="scripts.js"></script>
</body>
</html>
