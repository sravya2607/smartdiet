<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steps to Distance | Nutrition Tracker</title>
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
            min-height: 100vh;
        }

        /* Card Container */
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

        .card p {
            font-size: 1rem;
            color: var(--dark-gray);
            margin-bottom: 1.5rem;
        }

        /* Form Styling */
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

        .input-fields {
            margin-bottom: 1.5rem;
        }

        .input-group {
            margin-bottom: 1rem;
            text-align: left;
            max-width: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .input-group label {
            font-weight: 500;
            color: var(--dark-gray);
            display: block;
            margin-bottom: 0.5rem;
        }

        input[type="number"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            font-size: 1rem;
            background-color: var(--light-gray);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
        }

        .height-inputs {
            display: flex;
            gap: 1rem;
        }

        .height-inputs input {
            flex: 1;
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

        .calculate-btn-container {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        /* Message Box */
        .message-box {
            background-color: var(--light-gray);
            padding: 1rem;
            margin-top: 1.5rem;
            border-radius: 8px;
            font-size: 1.1rem;
            color: var(--secondary-color);
            border: 2px solid var(--primary-color);
            display: none;
        }

        /* Responsive Design */
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

            .card p {
                font-size: 0.9rem;
            }

            .input-group input {
                font-size: 0.9rem;
            }

            .btn {
                padding: 0.6rem 1rem;
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
            <h1><i class="fas fa-walking"></i> Steps to Distance</h1>
            <p>Enter your details below to calculate your distance walked.</p>

            <div class="unit-selector">
                <label for="imperial"><input type="radio" id="imperial" name="unit" checked> Imperial</label>
                <label for="metric"><input type="radio" id="metric" name="unit"> Metric</label>
            </div>

            <div class="input-fields">
                <div class="input-group">
                    <label for="steps">Total Steps:</label>
                    <input type="number" id="steps" value="5000" min="0" required>
                </div>

                <div class="input-group">
                    <label for="height-feet">Your Height:</label>
                    <div class="height-inputs" id="height-inputs">
                        <input type="number" id="height-feet" placeholder="Feet" value="5" min="0" required>
                        <input type="number" id="height-inches" placeholder="Inches" value="8" min="0" required>
                    </div>
                </div>
            </div>

            <div class="calculate-btn-container">
                <button id="calculate" class="btn btn-primary"><i class="fas fa-calculator"></i> Calculate</button>
                <button class="btn btn-secondary" onclick="location.href='userdashboard.jsp'">Back to Dashboard</button>
            </div>

            <div class="message-box" id="messageBox">
                Distance: <span id="distance">0</span> <span id="unit-display">km</span>
            </div>
        </div>
    </div>

    <script>
        const unitSelector = document.querySelectorAll('input[name="unit"]');
        const heightInputs = document.getElementById('height-inputs');
        const heightFeet = document.getElementById('height-feet');
        const heightInches = document.getElementById('height-inches');
        const stepsInput = document.getElementById('steps');
        const messageBox = document.getElementById('messageBox');
        const distanceSpan = document.getElementById('distance');
        const unitDisplay = document.getElementById('unit-display');

        function updateHeightInputs() {
            const unit = document.querySelector('input[name="unit"]:checked').id;
            if (unit === 'metric') {
                heightInputs.innerHTML = `
                    <input type="number" id="height-cm" placeholder="Centimeters" value="172" min="0" step="0.1" required>
                `;
            } else {
                heightInputs.innerHTML = `
                    <input type="number" id="height-feet" placeholder="Feet" value="5" min="0" required>
                    <input type="number" id="height-inches" placeholder="Inches" value="8" min="0" required>
                `;
            }
        }

        unitSelector.forEach(radio => {
            radio.addEventListener('change', updateHeightInputs);
        });

        document.getElementById('calculate').addEventListener('click', function () {
            const steps = parseFloat(stepsInput.value);
            const unit = document.querySelector('input[name="unit"]:checked').id;
            let heightInCm;

            if (unit === 'metric') {
                heightInCm = parseFloat(document.getElementById('height-cm')?.value);
            } else {
                const feet = parseFloat(document.getElementById('height-feet')?.value) || 0;
                const inches = parseFloat(document.getElementById('height-inches')?.value) || 0;
                heightInCm = (feet * 30.48) + (inches * 2.54);
            }

            if (isNaN(steps) || steps <= 0 || isNaN(heightInCm) || heightInCm <= 0) {
                alert('Please enter valid positive numbers for steps and height.');
                return;
            }

            // Calculate stride length (0.413 * height in cm)
            const strideLengthCm = heightInCm * 0.413;
            const distanceCm = steps * strideLengthCm;

            let distance, unitText;
            if (unit === 'metric') {
                distance = (distanceCm / 100000).toFixed(2); // Convert cm to km
                unitText = 'km';
            } else {
                distance = (distanceCm / 160934.4).toFixed(2); // Convert cm to miles
                unitText = 'miles';
            }

            distanceSpan.textContent = distance;
            unitDisplay.textContent = unitText;
            messageBox.style.display = 'block';
        });
    </script>
</body>
</html>
