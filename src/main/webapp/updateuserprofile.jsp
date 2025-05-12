<%@ page import="com.klef.jfsd.springboot.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Retrieve the user object from the session
    User user = (User) session.getAttribute("user");

    // Redirect to login if session expired
    if (user == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <style>
       /* General Styles */
/* General Styles */
/* General Styles */
body {
    font-family: 'Poppins', Arial, sans-serif;
    background-color: #eaf3fc; /* Light sky blue background */
    margin: 0;
    padding: 0;
    color: #333;
    line-height: 1.6;
}

.container {
    max-width: 900px;
    margin: 50px auto;
    padding: 30px;
    background: #ffffff;
    border-radius: 15px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.5s ease-in-out;
}

h3 {
    text-align: center;
    font-size: 26px;
    color: #1a73e8; /* Medium blue shade */
    margin-bottom: 30px;
    letter-spacing: 1px;
    text-transform: uppercase;
}

label {
    font-weight: 600;
    display: block;
    margin-top: 12px;
    color: #1a3d6f; /* Deep blue shade */
}

input[type="text"], 
input[type="email"], 
input[type="number"], 
input[type="password"], 
input[type="file"], 
input[type="date"], 
select, 
textarea {
    width: 100%;
    padding: 14px;
    margin-top: 8px;
    border: 1px solid #1a73e8; /* Medium blue */
    border-radius: 10px;
    box-sizing: border-box;
    font-size: 16px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input:focus, select:focus, textarea:focus {
    border-color: #4f8ef7; /* Light blue */
    outline: none;
    box-shadow: 0 0 8px rgba(79, 142, 247, 0.5);
}

button {
    background-color: #1a73e8; /* Medium blue */
    color: white;
    padding: 14px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 20px;
    display: block;
    width: 100%;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

button:hover {
    background-color: #4f8ef7; /* Light blue hover effect */
    box-shadow: 0 6px 12px rgba(79, 142, 247, 0.4);
}

.profile-pic {
    display: block;
    margin: 20px auto;
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 4px solid #1a73e8; /* Medium blue */
    object-fit: cover;
    box-shadow: 0 4px 10px rgba(26, 115, 232, 0.2);
    transition: transform 0.3s ease;
}

.profile-pic:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 15px rgba(79, 142, 247, 0.5);
}

.form-row {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.form-row .col {
    flex: 1;
    min-width: 280px;
}

.section-header {
    margin-top: 30px;
    font-size: 20px;
    color: #1a3d6f; /* Deep blue */
    border-bottom: 2px solid #1a73e8; /* Medium blue */
    padding-bottom: 5px;
    margin-bottom: 15px;
    text-transform: uppercase;
}

/* Checkbox styling */
input[type="checkbox"] {
    margin-right: 10px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        padding: 20px;
    }

    h3 {
        font-size: 22px;
    }

    .form-row {
        flex-direction: column;
    }

    .form-row .col {
        min-width: 100%;
    }
}

/* Fade-in animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h3>Update Profile</h3>
        <form action="/updateuserprofile" method="post" enctype="multipart/form-data">
            <!-- User ID (Hidden) -->
            <input type="hidden" name="uid" value="<%= user.getId() %>">

            <!-- Profile Picture -->
            <label for="pic">Profile Picture:</label>
            <% if (user.getProfilePic() != null) { 
                byte[] imgData = user.getProfilePic().getBytes(1, (int) user.getProfilePic().length());
                String base64Image = new String(java.util.Base64.getEncoder().encode(imgData));
            %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Profile Picture" class="profile-pic">
            <% } %>
            <input type="file" name="pic" accept="image/*">

            <div class="form-row">
                <div class="col">
                    <!-- Name -->
                    <label for="uname">Name:</label>
                    <input type="text" name="uname" value="<%= user.getName() %>" required>
                </div>
                <div class="col">
                    <!-- Gender -->
                    <label for="ugender">Gender:</label>
                    <input type="text" name="ugender" value="<%= user.getGender() %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="col">
                    <!-- Date of Birth -->
                    <label for="udob">Date of Birth:</label>
                    <input type="date" name="udob" value="<%= user.getDateofbirth() %>" required>
                </div>
               <!--  <div class="col">
                    Age
                    <label for="uage">Age:</label>
                    <input type="text" name="uage" id="uage" readonly>
                </div>
            </div> -->
                <div class="col">
                    <!-- Email -->
                    <label for="uemail">Email:</label>
                    <input type="email" name="uemail" value="<%= user.getEmail() %>" required>
                </div>
            </div>

            <!-- Contact -->
            <label for="ucontact">Contact:</label>
            <input type="text" name="ucontact" value="<%= user.getContactno() %>" required>

            <!-- Activity Level -->
            <div class="section-header">Activity Level</div>
            <select name="uactivity" required>
                <option value="Sedentary">Sedentary</option>
                <option value="Lightly Active">Lightly Active</option>
                <option value="Moderately Active">Moderately Active</option>
                <option value="Very Active">Very Active</option>
            </select>

            <!-- Medical Conditions -->
            <div class="section-header">Medical Conditions</div>
            <div>
                <input type="checkbox" name="umedicalCondition" value="Diabetes"> Diabetes
                <input type="checkbox" name="umedicalCondition" value="Hypertension"> Hypertension
                <input type="checkbox" name="umedicalCondition" value="Asthma"> Asthma
                <input type="checkbox" name="umedicalCondition" value="PCOS"> PCOS (Polycystic Ovary Syndrome)
                <input type="checkbox" name="umedicalCondition" value="Arthritis"> Arthritis
                <input type="checkbox" name="umedicalCondition" value="Heart Disease"> Heart Disease
                <input type="checkbox" name="umedicalCondition" value="Cholesterol"> High Cholesterol
                <input type="checkbox" name="umedicalCondition" value="Thyroid"> Thyroid Disorder
                <input type="checkbox" name="umedicalCondition" value="Cancer"> Cancer
                <input type="checkbox" name="umedicalCondition" value="Epilepsy"> Epilepsy
                <input type="checkbox" name="umedicalCondition" value="Migraine"> Migraine
            </div>

            <!-- Dietary Preferences -->
            <div class="section-header">Dietary Preferences</div>
            <div>
                <input type="checkbox" name="udietary" value="Vegetarian"> Vegetarian
                <input type="checkbox" name="udietary" value="Vegan"> Vegan
                <input type="checkbox" name="udietary" value="Gluten-Free"> Gluten-Free
                <input type="checkbox" name="udietary" value="Keto"> Keto
                <input type="checkbox" name="udietary" value="Low-Carb"> Low-Carb
                <input type="checkbox" name="udietary" value="Paleo"> Paleo
                <input type="checkbox" name="udietary" value="Halal"> Halal
                <input type="checkbox" name="udietary" value="Kosher"> Kosher
                <input type="checkbox" name="udietary" value="Non-Vegetarian"> Non-Vegetarian
                <input type="checkbox" name="udietary" value="Low-Fat"> Low-Fat
                <input type="checkbox" name="udietary" value="Intermittent-Fasting"> Intermittent Fasting
                <input type="checkbox" name="udietary" value="Diabetic-Friendly"> Diabetic-Friendly
                <input type="checkbox" name="udietary" value="Whole30"> Whole30
                <input type="checkbox" name="udietary" value="Mediterranean"> Mediterranean
            </div>

            <!-- Weight and Height -->
            <div class="form-row">
                <div class="col">
                    <label for="uweight">Weight (kg):</label>
                    <input type="number" step="0.1" name="uweight" id="uweight" oninput="calculateBMI()">
                </div>
                <div class="col">
                    <label for="uheight">Height (m):</label>
                    <input type="number" step="0.01" name="uheight" id="uheight" oninput="calculateBMI()">
                </div>
            </div>

            <!-- BMI -->
            <label for="ubmi">BMI:</label>
            <input type="number" step="0.01" name="ubmi" id="ubmi" readonly>

            <!-- Goal -->
            <label for="goal">Goal:</label>
            <select name="goal" id="goal" onchange="toggleCustomGoal()">
                <option value="Lose Weight">Lose Weight</option>
                <option value="Gain Muscle">Gain Muscle</option>
                <option value="Maintain Weight">Maintain Weight</option>
                <option value="Improve Endurance">Improve Endurance</option>
                <option value="Increase Strength">Increase Strength</option>
                <option value="Improve Flexibility">Improve Flexibility</option>
                <option value="Boost Metabolism">Boost Metabolism</option>
                <option value="Improve Mental Health">Improve Mental Health</option>
                <option value="Other">Other</option>
            </select>

            <!-- Custom Goal Input -->
            <input type="text" name="customGoal" id="customGoal" style="display:none;" placeholder="Enter your custom goal">

            <button type="submit">Update Profile</button>
        </form>
    </div>

    <script src="script.js"></script>
</body>
</html>
