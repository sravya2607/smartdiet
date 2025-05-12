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
    <title>User Dashboard | Nutrition Tracker</title>
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

        .main-content {
            margin-left: 270px;
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        /* Welcome Section */
        .welcome {
            text-align: center;
            margin-bottom: 2.5rem;
            padding: 1.5rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .welcome h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .welcome p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        /* Dashboard Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        /* Card Styles */
        .card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .card h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--secondary-color);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card h2 i {
            color: var(--primary-color);
        }

        .card p {
            margin-bottom: 1.2rem;
            color: var(--dark-gray);
        }

        .card .stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }

        .stat-item {
            text-align: center;
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .stat-label {
            font-size: 0.9rem;
            color: var(--dark-gray);
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
        }

        .btn-outline {
            background-color: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline:hover {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: var(--white);
        }

        .btn-danger:hover {
            background-color: #e04120;
        }

        .btn-block {
            display: block;
            width: 100%;
        }

        /* Progress Bar */
        .progress-container {
            margin: 1.5rem 0;
        }

        .progress-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .progress-bar {
            height: 10px;
            background-color: var(--medium-gray);
            border-radius: 5px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background-color: var(--primary-color);
            border-radius: 5px;
            transition: width 0.5s ease;
        }

        /* Recent Activity */
        .activity-list {
            list-style: none;
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 0.8rem 0;
            border-bottom: 1px solid var(--medium-gray);
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--white);
        }

        .activity-content {
            flex: 1;
        }

        .activity-time {
            font-size: 0.8rem;
            color: var(--dark-gray);
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .welcome h1 {
                font-size: 1.8rem;
            }

            .card h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="welcome">
            <h1>Welcome back, <span id="user-name"><%= u.getName() %></span>!</h1>
            <p>Track your nutrition and achieve your health goals</p>
        </div>

        <!-- Dashboard Grid -->
        <div class="dashboard-grid">
            <!-- User Overview Card -->
            <div class="card">
                <h2><i class="fas fa-user"></i> Your Profile</h2>
                <div class="stats">
                    <div class="stat-item">
                        <div class="stat-value" id="bmi-value">24.3</div>
                        <div class="stat-label">BMI</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value" id="weight-value">68</div>
                        <div class="stat-label">kg</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value" id="height-value">172</div>
                        <div class="stat-label">cm</div>
                    </div>
                </div>
                <p>Last updated: <span id="last-updated">Today</span></p>
                <a href="userprofile.jsp" class="btn btn-primary btn-block">View/Edit Profile</a>
            </div>

            <!-- Nutrition Card -->
            <div class="card">
                <h2><i class="fas fa-utensils"></i> Today's Nutrition</h2>
                <div class="progress-container">
                    <div class="progress-label">
                        <span>Calories</span>
                        <span>1200/2000 kcal</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 60%"></div>
                    </div>
                </div>
                <div class="progress-container">
                    <div class="progress-label">
                        <span>Protein</span>
                        <span>45/80g</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 56%"></div>
                    </div>
                </div>
                <div class="progress-container">
                    <div class="progress-label">
                        <span>Carbs</span>
                        <span>120/250g</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 48%"></div>
                    </div>
                </div>
                <a href="foodtracking.jsp" class="btn btn-outline btn-block">Log Your Meals</a>
            </div>

            <!-- Diet Plan Card -->
            <div class="card">
                <h2><i class="fas fa-clipboard-list"></i> Diet Plan</h2>
                <p><strong>Current Plan:</strong> Balanced Weight Maintenance</p>
                <p><strong>Today's Special:</strong> Grilled Salmon with Quinoa</p>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-carrot"></i>
                        </div>
                        <div class="activity-content">
                            <strong>Breakfast</strong>: Greek yogurt with berries
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-drumstick-bite"></i>
                        </div>
                        <div class="activity-content">
                            <strong>Lunch</strong>: Chicken salad wrap
                        </div>
                    </div>
                </div>
                <a href="userdietplan.jsp" class="btn btn-primary btn-block">DitePlans</a>
            </div>

            <!-- Quick Actions Card -->
            <div class="card">
                <h2><i class="fas fa-bolt"></i> Quick Actions</h2>
                <p>Get things done quickly with these shortcuts:</p>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.8rem; margin: 1.2rem 0;">
                    <a href="logmeal.jsp" class="btn btn-outline">
                        <i class="fas fa-plus"></i> Log Meal
                    </a>
                    <a href="watertracker.jsp" class="btn btn-outline">
                        <i class="fas fa-tint"></i> Water Track
                    </a>
                    <a href="exerciselog.jsp" class="btn btn-outline">
                        <i class="fas fa-running"></i> Exercise
                    </a>
                    <a href="progress.jsp" class="btn btn-outline">
                        <i class="fas fa-chart-line"></i> Progress
                    </a>
                </div>
                <a href="logout" class="btn btn-danger btn-block">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="card">
            <h2><i class="fas fa-history"></i> Recent Activity</h2>
            <ul class="activity-list">
                <li class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-utensils"></i>
                    </div>
                    <div class="activity-content">
                        Logged breakfast: Oatmeal with banana (320 kcal)
                    </div>
                    <div class="activity-time">
                        9:30 AM
                    </div>
                </li>
                <li class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-glass-whiskey"></i>
                    </div>
                    <div class="activity-content">
                        Recorded water intake: 500ml
                    </div>
                    <div class="activity-time">
                        11:15 AM
                    </div>
                </li>
                <li class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-weight"></i>
                    </div>
                    <div class="activity-content">
                        Updated weight: 68.2 kg
                    </div>
                    <div class="activity-time">
                        Yesterday
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <script src="scripts.js"></script>
    <script>
        // Sample dynamic data - in a real app, this would come from your backend
        function updateDashboardData() {
            // Update the displayed values (simulating dynamic data)
            document.getElementById('bmi-value').textContent = (Math.random() * 2 + 23).toFixed(1);
            document.getElementById('weight-value').textContent = Math.floor(Math.random() * 3 + 67);
            
            // You would typically fetch this data via AJAX in a real application
            // fetch('/api/user/stats')
            //     .then(response => response.json())
            //     .then(data => {
            //         document.getElementById('bmi-value').textContent = data.bmi;
            //         document.getElementById('weight-value').textContent = data.weight;
            //         // etc...
            //     });
        }

        // Update data every minute (simulation)
        setInterval(updateDashboardData, 60000);

        function viewDietPlan() {
            // In a real app, this would navigate to the diet plan page
            window.location.href = 'dietplan.jsp';
        }
    </script>
</body>
</html>
