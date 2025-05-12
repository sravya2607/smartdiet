<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.pexels.com/photos/6215483/pexels-photo-6215483.jpeg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }
      .form-container {
    background-color: rgba(255, 255, 255, 0.1); /* Even more transparent */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
    max-width: 500px;
    width: 100%;
}
      

        
        }
        h3 {
            text-align: center;
            color: #000;
        }
        table {
            width: 100%;
            margin-top: 15px;
        }
        td {
            padding: 8px;
            vertical-align: middle;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="tel"], input[type="date"], select {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background-color: rgba(255, 255, 255, 0.9); /* Slight transparency */
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            margin: 0 10px;
        }
        input[type="submit"] {
            background-color: rgba(40, 167, 69, 0.8);
        }
        input[type="reset"] {
            background-color: rgba(220, 53, 69, 0.8);
        }
        input[type="submit"]:hover {
            background-color: rgba(40, 167, 69, 1);
        }
        input[type="reset"]:hover {
            background-color: rgba(220, 53, 69, 1);
        }
        .feedback {
            color: red;
            font-size: 12px;
        }
        .success {
            color: green;
        }
    </style>
    <script>
        // Real-time password validation
        function validatePassword() {
            const password = document.getElementById("password").value;
            const feedback = document.getElementById("passwordFeedback");

            // Validation rules
            const rules = [
                { regex: /.{8,}/, message: "At least 8 characters long." },
                { regex: /[a-z]/, message: "Include at least one lowercase letter." },
                { regex: /[A-Z]/, message: "Include at least one uppercase letter." },
                { regex: /[0-9]/, message: "Include at least one number." },
                { regex: /[@$!%*?&#]/, message: "Include at least one special character." }
            ];

            let messages = rules.filter(rule => !rule.regex.test(password)).map(rule => rule.message);

            if (messages.length > 0) {
                feedback.innerHTML = messages.join("<br>");
                feedback.classList.remove("success");
                feedback.classList.add("feedback");
            } else {
                feedback.innerHTML = "Strong password!";
                feedback.classList.remove("feedback");
                feedback.classList.add("success");
            }
        }

        // On form submission, ensure password meets criteria
        function validateForm(event) {
            const password = document.getElementById("password").value;
            const feedback = document.getElementById("passwordFeedback");

            // Validation rules
            const rules = [
                { regex: /.{8,}/, message: "At least 8 characters long." },
                { regex: /[a-z]/, message: "Include at least one lowercase letter." },
                { regex: /[A-Z]/, message: "Include at least one uppercase letter." },
                { regex: /[0-9]/, message: "Include at least one number." },
                { regex: /[@$!%*?&#]/, message: "Include at least one special character." }
            ];

            let messages = rules.filter(rule => !rule.regex.test(password)).map(rule => rule.message);

            if (messages.length > 0) {
                // Prevent form submission
                event.preventDefault();
                feedback.innerHTML = messages.join("<br>");
                feedback.classList.remove("success");
                feedback.classList.add("feedback");
            }
        }

        // Attach the validation to the form
        window.onload = function () {
            document.querySelector("form").addEventListener("submit", validateForm);
        };
    </script>
</head>
<body>
    <div class="form-container">
        <h3><u>User Registration</u></h3>
        <form method="post" action="insertuser">
            <table>
                <tr>
                    <td><label for="uname">Name</label></td>
                    <td><input type="text" id="uname" name="uname" required/></td>
                </tr>
                <tr>
                    <td><label>Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="ugender" value="Male" required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="ugender" value="Female" required/>
                        <label for="female">Female</label>
                        <input type="radio" id="other" name="ugender" value="Other" required/>
                        <label for="other">Other</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="dob">Date of Birth</label></td>
                    <td><input type="date" id="dob" name="udob" required/></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input type="email" id="email" name="uemail" required/></td>
                </tr>
                <tr>
                    <td><label for="password">Password</label></td>
                    <td>
                        <input type="password" id="password" name="upwd" required oninput="validatePassword()"/>
                        <p id="passwordFeedback" class="feedback"></p>
                    </td>
                </tr>
                <tr>
                    <td><label for="contact">Contact Number</label></td>
                    <td><input type="tel" id="contact" name="ucontact" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
