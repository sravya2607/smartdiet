<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log the user out
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .logout-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }
        .logout-container h1 {
            font-size: 24px;
            color: #333;
        }
        .logout-container p {
            font-size: 18px;
            color: #666;
            margin: 20px 0;
        }
        .login-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .login-link:hover {
            background-color: #45A049;
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <h1>Logged Out</h1>
        <p>You have been successfully logged out. Please log in again to access your account.</p>
        <a href="userlogin.jsp" class="login-link">Login Again</a>
    </div>
</body>
</html>
