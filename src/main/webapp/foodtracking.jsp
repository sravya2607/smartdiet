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
    <title>Food Tracking | Nutrition Tracker</title>
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

        /* Main Content Area */
        .main-content {
            margin-left: 270px;
            padding: 2rem;
            max-width: 1000px;
            margin-top: 2rem;
            transition: margin-left 0.3s ease;
        }

        /* Card Styles */
        .card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: slideIn 0.5s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
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

        /* Welcome Section */
        .welcome {
            text-align: center;
            margin-bottom: 2rem;
            padding: 1rem;
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

        /* Form Section */
        .section h2 {
            font-size: 1.8rem;
            color: var(--secondary-color);
            text-align: center;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .section h2 i {
            color: var(--primary-color);
        }

        .meal-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.2rem;
        }

        .meal-form label {
            font-size: 1rem;
            color: var(--dark-gray);
            margin-bottom: 0.5rem;
            display: block;
        }

        .meal-form input,
        .meal-form select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            font-size: 1rem;
            background-color: var(--light-gray);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .meal-form input:focus,
        .meal-form select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
        }

        .meal-form button {
            grid-column: span 2;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            border: none;
        }

        .meal-form .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .meal-form .btn-primary:hover {
            background-color: var(--secondary-color);
        }

        .meal-form .btn-danger {
            background-color: var(--danger-color);
            color: var(--white);
            margin-top: 0.5rem;
        }

        .meal-form .btn-danger:hover {
            background-color: #e04120;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .meal-form {
                grid-template-columns: 1fr;
            }

            .meal-form button {
                grid-column: span 1;
            }
        }

        @media (max-width: 768px) {
            .welcome h1 {
                font-size: 1.8rem;
            }

            .section h2 {
                font-size: 1.5rem;
            }

            .meal-form input,
            .meal-form select {
                font-size: 0.9rem;
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
            <h1>Welcome, <%= u.getName() %>!</h1>
        </div>

        <!-- Food Tracking Form -->
        <div class="card">
            <div class="section">
                <h2><i class="fas fa-utensils"></i> Track Your Meals and Water Intake</h2>
                <form action="addFoodTracking" method="post" class="meal-form" onsubmit="return validateForm()">
                    <div>
                        <label for="date">Date:</label>
                        <input type="date" id="date" name="date" required>
                    </div>
                    <div>
                        <label for="breakfast">Breakfast:</label>
                        <select id="breakfast" name="breakfast" required>
                            <option value="" disabled selected>Select Breakfast</option>
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
                            <option value="" disabled selected>Select Lunch</option>
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
                            <option value="" disabled selected>Select Snacks</option>
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
                            <option value="" disabled selected>Select Dinner</option>
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
                        <input type="number" id="waterIntake" name="waterIntake" placeholder="Enter water intake..." min="0" required>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Add Food Tracking</button>
                        <button type="reset" class="btn btn-danger">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            const date = document.getElementById('date').value;
            const breakfast = document.getElementById('breakfast').value;
            const lunch = document.getElementById('lunch').value;
            const snacks = document.getElementById('snacks').value;
            const dinner = document.getElementById('dinner').value;
            const waterIntake = document.getElementById('waterIntake').value;

            if (!date || !breakfast || !lunch || !snacks || !dinner || !waterIntake) {
                alert('Please fill in all fields.');
                return false;
            }

            if (waterIntake < 0) {
                alert('Water intake cannot be negative.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
