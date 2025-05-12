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
    <title>Diet Plans</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f4f9;
            color: #333;
        }

        /* Main Content */
        .main-content {
            margin-left: 260px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .main-content:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome h1 {
            font-size: 36px;
            color: #2C3E50;
        }

        .welcome p {
            font-size: 18px;
            color: #7F8C8D;
        }

        /* Diet Plan Section */
        .section {
            margin-bottom: 40px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            font-size: 26px;
            color: #16A085;
            margin-bottom: 20px;
            text-align: center;
        }

        .food-item-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-around;
        }

        .food-item {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 250px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            position: relative;
            text-align: center;
        }

        .food-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .food-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }
        

        .food-item img:hover {
            transform: scale(1.1);
        }

        .food-item h3 {
            margin-top: 15px;
            font-size: 22px;
            color: #2C3E50;
        }

        .food-item p {
            color: #7F8C8D;
            font-size: 16px;
        }

        .food-item .nutrition-info {
            background-color: #34495E;
            color: white;
            padding: 10px;
            border-radius: 5px;
            font-size: 12px;
            position: absolute;
            top: 10px;
            right: 10px;
            display: none;
        }

        .food-item:hover .nutrition-info {
            display: block;
        }

        button {
            padding: 12px 20px;
            background-color: #16A085;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1abc9c;
        }

        /* Modal (Popup) Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 10px;
        }

        .modal-header {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .modal-body table {
            width: 100%;
            border-collapse: collapse;
        }

        .modal-body table, .modal-body th, .modal-body td {
            border: 1px solid #ddd;
        }

        .modal-body th, .modal-body td {
            padding: 8px;
            text-align: left;
        }

        .modal-footer {
            text-align: center;
            margin-top: 20px;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 25px;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .food-item-list {
                flex-direction: column;
                align-items: center;
            }

            .food-item {
                width: 80%;
                margin-bottom: 20px;
            }

            .section h2 {
                font-size: 22px;
            }

            .welcome h1 {
                font-size: 28px;
            }
            <!-- Footer Section -->
<footer>
    <div class="footer-content">
        <p>&copy; 2024 Nutrifoods App. All Rights Reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms & Conditions</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </div>
</footer>

<style>
    /* Footer Styling */
    footer {
        background-color: #34495E;
        color: white;
        padding: 20px 0;
        text-align: center;
        font-size: 14px;
        position: relative;
        bottom: 0;
        width: 100%;
    }

    .footer-content {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .footer-content p {
        margin: 10px 0;
    }

    .footer-content ul {
        list-style: none;
        padding: 0;
    }

    .footer-content ul li {
        display: inline;
        margin: 0 15px;
    }

    .footer-content ul li a {
        color: white;
        text-decoration: none;
        font-size: 14px;
    }

    .footer-content ul li a:hover {
        text-decoration: underline;
    }

    /* Responsive Styling for Footer */
    @media (max-width: 768px) {
        .footer-content ul {
            padding: 0;
        }

        .footer-content ul li {
            display: block;
            margin: 10px 0;
        }
    }

    </style>
</head>
<body>

<%@ include file="sidebar.jsp" %>

    <div class="main-content">
        <div class="welcome">
            <h1><span id="user-name"><%=u.getName() %></span>!</h1>
            <p>Find your perfect diet plan based on your preferences.</p>
        </div>

        <!-- Diet Plan Section -->
        <div class="section" id="dietplans">
            <h2>Diet Plan Options</h2>

            <div class="food-item-list">
                <!-- Food Item 1: Non-Veg Diet -->
                <div class="food-item" onclick="selectFood(this, 'Non-Veg Diet', 300, 30, 15, 20, 500, 5)">
                    <img src="https://s23209.pcdn.co/wp-content/uploads/2015/06/Easy-Grilled-Chicken_068-760x1140.jpg" alt="Grilled Chicken">
                    <h3>Non-Veg Diet</h3>
                    <p>Chicken, Fish, Eggs, etc.</p>
                </div>

                <!-- Food Item 2: Veg Diet -->
                <div class="food-item" onclick="selectFood(this, 'Veg Diet', 200, 12, 5, 30, 300, 8)">
                    <img src="https://www.shape.com/thmb/m5rCSe5aPCBwiQdrbRxt0pc4Syw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/vegetarian-recipes-weight-loss_0-8af3c457c2f44cf4b293f4b71c33c5df.jpg" alt="Vegetarian">
                    <h3>Veg Diet</h3>
                    <p>Leafy Greens, Tofu, Grains, etc.</p>
                </div>

                <!-- Food Item 3: Vegan Diet -->
                <div class="food-item" onclick="selectFood(this, 'Vegan Diet', 250, 20, 30, 15, 350, 9)">
                    <img src="https://www.thespruceeats.com/thmb/h3qLzZSITlnTJblh0s7OFmpMHAs=/6720x4480/filters:fill(auto,1)/green-vegetarian-buddha-bowl-salad-with-vegetables-and-quinoa--spinach--avocado--cucumbers--tomatoes--carrots--radishes--chickpeas-with-sesame-seeds-941023792-5acaca533128340037068ad3.jpg" alt="Vegan Diet">
                    <h3>Vegan Diet</h3>
                    <p>Fruits, Veggies, Seeds, etc.</p>
                </div>

                <!-- Food Item 4: Keto Diet -->
                <div class="food-item" onclick="selectFood(this, 'Keto Diet', 500, 45, 10, 40, 700, 4)">
                    <img src="https://images.everydayhealth.com/images/keto-diet-list-of-what-to-eat-and-7-day-sample-menu-alt-1440x810.jpg?sfvrsn=7a9869d4_1" alt="Keto Diet">
                    <h3>Keto Diet</h3>
                    <p>Low Carbs, High Fat</p>
                </div>

                <!-- Food Item 5: High-Protein Diet -->
                <div class="food-item" onclick="selectFood(this, 'High-Protein Diet', 400, 40, 15, 30, 600, 6)">
                    <img src="https://www.womensalphabet.com/wp-content/uploads/2020/04/protein-rich-diet.jpg" alt="High-Protein">
                    <h3>High-Protein Diet</h3>
                    <p>Chicken, Beef, Eggs, etc.</p>
                </div>

                <!-- Food Item 6: Mediterranean Diet -->
                <div class="food-item" onclick="selectFood(this, 'Mediterranean Diet', 350, 25, 20, 25, 550, 7)">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.R4rXVQwp4ctFw7Jav5090wHaHa&pid=Api&P=0&h=180" alt="Mediterranean Diet">
                    <h3>Mediterranean Diet</h3>
                    <p>Olive Oil, Fish, Veggies, etc.</p>
                </div>

                <!-- Food Item 7: Paleo Diet -->
                <div class="food-item" onclick="selectFood(this, 'Paleo Diet', 450, 40, 30, 25, 650, 6)">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.FdWrT0oJi5ntbLOSOfRYewHaDt&pid=Api&P=0&h=180" alt="Paleo Diet">
                    <h3>Paleo Diet</h3>
                    <p>Lean Meats, Nuts, Berries</p>
                </div>

                <!-- Food Item 8: Gluten-Free Diet -->
                <div class="food-item" onclick="selectFood(this, 'Gluten-Free Diet', 300, 10, 50, 15, 400, 5)">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.0USgqaUg9Hw5MhXmecsbrwHaFj&pid=Api&P=0&h=180" alt="Gluten-Free Diet">
                    <h3>Gluten-Free Diet</h3>
                    <p>Gluten-Free Grains, Vegetables, etc.</p>
                </div>

                <!-- Food Item 9: Dairy-Free Diet -->
                <div class="food-item" onclick="selectFood(this, 'Dairy-Free Diet', 250, 20, 35, 10, 400, 4)">
                    <img src="https://tse2.mm.bing.net/th?id=OIP.rwfgX9MqdI-UVwO99qktoAHaFH&pid=Api&P=0&h=180" alt="Dairy-Free Diet">
                    <h3>Dairy-Free Diet</h3>
                    <p>Non-Dairy Milks, Cheese, etc.</p>
                </div>

  

        <!-- Modal (Popup) -->
        <div id="recipeModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <div class="modal-header">
                    <span id="modalTitle"></span>
                </div>
                <div class="modal-body">
                    <table>
                        <tr>
                            <th>Food Item</th>
                            <td id="modalFoodItem">Chicken</td>
                        </tr>
                        <tr>
                            <th>Calories</th>
                            <td id="modalCalories">0</td>
                        </tr>
                        <tr>
                            <th>Proteins (g)</th>
                            <td id="modalProteins">0</td>
                        </tr>
                        <tr>
                            <th>Carbs (g)</th>
                            <td id="modalCarbs">0</td>
                        </tr>
                        <tr>
                            <th>Fats (g)</th>
                            <td id="modalFats">0</td>
                        </tr>
                        <tr>
                            <th>Cost</th>
                            <td id="modalCost">0</td>
                        </tr>
                        <tr>
                            <th>Ratings</th>
                            <td id="modalRatings">0</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button onclick="closeModal()">Close</button>
                </div>
            </div>
        </div>

        <script>
            function selectFood(element, foodItem, calories, proteins, carbs, fats, cost, ratings) {
                // Set modal content based on the food item clicked
                document.getElementById("modalTitle").innerText = foodItem;
                document.getElementById("modalFoodItem").innerText = foodItem;
                document.getElementById("modalCalories").innerText = calories;
                document.getElementById("modalProteins").innerText = proteins;
                document.getElementById("modalCarbs").innerText = carbs;
                document.getElementById("modalFats").innerText = fats;
                document.getElementById("modalCost").innerText = cost;
                document.getElementById("modalRatings").innerText = ratings;

                // Display the modal
                document.getElementById("recipeModal").style.display = "block";
            }

            function closeModal() {
                document.getElementById("recipeModal").style.display = "none";
            }
        </script>
    </div>
</body>
</html>
