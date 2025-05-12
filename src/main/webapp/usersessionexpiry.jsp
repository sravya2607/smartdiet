<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Expired</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f3f4f6;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        color: #333;
        text-align: center;
    }
    .container {
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
    }
    h1 {
        font-size: 24px;
        color: #e63946;
        margin-bottom: 10px;
    }
    p {
        font-size: 16px;
        margin-bottom: 20px;
    }
    .icon {
        font-size: 50px;
        color: #e63946;
        margin-bottom: 15px;
    }
    .login-link {
        display: inline-block;
        text-decoration: none;
        background: #1d3557;
        color: #fff;
        padding: 10px 20px;
        border-radius: 4px;
        font-size: 16px;
        transition: background 0.3s;
    }
    .login-link:hover {
        background: #457b9d;
    }
</style>
</head>
<body>

<div class="container">
    <div class="icon">⚠️</div>
    <h1>Session Expired</h1>
    <p>Oops! It seems your session has expired due to inactivity.<br> Please log in again to continue.</p>
    <a href="userlogin" class="login-link">Login Here</a>
</div>

</body>
</html>
