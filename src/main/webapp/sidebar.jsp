<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nutrify Sidebar</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        /* Reset some defaults */
        body, h1, h2, h3, p {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        /* Sidebar */
        .sidebar {
            width: 300px;
            height: 100vh;
            background-color: #2C3E50;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding: 30px;
            box-shadow: 4px 0 6px rgba(0, 0, 0, 0.1);
        }

        /* Sidebar Heading */
        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 500;
            color: #ECF0F1; /* Lighter text color */
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px;
            margin-bottom: 10px;
            text-decoration: none;
            font-weight: 400;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #16A085;
        }

        /* Logout Button */
        .logout-btn {
            width: 100%;
            padding: 12px;
            background-color: #E74C3C;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            margin-top: 30px;
            transition: background 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #C0392B;
        }

        /* Food Tracking Section */
        .food-tracking {
            margin-left: 20px;
            cursor: pointer;
        }

        .sub-nav {
            display: none; /* Initially hidden */
            margin-left: 20px;
        }

        .sub-nav a {
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            font-weight: 400;
            border-radius: 5px;
            display: block;
        }

        .sub-nav a:hover {
            background-color: #16A085;
        }
    </style>
</head>
<body>
    
    <div class="sidebar">
       
        <a href="userdashboard">
            <h2>Nutrify</h2>
        </a>

        <!-- Navigation Links -->
        <a href="userprofile">User Profile</a>
        <a href="userdietplan">Diet Plans</a>

        <!-- Food Tracking Section -->
        
            <a href="javascript:void(0);" onclick="toggleSubNav()">Food Tracking</a>
            <div class="food-tracking">
            <div class="sub-nav" id="subNav">
                <a href="foodtracking">Add Food Tracking</a>
                <a href="viewFoodTracking?id=1">View Food Tracking</a>
            </div>
        </div>

        <a href="thrive tracker">thrive tracker</a>
        <a href="about">About</a>

        <!-- Logout Button -->
        <form action="logout" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <script>
        // Function to toggle the sub-navigation visibility
        function toggleSubNav() {
            var subNav = document.getElementById("subNav");
            subNav.style.display = (subNav.style.display === "none" || subNav.style.display === "") ? "block" : "none";
        }
    </script>
</body>
</html>
