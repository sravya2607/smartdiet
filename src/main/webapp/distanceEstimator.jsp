<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steps to Distance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f8fa;
            margin: 0;
            padding: 0;
            position: relative;
            overflow: hidden;
            height: 100vh;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://www.themorningwalkeffect.com/wp-content/uploads/2017/04/Morning-Walk-Couple.jpg');
            background-size: cover;
            background-position: center;
            z-index: -1;
        }

        .form-container {
            background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%, rgba(255, 255, 255, 0.8) 50%, rgba(255, 255, 255, 0.6) 100%);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            z-index: 1;
            height: 100%;
            width: 100%;
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #888;
            margin-bottom: 30px;
        }

        .unit-selector, .pace-options {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .unit-selector label, .input-group label {
            font-weight: 600;
            color: #333;
        }

        .input-fields {
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        input[type="number"] {
            width: 100px;
            padding: 8px;
            margin-top: 8px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .pace-button {
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f5f6f7;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .pace-button:hover {
            background-color: #ddd;
        }

        .pace-button.active {
            background-color: #ff5a5f;
            color: #fff;
            border-color: #ff5a5f;
        }

        .calculate-btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .calculate-btn, .back-btn {
            background-color: #ff5a5f;
            color: #fff;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-right: 10px;
        }

        .calculate-btn:hover, .back-btn:hover {
            background-color: #ff474b;
        }

        .message-box {
            background-color: #f5f6f7;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            display: none;
            font-size: 18px;
            font-weight: bold;
            color: #333;
            border: 2px solid #ff5a5f;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Steps to Distance</h1>
        <p>Enter your details below to calculate your distance walked.</p>
        
        <div class="unit-selector">
            <label for="imperial">Imperial</label>
            <input type="radio" id="imperial" name="unit" checked>
            <label for="metric">Metric</label>
            <input type="radio" id="metric" name="unit">
        </div>
        
        <div class="input-fields">
            <div class="input-group">
                <label for="steps">Total Steps:</label>
                <input type="number" id="steps" value="5000">
            </div>

            <div class="input-group">
                <label for="height-feet">Your Height:</label>
                <input type="number" id="height-feet" placeholder="Feet" value="5" min="0">
                <input type="number" id="height-inches" placeholder="Inches" value="8" min="0">
            </div>
        </div>

        <div class="calculate-btn-container">
            <button id="calculate" class="calculate-btn">Calculate</button>
        </div>

        <div class="message-box" id="messageBox">
            Distance: <span id="distance">0</span> km
        </div>
    </div>

    <script>
        document.getElementById('calculate').addEventListener('click', function () {
            const steps = parseFloat(document.getElementById('steps').value);
            const heightFeet = parseFloat(document.getElementById('height-feet').value);
            const heightInches = parseFloat(document.getElementById('height-inches').value);

            if (isNaN(steps) || isNaN(heightFeet) || isNaN(heightInches)) {
                alert('Please fill in all fields correctly.');
                return;
            }

            const totalHeightInInches = (heightFeet * 12) + heightInches;
            const strideLength = totalHeightInInches * 0.413; // Average stride length in inches
            const distanceInInches = steps * strideLength;
            const distanceInMiles = distanceInInches / 63360; // Inches to miles
            const distanceInKm = (distanceInMiles * 1.60934).toFixed(2); // Miles to km

            document.getElementById('distance').textContent = distanceInKm;
            document.getElementById('messageBox').style.display = 'block';
        });
    </script>
</body>
</html>
