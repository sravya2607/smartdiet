<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.klef.jfsd.springboot.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calorie Calculator | Nutrition Tracker</title>
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
            min-height: 100vh;
        }

        .card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
            animation: slideIn 0.5s ease-in-out;
        }

        .card:hover {
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

        .card h1 {
            font-size: 1.8rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .card h1 i {
            color: var(--primary-color);
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        .form-group label {
            font-weight: 500;
            color: var(--dark-gray);
            display: block;
            margin-bottom: 0.5rem;
            font-size: 1rem;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            font-size: 1rem;
            background-color: var(--light-gray);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
        }

        .unit-selector {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .unit-selector label {
            font-weight: 500;
            color: var(--dark-gray);
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .unit-selector input[type="radio"] {
            accent-color: var(--primary-color);
        }

        .height-inputs {
            display: flex;
            gap: 1rem;
        }

        .height-inputs input {
            flex: 1;
        }

        .error-message {
            color: var(--danger-color);
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: none;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn {
            flex: 1;
            padding: 0.8rem;
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
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: var(--dark-gray);
            color: var(--white);
        }

        .btn-secondary:hover {
            background-color: var(--text-color);
            transform: translateY(-2px);
        }

        .result-group {
            margin-top: 1.5rem;
            padding: 1rem;
            background-color: var(--light-gray);
            border-radius: 8px;
            border: 2px solid var(--primary-color);
            display: none;
        }

        .result-group p {
            font-size: 1.1rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .result-item {
            font-size: 1rem;
            color: var(--text-color);
            margin-top: 0.5rem;
        }

        .result-item span {
            font-weight: 500;
            color: var(--secondary-color);
        }

        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
        }

        @media (max-width: 768px) {
            .card h1 {
                font-size: 1.5rem;
            }

            .form-group input,
            .form-group select {
                font-size: 0.9rem;
            }

            .btn {
                padding: 0.6rem;
                font-size: 0.9rem;
            }

            .result-group p {
                font-size: 1rem;
            }

            .result-item {
                font-size: 0.9rem;
            }

            .height-inputs {
                flex-direction: column;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <!-- Main Content -->
    <div class="main-content">
        <div class="card">
            <h1><i class="fas fa-fire"></i> Calorie Calculator</h1>
            <div class="unit-selector">
                <label for="metric"><input type="radio" id="metric" name="unit" checked> Metric</label>
                <label for="imperial"><input type="radio" id="imperial" name="unit"> Imperial</label>
            </div>
            <form id="calorie-form">
                <div class="form-group">
                    <label for="age">Age (in years):</label>
                    <input type="number" id="age" min="1" value="<%= user.getAge() != null ? user.getAge() : '' %>" required>
                    <div class="error-message" id="age-error">Please enter a valid age.</div>
                </div>

                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select id="gender" required>
                        <option value="" disabled <%= user.getGender() == null ? "selected" : "" %>>Select Gender</option>
                        <option value="male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                    </select>
                    <div class="error-message" id="gender-error">Please select a gender.</div>
                </div>

                <div class="form-group">
                    <label for="height">Height:</label>
                    <div class="height-inputs" id="height-inputs">
                        <input type="number" id="height-cm" placeholder="Centimeters" min="1" step="0.1" value="<%= user.getHeight() != null ? user.getHeight() : '' %>" required>
                    </div>
                    <div class="error-message" id="height-error">Please enter a valid height.</div>
                </div>

                <div class="form-group">
                    <label for="weight">Weight:</label>
                    <input type="number" id="weight-kg" placeholder="Kilograms" min="1" step="0.1" value="<%= user.getWeight() != null ? user.getWeight() : '' %>" required>
                    <div class="error-message" id="weight-error">Please enter a valid weight.</div>
                </div>

                <div class="form-group">
                    <label for="activity">Activity Level:</label>
                    <select id="activity" required>
                        <option value="" disabled <%= user.getActivity() == null ? "selected" : "" %>>Select Activity Level</option>
                        <option value="inactive" <%= "Sedentary".equals(user.getActivity()) ? "selected" : "" %>>Inactive (little or no exercise)</option>
                        <option value="somewhat_active" <%= "Lightly Active".equals(user.getActivity()) ? "selected" : "" %>>Somewhat Active (light exercise, 1-3 days/week)</option>
                        <option value="active" <%= "Moderately Active".equals(user.getActivity()) ? "selected" : "" %>>Active (moderate exercise, 3-5 days/week)</option>
                        <option value="very_active" <%= "Very Active".equals(user.getActivity()) ? "selected" : "" %>>Very Active (intense exercise, 6-7 days/week)</option>
                    </select>
                    <div class="error-message" id="activity-error">Please select an activity level.</div>
                </div>

                <div class="button-container">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-calculator"></i> Calculate</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='userdashboard.jsp'">Back to Dashboard</button>
                </div>
            </form>

            <div id="result" class="result-group">
                <p>Your estimated daily calorie needs are:</p>
                <p id="calories-output"></p>
                <div class="result-item">
                    <span>Inactive:</span> <span id="inactive-calories"></span> calories
                </div>
                <div class="result-item">
                    <span>Somewhat Active:</span> <span id="somewhat-active-calories"></span> calories
                </div>
                <div class="result-item">
                    <span>Active:</span> <span id="active-calories"></span> calories
                </div>
                <div class="result-item">
                    <span>Very Active:</span> <span id="very-active-calories"></span> calories
                </div>
            </div>
        </div>
    </div>

    <script>
        const unitSelector = document.querySelectorAll('input[name="unit"]');
        const heightInputs = document.getElementById('height-inputs');
        const weightInput = document.getElementById('weight-kg');

        function updateUnitInputs() {
            const unit = document.querySelector('input[name="unit"]:checked').id;
            if (unit === 'imperial') {
                heightInputs.innerHTML = `
                    <input type="number" id="height-feet" placeholder="Feet" min="0" required>
                    <input type="number" id="height-inches" placeholder="Inches" min="0" step="0.1" required>
                `;
                weightInput.id = 'weight-lb';
                weightInput.placeholder = 'Pounds';
            } else {
                heightInputs.innerHTML = `
                    <input type="number" id="height-cm" placeholder="Centimeters" min="1" step="0.1" value="${document.getElementById('height-cm')?.value || ''}" required>
                `;
                weightInput.id = 'weight-kg';
                weightInput.placeholder = 'Kilograms';
            }
        }

        unitSelector.forEach(radio => {
            radio.addEventListener('change', updateUnitInputs);
        });

        document.getElementById('calorie-form').addEventListener('submit', function(event) {
            event.preventDefault();

            // Reset error messages
            document.querySelectorAll('.error-message').forEach(error => error.style.display = 'none');

            const age = parseInt(document.getElementById('age').value);
            const gender = document.getElementById('gender').value;
            const unit = document.querySelector('input[name="unit"]:checked').id;
            let height, weight;

            if (unit === 'imperial') {
                const feet = parseFloat(document.getElementById('height-feet')?.value) || 0;
                const inches = parseFloat(document.getElementById('height-inches')?.value) || 0;
                height = (feet * 30.48) + (inches * 2.54); // Convert to cm
                weight = parseFloat(document.getElementById('weight-lb')?.value) * 0.453592; // Convert to kg
            } else {
                height = parseFloat(document.getElementById('height-cm')?.value);
                weight = parseFloat(document.getElementById('weight-kg')?.value);
            }
            const activityLevel = document.getElementById('activity').value;

            // Validation
            let isValid = true;
            if (isNaN(age) || age <= 0) {
                document.getElementById('age-error').style.display = 'block';
                isValid = false;
            }
            if (!gender) {
                document.getElementById('gender-error').style.display = 'block';
                isValid = false;
            }
            if (isNaN(height) || height <= 0) {
                document.getElementById('height-error').style.display = 'block';
                isValid = false;
            }
            if (isNaN(weight) || weight <= 0) {
                document.getElementById('weight-error').style.display = 'block';
                isValid = false;
            }
            if (!activityLevel) {
                document.getElementById('activity-error').style.display = 'block';
                isValid = false;
            }

            if (!isValid) return;

            // Mifflin-St Jeor Equation
            let bmr;
            if (gender === 'male') {
                bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
            } else {
                bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
            }

            const activityMultipliers = {
                inactive: 1.2,
                somewhat_active: 1.375,
                active: 1.55,
                very_active: 1.725
            };

            const calories = Math.round(bmr * activityMultipliers[activityLevel]);
            const inactiveCalories = Math.round(bmr * 1.2);
            const somewhatActiveCalories = Math.round(bmr * 1.375);
            const activeCalories = Math.round(bmr * 1.55);
            const veryActiveCalories = Math.round(bmr * 1.725);

            document.getElementById('calories-output').textContent = `${calories} calories`;
            document.getElementById('inactive-calories').textContent = inactiveCalories;
            document.getElementById('somewhat-active-calories').textContent = somewhatActiveCalories;
            document.getElementById('active-calories').textContent = activeCalories;
            document.getElementById('very-active-calories').textContent = veryActiveCalories;

            document.getElementById('result').style.display = 'block';
        });
    </script>
</body>
</html>
