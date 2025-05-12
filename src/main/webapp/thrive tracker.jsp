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
    <title>Dashboard | Nutrition Tracker</title>
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

        /* Header */
        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 10px;
            padding: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .header input {
            width: 100%;
            max-width: 300px;
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            font-size: 1rem;
            background-color: var(--white);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .header input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
        }

        .welcome {
            font-size: 1.5rem;
            font-weight: 500;
            color: var(--white);
        }

        /* Metrics Section */
        h2 {
            font-size: 1.8rem;
            color: var(--secondary-color);
            text-align: center;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        h2 i {
            color: var(--primary-color);
        }

        .metrics {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .card img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-bottom: 1rem;
            transition: transform 0.3s ease;
        }

        .card img:hover {
            transform: scale(1.1);
        }

        .card h3 {
            font-size: 1.3rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.6rem 1.5rem;
            border-radius: 8px;
            font-size: 0.9rem;
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
            transform: translateY(-2px);
        }

        /* Responsive Styling */
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .header input {
                max-width: 100%;
            }
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 1.5rem;
            }

            .card h3 {
                font-size: 1.2rem;
            }

            .card img {
                width: 60px;
                height: 60px;
            }

            .btn {
                padding: 0.5rem 1rem;
                font-size: 0.85rem;
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
        <h2><i class="fas fa-tachometer-alt"></i> Your Daily Metrics</h2>
        <div class="metrics">
            <!-- Distance Estimator Card -->
            <div class="card">
                <img src="https://tse2.mm.bing.net/th?id=OIP.q1x9w-a9MtPtV3-Uqql-kwHaEK&pid=Api&P=0&h=180" alt="Distance Estimator">
                <h3>Distance Estimator</h3>
                <button class="btn btn-primary" onclick="location.href='distanceEstimator.jsp';"><i class="fas fa-ruler"></i> Check</button>
            </div>
            
            <!-- Calories Burned Card -->
            <div class="card">
                <img src="https://tse4.mm.bing.net/th?id=OIP.7gNEkPr2sYgcpZA0l2TtkwHaE8&pid=Api&P=0&h=180" alt="Calories Burned">
                <h3>Calories Burned</h3>
                <button class="btn btn-primary" onclick="location.href='caloriesBurned.jsp';"><i class="fas fa-fire"></i> Check</button>
            </div>

            <!-- Water Intake Card -->
            <div class="card">
                <img src="https://tse2.mm.bing.net/th?id=OIP.Q-qReRp-4Pww7GL3_RyNcwHaFj&pid=Api&P=0&h=180" alt="Water Intake">
                <h3>Water Intake</h3>
                <button class="btn btn-primary" onclick="location.href='waterIntake.jsp';"><i class="fas fa-tint"></i> Check</button>
            </div>

            <!-- BMI Calculator Card -->
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/3373/3373123.png" alt="BMI Calculator">
                <h3>BMI Calculator</h3>
                <button class="btn btn-primary" onclick="location.href='bmi.jsp';"><i class="fas fa-calculator"></i> Check</button>
            </div>

            <!-- Step Counter Card -->
            <div class="card">
                <img src="https://tse4.mm.bing.net/th?id=OIP.dHfHL9tFvFEivheZpEyE_gHaHa&pid=Api&P=0&h=180" alt="Step Counter">
                <h3>Step Counter</h3>
                <button class="btn btn-primary" onclick="location.href='steps.jsp';"><i class="fas fa-walking"></i> Check</button>
            </div>
        </div>
    </div>
</body>
</html>
