<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steps to Miles Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a1a;
            color: white;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #2c2c2c;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            color: #00aaff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #333;
            color: white;
        }

        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #00aaff;
        }

        .form-group button {
            width: 100%;
            padding: 15px;
            background-color: #00aaff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0088cc;
        }

        .result {
            margin-top: 20px;
            padding: 10px;
            background-color: #333;
            border-radius: 5px;
        }

        .result h3 {
            text-align: center;
            color: #ffbb33;
        }

        .result p {
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Steps to Miles Calculator</h1>

    <div class="form-group">
        <label for="gender">Biological Sex:</label>
        <select id="gender">
            <option value="female">Female</option>
            <option value="male">Male</option>
        </select>
    </div>

    <div class="form-group">
        <label for="feet">Height:</label>
        <input type="number" id="feet" placeholder="Feet">
        <input type="number" id="inches" placeholder="Inches">
    </div>

    <div class="form-group">
        <label for="pace">Pace of Walk/Run:</label>
        <select id="pace">
            <option value="average">Average Walk (3mph)</option>
            <option value="brisk">Brisk Walk (4mph)</option>
            <option value="run">Run (6mph)</option>
        </select>
    </div>

    <div class="form-group">
        <button onclick="calculateDistance()">Calculate</button>
    </div>

    <div class="result" id="result" style="display: none;">
        <h3>Results</h3>
        <p id="miles"></p>
    </div>
</div>

<script>
    function calculateDistance() {
        // Get input values
        const gender = document.getElementById("gender").value;
        const feet = parseInt(document.getElementById("feet").value);
        const inches = parseInt(document.getElementById("inches").value);
        const pace = document.getElementById("pace").value;

        // Convert height to centimeters
        const heightCm = ((feet * 12 + inches) * 2.54);

        // Calculate stride length based on gender
        let strideLength;
        if (gender === "male") {
            strideLength = heightCm * 0.415;
        } else {
            strideLength = heightCm * 0.413;
        }

        // Calculate steps (assumed 1000 steps for simplicity)
        const steps = 1000;
        const distance = strideLength * steps;

        // Convert distance to miles
        const miles = (distance / 100000);

        // Display the result
        document.getElementById("miles").textContent = `Distance for 1000 steps: ${miles.toFixed(4)} miles.`;
        document.getElementById("result").style.display = "block";
    }
</script>

</body>
</html>
