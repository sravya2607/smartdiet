<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - nutrify</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Color Palette */
        :root {
            --mix-blue: #5D8CA3;
            --sea-blue: #2E8B8B;
            --light-blue: #ADD8E6;
            --dark-blue: #003366;
        }

        /* Global Styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-blue);
            color: var(--dark-blue);
        }

        /* Main Content Container */
        .main-content {
            margin-left: 270px;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 20px;
            background-color: var(--sea-blue);
            color: white;
            border-radius: 8px;
        }

        .header input {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .welcome {
            font-size: 24px;
            font-weight: bold;
            color: white;
        }

        /* Daily Metrics Section */
        h2 {
            font-size: 28px;
            color: var(--sea-blue);
            margin-bottom: 30px;
            text-align: center;
        }

        .metrics {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .card img {
            max-width: 100px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .card img:hover {
            transform: scale(1.1);
        }

        .card h3 {
            font-size: 22px;
            margin: 10px 0;
            color: var(--dark-blue);
        }

        .card button {
            padding: 12px 20px;
            background-color: var(--mix-blue);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .card button:hover {
            background-color: var(--dark-blue);
        }

        /* Responsive Styling for smaller screens */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .header input {
                width: 100%;
            }

            .metrics {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <input type="text" placeholder="Search anything...">
            <div class="welcome">Welcome, <%= u.getName() %>!</div>
        </div>

        <!-- Daily Metrics Section -->
        <h2>Your Daily Metrics</h2>
        <div class="metrics">
            <!-- Distance Estimator Card -->
            <div class="card">
                <img src="https://tse2.mm.bing.net/th?id=OIP.q1x9w-a9MtPtV3-Uqql-kwHaEK&pid=Api&P=0&h=180" alt="Distance Estimator">
                <h3>Distance Estimator</h3>
                <button onclick="location.href='distanceEstimator.jsp';">Check</button>
            </div>
            
            <!-- Calories Burned Card -->
            <div class="card">
                <img src="https://tse4.mm.bing.net/th?id=OIP.7gNEkPr2sYgcpZA0l2TtkwHaE8&pid=Api&P=0&h=180" alt="Calories Burned">
                <h3>Calories Burned</h3>
                <button onclick="location.href='caloriesBurned.jsp';">Check</button>
            </div>

            <!-- Water Intake Card -->
            <div class="card">
                <img src="https://tse2.mm.bing.net/th?id=OIP.Q-qReRp-4Pww7GL3_RyNcwHaFj&pid=Api&P=0&h=180" alt="Water Intake">
                <h3>Water Intake</h3>
                <button onclick="location.href='waterIntake.jsp';">Check</button>
            </div>

            <!-- BMI Calculator Card -->
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/3373/3373123.png" alt="BMI Calculator">
                <h3>BMI Calculator</h3>
                <button onclick="location.href='bmi.jsp';">Check</button>
            </div>

            <!-- Step Counter Card -->
            <div class="card">
                <img src="https://tse4.mm.bing.net/th?id=OIP.dHfHL9tFvFEivheZpEyE_gHaHa&pid=Api&P=0&h=180" alt="Step Counter">
                <h3>Step Counter</h3>
                <button onclick="location.href='steps.jsp';">Check</button>
            </div>
        </div>
    </div>
</body>
</html>
