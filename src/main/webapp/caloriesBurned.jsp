<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calories Calculator</title>
    <style>
        /* General styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       body {
    font-family: Arial, sans-serif;
    color: #333;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
    position: relative;
    overflow: hidden;
    background-image: url('https://tse1.mm.bing.net/th?id=OIP.m7WccSx6dPfFHyTBSCvPjQHaE8&pid=Api&P=0&h=180');
    background-size: cover;
    background-position: center;
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
            filter: blur(8px); /* Blur effect */
            z-index: -1; /* Position behind content */
        }

      .container {
   
    background-size: cover; /* Ensures the image covers the container */
    background-position: center; /* Centers the image */
    background-repeat: no-repeat; /* Prevents tiling if image is smaller */
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
    padding: 40px;
    position: relative;
    z-index: 1;
}
      
        

        h1 {
            font-size: 24px;
            color: #58b27d;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            color: #555555;
            margin-bottom: 8px;
        }

        .form-group input,
        .form-group select,
        .form-group button {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group button {
            background-color: #58b27d;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a05a;
        }

        .result-group {
            margin-top: 20px;
        }

        .result-group p {
            font-size: 18px;
            color: #555;
        }

        .result-group .result-item {
            font-size: 16px;
            margin-top: 8px;
        }

        .result-item span {
            font-weight: bold;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container button {
            width: 48%;
            padding: 15px;
            font-size: 16px;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button-container .calculate-btn {
            background-color: #58b27d;
        }

        .button-container .calculate-btn:hover {
            background-color: #45a05a;
        }

        .button-container .back-btn {
            background-color: #58b27d;
        }

        .button-container .back-btn:hover {
            background-color: #45a05a;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Calorie Calculator</h1>
        <form id="calorie-form">
            <div class="form-group">
                <label for="age">Age (in years):</label>
                <input type="number" id="age" required>
            </div>

            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </div>

            <div class="form-group">
                <label for="height">Height (in cm):</label>
                <input type="number" id="height" required>
            </div>

            <div class="form-group">
                <label for="weight">Weight (in kg):</label>
                <input type="number" id="weight" required>
            </div>

            <div class="form-group">
                <label for="activity">Activity Level:</label>
                <select id="activity" required>
                    <option value="inactive">Inactive</option>
                    <option value="somewhat_active">Somewhat Active</option>
                    <option value="active">Active</option>
                    <option value="very_active">Very Active</option>
                </select>
            </div>

            <div class="button-container">
                <button type="submit" class="calculate-btn">Calculate</button>
                <button type="button" class="back-btn" onclick="window.history.back()">Back</button>
            </div>
        </form>

        <div id="result" class="result-group" style="display: none;">
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

    <script>
        document.getElementById('calorie-form').addEventListener('submit', function(event) {
            event.preventDefault();

            const age = parseInt(document.getElementById('age').value);
            const gender = document.getElementById('gender').value;
            const height = parseInt(document.getElementById('height').value);
            const weight = parseInt(document.getElementById('weight').value);
            const activityLevel = document.getElementById('activity').value;

            let bmr;

            if (gender === 'male') {
                bmr = 66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age);
            } else {
                bmr = 655 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
            }

            let activityMultiplier;

            switch (activityLevel) {
                case 'inactive':
                    activityMultiplier = 1.2;
                    break;
                case 'somewhat_active':
                    activityMultiplier = 1.375;
                    break;
                case 'active':
                    activityMultiplier = 1.55;
                    break;
                case 'very_active':
                    activityMultiplier = 1.725;
                    break;
            }

            const calories = Math.round(bmr * activityMultiplier);
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
