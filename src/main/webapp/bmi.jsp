<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Diet Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            background-image: url('https://images.unsplash.com/photo-1514995669114-6081e934b693?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); /* Add your image URL here */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }

        /* Add a pseudo-element to blur the background */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: inherit;
            background-size: inherit;
            background-position: inherit;
            filter: blur(8px); /* Adjust blur intensity here */
            z-index: -1; /* Place it behind all other content */
        }

        .form-container {
            background: rgba(255, 255, 255, 0.8); /* Make the background slightly transparent */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px 30px;
            width: 450px;
            text-align: center;
            margin-right: 50px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        label {
            font-weight: bold;
            display: block;
            text-align: left;
            margin: 10px 0 5px;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 15px;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 12px;
            text-align: left;
        }

        .bmi-result {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #4CAF50;
            background-color: #e8f5e9;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            color: #2e7d32;
            text-align: center;
        }

        .hidden {
            display: none;
        }

        .radio-group {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 10px;
        }

        .radio-group label {
            font-weight: normal;
            margin-left: 0;
        }
    </style>
    <script>
        function validateField(field, messageId) {
            if (!field.value || field.value <= 0) {
                document.getElementById(messageId).innerText = "Please enter a valid value.";
                return false;
            }
            document.getElementById(messageId).innerText = "";
            return true;
        }

        function calculateBMI() {
            const height = document.getElementById("height");
            const weight = document.getElementById("weight");
            const isHeightValid = validateField(height, "heightError");
            const isWeightValid = validateField(weight, "weightError");

            if (isHeightValid && isWeightValid) {
                const bmi = (weight.value / ((height.value / 100) * (height.value / 100))).toFixed(1);
                document.getElementById("bmiResult").innerText = "Your BMI is: " + bmi;
                document.getElementById("bmiResultContainer").classList.remove("hidden");
                document.getElementById("backButton").classList.remove("hidden");
            }
        }
    </script>
</head>
<body>
    <div class="form-container" id="bmiForm">
        <h2>BMI Calculator</h2>
        <form>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" min="2" max="120" required>
            <p id="ageError" class="error-message"></p>

            <label>Gender:</label>
            <div class="radio-group">
                <label><input type="radio" id="male" name="gender" value="male" required> Male</label>
                <label><input type="radio" id="female" name="gender" value="female" required> Female</label>
                <label><input type="radio" id="other" name="gender" value="other" required> Other</label>
            </div>

            <label for="height">Height (cm):</label>
            <input type="number" id="height" name="height" required>
            <p id="heightError" class="error-message"></p>

            <label for="weight">Weight (kg):</label>
            <input type="number" id="weight" name="weight" required>
            <p id="weightError" class="error-message"></p>

            <button type="button" onclick="calculateBMI()">Calculate BMI</button>

            <div id="bmiResultContainer" class="bmi-result hidden">
                <p id="bmiResult"></p>
            </div>

            <button type="button" id="backButton" class="hidden" onclick="window.location.href='usernavbar.jsp'">Back</button>
        </form>
    </div>
</body>
</html>