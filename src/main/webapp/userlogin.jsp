<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <style>
        /* Body and Background */
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.pexels.com/photos/9589644/pexels-photo-9589644.jpeg');
            background-size: cover;
            background-position: center center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }

        /* Container for the form */
        .container {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 40px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        /* Title */
        h3 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        /* Error Message */
        .error-message {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }

        /* Form Fields */
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            text-align: left;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #333;
            font-size: 16px;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="tel"]:focus {
            border-color: #0073e6;
            outline: none;
        }

        /* Button */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #0073e6;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #005bb5;
        }

        /* Link to User Dashboard */
        .dashboard-link {
            margin-top: 15px;
            display: block;
            color: #0073e6;
            font-size: 14px;
            text-decoration: none;
        }

        .dashboard-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>User Login</h3>
        
        <!-- Display error message if any -->
        <div class="error-message">
            <c:out value="${message}"></c:out>
        </div>

        <!-- Login Form -->
        <form method="post" action="checkuserlogin">
            <label for="eemail">Email ID</label>
            <input type="email" id="eemail" name="uemail" required/>
            
            <label for="epwd">Password</label>
            <input type="password" id="epwd" name="upwd" required/>
            
            <!-- Submit Button -->
            <input type="submit" value="Login"/>
        </form>
        
    </div>
</body>
</html>