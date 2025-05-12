<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Diet Plan Confirmation</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 20px;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
        header h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .diet-plan-details {
            margin-top: 20px;
        }
        .diet-plan-details p {
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>Diet Plan Saved Successfully!</h1>
    </header>

    <!-- Diet Plan Details -->
    <div class="diet-plan-details">
        <p><strong>Goal:</strong> ${dietPlan.goal}</p>
        <p><strong>Duration (days):</strong> ${dietPlan.duration}</p>
        <p><strong>Calories per day:</strong> ${dietPlan.calories}</p>
        <p><strong>Diet Type:</strong> ${dietPlan.dietType}</p>
    </div>
</div>
</body>
</html>
