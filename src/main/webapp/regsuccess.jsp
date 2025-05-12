<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .message {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #4caf50;
            font-weight: bold;
        }
        .login-link {
            display: inline-block;
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .login-link:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            <c:out value="${message}"></c:out>
        </div>
        <a href="userlogin" class="login-link">Login Here</a>
    </div>
</body>
</html>
