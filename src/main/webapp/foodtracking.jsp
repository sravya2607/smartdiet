<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve the user object from the session
    User u = (User) session.getAttribute("user");

    // If the user is null, redirect to the login page
    if (u == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return;
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Tracking</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Body Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #6dd5ed, #2193b0);
            color: #333;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 300px;
            padding: 40px;
            max-width: 1000px;
            margin-top: 40px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
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

        /* Welcome Section */
        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome h1 {
            font-size: 40px;
            margin: 0;
            color: #4caf50;
        }

        /* Form Section */
        .section h2 {
            font-size: 32px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .meal-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .meal-form label {
            font-size: 16px;
            color: #555;
        }

        .meal-form input,
        .meal-form select {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: #f0f8ff;
            font-size: 16px;
            transition: box-shadow 0.3s ease;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .meal-form input:focus,
        .meal-form select:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(33, 147, 176, 0.8);
        }

        .meal-form button {
            grid-column: span 2;
            padding: 15px;
            font-size: 18px;
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .meal-form button:hover {
            background: linear-gradient(to right, #6dd5ed, #2193b0);
            transform: translateY(-3px);
        }

        .meal-form .reset-btn {
            background: #e63946;
            margin-top: 10px;
            border-radius: 12px;
            font-size: 18px;
            transition: background 0.3s ease;
        }

        .meal-form .reset-btn:hover {
            background: #d32f2f;
        }

        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            width: 250px;
            height: 100%;
            background: linear-gradient(to bottom, #2193b0, #6dd5ed);
            padding: 20px;
            color: white;
            box-shadow: 4px 0 16px rgba(0, 0, 0, 0.2);
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 15px;
            border-radius: 8px;
            font-size: 16px;
            margin-bottom: 10px;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .sidebar a:hover {
            background: #43cea2;
            transform: translateX(5px);
        }

        /* Media Query for Mobile Responsiveness */
        @media (max-width: 768px) {
            .meal-form {
                grid-template-columns: 1fr;
            }

            .main-content {
                margin-left: 0;
                margin-top: 20px;
                padding: 20px;
            }

            .sidebar {
                width: 100%;
                height: auto;
                position: static;
                box-shadow: none;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Welcome Section -->
        <div class="welcome">
            <h1>Welcome to Food Tracking</h1>
        </div>

        <!-- Food Tracking Form -->
        <div class="section">
            <h2>Track Your Meals and Water Intake</h2>
            <form action="addFoodTracking" method="post" class="meal-form" onsubmit="return validateForm()">
                <div>
                    <label for="date">Date:</label>
                    <input type="date" id="date" name="date" required>
                </div>
                <div>
                    <label for="breakfast">Breakfast:</label>
                    <select id="breakfast" name="breakfast" required>
                        <option value="Idly">Idly</option>
                        <option value="Dosa">Dosa</option>
                        <option value="Puri">Puri</option>
                        <option value="Poha">Poha</option>
                        <option value="Paratha">Paratha</option>
                        <option value="Oats">Oats</option>
                        <option value="Toast">Toast</option>
                    </select>
                </div>
                <div>
                    <label for="lunch">Lunch:</label>
                    <select id="lunch" name="lunch" required>
                        <option value="Rice">Rice</option>
                        <option value="Chapati">Chapati</option>
                        <option value="Biryani">Biryani</option>
                        <option value="Pulao">Pulao</option>
                        <option value="Dal">Dal</option>
                        <option value="Paneer">Paneer</option>
                        <option value="Fish Curry">Fish Curry</option>
                    </select>
                </div>
                <div>
                    <label for="snacks">Snacks:</label>
                    <select id="snacks" name="snacks" required>
                        <option value="Samosa">Samosa</option>
                        <option value="Spring Roll">Spring Roll</option>
                        <option value="Pakoda">Pakoda</option>
                        <option value="Sandwich">Sandwich</option>
                        <option value="Fruit Salad">Fruit Salad</option>
                        <option value="Chaat">Chaat</option>
                        <option value="Cookies">Cookies</option>
                    </select>
                </div>
                <div>
                    <label for="dinner">Dinner:</label>
                    <select id="dinner" name="dinner" required>
                        <option value="Chapati">Chapati</option>
                        <option value="Rice">Rice</option>
                        <option value="Pizza">Pizza</option>
                        <option value="Pasta">Pasta</option>
                        <option value="Soup">Soup</option>
                        <option value="Burger">Burger</option>
                        <option value="Grilled Chicken">Grilled Chicken</option>
                    </select>
                </div>
                <div>
                    <label for="waterIntake">Water Intake (ml):</label>
                    <input type="number" id="waterIntake" name="waterIntake" placeholder="Enter water intake..." required>
                </div>
                <div>
                    <button type="submit">Add Food Tracking</button>
                    <button type="reset" class="reset-btn">Reset</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
