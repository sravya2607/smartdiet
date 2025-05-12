<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Water Intake Calculator</title>
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
    background-image: url('https://images.pexels.com/photos/4853108/pexels-photo-4853108.jpeg?auto=compress&cs=tinysrgb&w=600'); /* New background image */
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
            filter: blur(8px); /* Adjust blur intensity here */
            z-index: -1; /* Place it behind all other content */
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
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

        .back-button {
            background-color: #58b27d;
            color: white;
            margin-top: 10px;
            text-align: center;
            display: block;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
        }

        .back-button:hover {
            background-color: #45a05a;
        }

        .result-container {
            margin-top: 30px;
            padding: 10px;
            background-color: #e8f5e9;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #2e7d32;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Daily Water Intake Calculator</h1>
        <form method="post">
            <div class="form-group">
                <label for="weight">Body Weight (kg):</label>
                <input type="number" id="weight" name="weight" required>
            </div>
            <div class="form-group">
                <label for="activity">Activity Level:</label>
                <select id="activity" name="activity" required>
                    <option value="Sedentary">Sedentary</option>
                    <option value="Moderate">Moderate</option>
                    <option value="Active">Active</option>
                </select>
            </div>
            <div class="form-group">
                <label for="climate">Climate:</label>
                <select id="climate" name="climate" required>
                    <option value="Tropical">Tropical</option>
                    <option value="Dry">Dry</option>
                    <option value="Temperate">Temperate</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Calculate</button>
                <a href="usernavbar.jsp" class="back-button">Back</a>
            </div>
        </form>

        <%
            String weightStr = request.getParameter("weight");
            String activity = request.getParameter("activity");
            String climate = request.getParameter("climate");

            if (weightStr != null && activity != null && climate != null) {
                double weight = Double.parseDouble(weightStr);
                double baseWater = weight * 0.033;

                if (activity.equals("Moderate")) baseWater += 0.5;
                if (activity.equals("Active")) baseWater += 1.0;
                if (climate.equals("Tropical")) baseWater += 0.7;
                if (climate.equals("Dry")) baseWater += 0.5;

                int glasses = (int) Math.ceil(baseWater * 4);
                int ounces = (int) (baseWater * 33.8);
        %>
                <div class="result-container">
                    <p>You need to drink <%= glasses %> glasses of water daily.</p>
                    <p>Equivalent: <%= String.format("%.1f", baseWater) %> liters (<%= ounces %> ounces).</p>
                </div>
        <% } %>
    </div>
</body>
</html>