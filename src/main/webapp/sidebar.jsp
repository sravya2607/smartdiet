<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nutrify Sidebar</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

        /* Sidebar */
        .sidebar {
            width: 270px;
            height: 100vh;
            background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
            color: var(--white);
            position: fixed;
            top: 0;
            left: 0;
            padding: 2rem 1.5rem;
            box-shadow: 4px 0 8px rgba(0, 0, 0, 0.1);
            transition: width 0.3s ease;
        }

        /* Sidebar Heading */
        .sidebar h2 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--white);
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            color: var(--white);
            padding: 0.8rem 1rem;
            margin-bottom: 0.5rem;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 400;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .sidebar a:hover {
            background-color: var(--accent-color);
            transform: translateX(5px);
        }

        /* Food Tracking Section */
        .food-tracking {
            cursor: pointer;
        }

        .sub-nav {
            display: none; /* Initially hidden */
            margin-left: 1.5rem;
            margin-top: 0.5rem;
        }

        .sub-nav a {
            padding: 0.6rem 1rem;
            font-size: 0.9rem;
            color: var(--white);
            border-radius: 8px;
        }

        .sub-nav a:hover {
            background-color: var(--accent-color);
            transform: translateX(5px);
        }

        /* Button Styles */
        .btn {
            display: block;
            padding: 0.8rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            border: none;
            width: 100%;
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: var(--white);
            margin-top: 2rem;
        }

        .btn-danger:hover {
            background-color: #e04120;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: static;
                padding: 1rem;
                box-shadow: none;
            }

            .sidebar h2 {
                font-size: 1.5rem;
            }

            .sidebar a {
                font-size: 0.9rem;
                padding: 0.6rem 1rem;
            }

            .sub-nav {
                margin-left: 1rem;
            }

            .btn-danger {
                margin-top: 1rem;
            }
        }

        @media (max-width: 768px) {
            .sidebar h2 {
                font-size: 1.3rem;
            }

            .sidebar a {
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="userdashboard">
            <h2><i class="fas fa-leaf"></i> Nutrify</h2>
        </a>
		<a href="userdashboard"><i class="fas fa-clipboard-list"></i> Dash Board </a>
        <!-- Navigation Links -->
        <a href="userprofile"><i class="fas fa-user"></i> User Profile</a>
        <a href="userdietplan"><i class="fas fa-clipboard-list"></i> Diet Plans</a>

        <!-- Food Tracking Section -->
        <div class="food-tracking">
            <a href="javascript:void(0);" onclick="toggleSubNav()"><i class="fas fa-utensils"></i> Food Tracking</a>
            <div class="sub-nav" id="subNav">
                <a href="foodtracking"><i class="fas fa-plus"></i> Add Food Tracking</a>
                <a href="viewFoodTracking?id=1"><i class="fas fa-eye"></i> View Food Tracking</a>
            </div>
        </div>

        <a href="thrivetracker.jsp"><i class="fas fa-heartbeat"></i> Thrive Tracker</a>
        <!--<a href="about"><i class="fas fa-info-circle"></i> About</a>-->

        <!-- Logout Button -->
        <form action="logout" method="post">
            <button type="submit" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>

    <script>
        // Function to toggle the sub-navigation visibility
        function toggleSubNav() {
            const subNav = document.getElementById('subNav');
            subNav.style.display = subNav.style.display === 'none' || subNav.style.display === '' ? 'block' : 'none';
        }
    </script>
</body>
</html>
