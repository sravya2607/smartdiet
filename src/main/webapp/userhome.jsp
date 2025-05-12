<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutrifoods - Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fdfdfd;
            color: #333;
            line-height: 1.6;
        }
        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 0;
            width: 100%;
            padding: 20px 40px;
            z-index: 10;
            background: transparent; /* No background color */
        }
        .header .logo {
            display: flex;
            align-items: center;
        }
        .header img {
            width: 60px;
            margin-right: 15px;
        }
        .header h1 {
            font-size: 28px;
            color: #fff; /* Text is visible over the image */
        }
        .header .nav-links a {
            color: white; /* White text */
            font-size: 1.1em;
            margin-left: 25px;
            text-decoration: none;
            padding: 8px 15px;
            transition: all 0.3s ease;
        }
        .header .nav-links a:hover {
            text-decoration: underline;
        }
        /* Banner Section */
        .banner {
            position: relative;
            width: 100%;
            height: 100vh; /* Full viewport height */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            transition: background-image 1s ease-in-out;
        }
        .banner-slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(0, 0, 0, 0.4); /* Semi-transparent overlay for readability */
            color: white;
            text-align: center;
            padding: 0 20px;
        }
        .banner-slide h2 {
            font-size: 3.5em;
            color: #ff9900;
            margin-bottom: 15px;
        }
        .banner-slide p {
            font-size: 1.5em;
            color: #fff;
        }
        /* Section Styles */
        .section {
            padding: 70px 40px;
            text-align: center;
            background-color: #f9f9f9;
        }
        .section:nth-child(even) {
            background-color: #fff;
        }
        .section h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }
        .section p {
            font-size: 1.2em;
            color: #666;
            max-width: 800px;
            margin: 0 auto 30px;
        }
        /* Footer */
        footer {
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: 30px;
        }
        footer p {
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo">
            <img src="https://clipground.com/images/nutritional-logo-1.jpg" alt="Nutrifoods Logo">
            <h1>Nutrifoods</h1>
        </div>
        <div class="nav-links">
            <a href="#contact">Contact Us</a>
            <a href="userreg">Register</a>
            <a href="userlogin">Login</a>
        </div>
    </div>

    <!-- Banner -->
    <div class="banner" id="banner">
        <div class="banner-slide">
            <h2>Welcome to Nutrifoods</h2>
            <p>Your gateway to a healthier lifestyle.</p>
        </div>
    </div>

    <!-- About Section -->
    <div class="section about">
        <h2>About Us</h2>
        <p>Nutrifoods is dedicated to providing the best nutrition for a healthy and active lifestyle. We offer a range of high-quality products to help you fuel your workouts and improve your well-being.</p>
    </div>

    <!-- Contact Section -->
    <div class="section contact" id="contact">
        <h2>Contact Us</h2>
        <p>If you have any questions, feel free to reach out:</p>
        <div class="contact-box">
            <h3>Call Us:</h3>
            <p>We're happy to help with any inquiries you may have. Reach us at:</p>
            <a href="tel:+18001234567">+1 (800) 123-4567</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Nutrifoods. All rights reserved.</p>
    </footer>

    <script>
        // Sliding Banner Effect
        const banner = document.getElementById('banner');
        const slides = [
            'url("https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg")',
            'url("https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg")',
            'url("https://images.pexels.com/photos/6120238/pexels-photo-6120238.jpeg")',
        ];
        let currentSlide = 0;
        function changeSlide() {
            currentSlide = (currentSlide + 1) % slides.length;
            banner.style.backgroundImage = slides[currentSlide];
        }
        setInterval(changeSlide, 5000);
        // Set initial background image
        banner.style.backgroundImage = slides[currentSlide];
    </script>
</body>
</html>
