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
    <title>Diet Plans | Nutrition Tracker</title>
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

        /* Diet Plan Section */
        .section {
            background-color: var(--white);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

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

        .food-item-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .food-item {
            background-color: var(--white);
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .food-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .food-item img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 0.8rem;
            transition: transform 0.3s ease;
        }

        .food-item img:hover {
            transform: scale(1.05);
        }

        .food-item h3 {
            font-size: 1.3rem;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
        }

        .food-item p {
            font-size: 0.9rem;
            color: var(--dark-gray);
        }

        .food-item .nutrition-info {
            background-color: var(--secondary-color);
            color: var(--white);
            padding: 0.5rem;
            border-radius: 5px;
            font-size: 0.8rem;
            position: absolute;
            top: 0.5rem;
            right: 0.5rem;
            display: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .food-item:hover .nutrition-info {
            display: block;
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
            border: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
        }

        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
        }

        .modal-content {
            background-color: var(--white);
            margin: 5% auto;
            padding: 1.5rem;
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            font-size: 1.5rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
            text-align: center;
        }

        .modal-body table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem;
        }

        .modal-body th, .modal-body td {
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            text-align: left;
        }

        .modal-body th {
            background-color: var(--light-gray);
            color: var(--dark-gray);
        }

        .modal-footer {
            text-align: center;
            margin-top: 1.5rem;
        }

        .close {
            color: var(--dark-gray);
            font-size: 1.5rem;
            font-weight: bold;
            position: absolute;
            top: 1rem;
            right: 1.5rem;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .close:hover,
        .close:focus {
            color: var(--text-color);
        }

        /* Responsive Styling */
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .food-item-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .welcome h1 {
                font-size: 1.8rem;
            }

            .section h2 {
                font-size: 1.5rem;
            }

            .food-item h3 {
                font-size: 1.2rem;
            }

            .food-item p {
                font-size: 0.85rem;
            }

            .modal-content {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <div class="main-content">
        <div class="welcome">
            <h1>Welcome, <%= u.getName() %>!</h1>
            <p>Find your perfect diet plan based on your preferences.</p>
        </div>

        <!-- Diet Plan Section -->
        <div class="section">
            <h2><i class="fas fa-clipboard-list"></i> Diet Plan Options</h2>
            <div class="food-item-list">
                <!-- Food Item 1: Non-Veg Diet -->
                <div class="food-item" onclick="selectFood(this, 'Non-Veg Diet', 300, 30, 15, 20, 500, 5)">
                    <img src="https://s23209.pcdn.co/wp-content/uploads/2015/06/Easy-Grilled-Chicken_068-760x1140.jpg" alt="Grilled Chicken">
                    <div class="nutrition-info">300 kcal</div>
                    <h3>Non-Veg Diet</h3>
                    <p>Chicken, Fish, Eggs, etc.</p>
                </div>

                <!-- Food Item 2: Veg Diet -->
                <div class="food-item" onclick="selectFood(this, 'Veg Diet', 200, 12, 5, 30, 300, 8)">
                    <img src="https://www.shape.com/thmb/m5rCSe5aPCBwiQdrbRxt0pc4Syw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/vegetarian-recipes-weight-loss_0-8af3c457c2f44cf4b293f4b71c33c5df.jpg" alt="Vegetarian">
                    <div class="nutrition-info">200 kcal</div>
                    <h3>Veg Diet</h3>
                    <p>Leafy Greens, Tofu, Grains, etc.</p>
                </div>

                <!-- Food Item 3: Vegan Diet -->
                <div class="food-item" onclick="selectFood(this, 'Vegan Diet', 250, 20, 30, 15, 350, 9)">
                    <img src="https://www.thespruceeats.com/thmb/h3qLzZSITlnTJblh0s7OFmpMHAs=/6720x4480/filters:fill(auto,1)/green-vegetarian-buddha-bowl-salad-with-vegetables-and-quinoa--spinach--avocado--cucumbers--tomatoes--carrots--radishes--chickpeas-with-sesame-seeds-941023792-5acaca533128340037068ad3.jpg" alt="Vegan Diet">
                    <div class="nutrition-info">250 kcal</div>
                    <h3>Vegan Diet</h3>
                    <p>Fruits, Veggies, Seeds, etc.</p>
                </div>

                <!-- Food Item 4: Keto Diet -->
                <div class="food-item" onclick="selectFood(this, 'Keto Diet', 500, 45, 10, 40, 700, 4)">
                    <img src="https://images.everydayhealth.com/images/keto-diet-list-of-what-to-eat-and-7-day-sample-menu-alt-1440x810.jpg?sfvrsn=7a9869d4_1" alt="Keto Diet">
                    <div class="nutrition-info">500 kcal</div>
                    <h3>Keto Diet</h3>
                    <p>Low Carbs, High Fat</p>
                </div>

                <!-- Food Item 5: High-Protein Diet -->
                <div class="food-item" onclick="selectFood(this, 'High-Protein Diet', 400, 40, 15, 30, 600, 6)">
                    <img src="https://www.womensalphabet.com/wp-content/uploads/2020/04/protein-rich-diet.jpg" alt="High-Protein">
                    <div class="nutrition-info">400 kcal</div>
                    <h3>High-Protein Diet</h3>
                    <p>Chicken, Beef, Eggs, etc.</p>
                </div>

                <!-- Food Item 6: Mediterranean Diet -->
                <div class="food-item" onclick="selectFood(this, 'Mediterranean Diet', 350, 25, 20, 25, 550, 7)">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.R4rXVQwp4ctFw7Jav5090wHaHa&pid=Api&P=0&h=180" alt="Mediterranean Diet">
                    <div class="nutrition-info">350 kcal</div>
                    <h3>Mediterranean Diet</h3>
                    <p>Olive Oil, Fish, Veggies, etc.</p>
                </div>

                <!-- Food Item 7: Paleo Diet -->
                <div class="food-item" onclick="selectFood(this, 'Paleo Diet', 450, 40, 30, 25, 650, 6)">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.FdWrT0oJi5ntbLOSOfRYewHaDt&pid=Api&P=0&h=180" alt="Paleo Diet">
                    <div class="nutrition-info">450 kcal</div>
                    <h3>Paleo Diet</h3>
                    <p>Lean Meats, Nuts, Berries</p>
                </div>

                <!-- Food Item 8: Gluten-Free Diet -->
                <div class="food-item" onclick="selectFood(this, 'Gluten-Free Diet', 300, 10, 50, 15, 400, 5)">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.0USgqaUg9Hw5MhXmecsbrwHaFj&pid=Api&P=0&h=180" alt="Gluten-Free Diet">
                    <div class="nutrition-info">300 kcal</div>
                    <h3>Gluten-Free Diet</h3>
                    <p>Gluten-Free Grains, Vegetables, etc.</p>
                </div>

                <!-- Food Item 9: Dairy-Free Diet -->
                <div class="food-item" onclick="selectFood(this, 'Dairy-Free Diet', 250, 20, 35, 10, 400, 4)">
                    <img src="https://tse2.mm.bing.net/th?id=OIP.rwfgX9MqdI-UVwO99qktoAHaFH&pid=Api&P=0&h=180" alt="Dairy-Free Diet">
                    <div class="nutrition-info">250 kcal</div>
                    <h3>Dairy-Free Diet</h3>
                    <p>Non-Dairy Milks, Cheese, etc.</p>
                </div>
            </div>
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
                            <th>Diet Plan</th>
                            <td id="modalFoodItem"></td>
                        </tr>
                        <tr>
                            <th>Calories</th>
                            <td id="modalCalories"></td>
                        </tr>
                        <tr>
                            <th>Proteins (g)</th>
                            <td id="modalProteins"></td>
                        </tr>
                        <tr>
                            <th>Carbs (g)</th>
                            <td id="modalCarbs"></td>
                        </tr>
                        <tr>
                            <th>Fats (g)</th>
                            <td id="modalFats"></td>
                        </tr>
                        <tr>
                            <th>Cost</th>
                            <td id="modalCost"></td>
                        </tr>
                        <tr>
                            <th>Ratings</th>
                            <td id="modalRatings"></td>
                        </tr>
                    </table>
                </div>
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

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById("recipeModal");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };
    </script>
</body>
</html>
