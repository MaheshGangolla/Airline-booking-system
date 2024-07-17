<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="startnav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline Booking System</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: #333;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Hero Section Styles */
        .hero {
            background: linear-gradient(to right, #0066cc, #3399ff);
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before, .hero::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
        }

        .hero::before {
            width: 300px;
            height: 300px;
            bottom: 100px;
            left: -100px;
        }

        .hero::after {
            width: 200px;
            height: 200px;
            top: 50px;
            right: -100px;
        }

        .hero-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .hero-content p {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn {
            background-color: #f60;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #e55;
        }

        /* Features Section Styles */
        .features {
            padding: 60px 20px;
            text-align: center;
        }

        .features h2 {
            font-size: 36px;
            margin-bottom: 40px;
        }

        .feature-cards {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .feature-card {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            width: 30%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .feature-card img {
            width: 80px;
            height: 80px;
        }

        .feature-card h3 {
            font-size: 24px;
            margin: 20px 0 10px;
        }

        .feature-card p {
            font-size: 16px;
            line-height: 1.5;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        /* Footer Styles */
        footer {
            background-color: #004080;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to Airline Booking System</h1>
            <p>Your journey begins here. Book flights to your favorite destinations with ease.</p>
            <div class="buttons">
                <a href="registration.jsp" class="btn signup-btn">Sign Up</a>
                <a href="login_u.jsp" class="btn login-btn">Login</a>
            </div>
        </div>
    </section>

    <section class="features">
        <h2>Why Book with Us?</h2>
        <div class="feature-cards">
            <div class="feature-card">
                <img src="s.png" alt="Secure Booking">
                <h3>Secure Booking</h3>
                <p>Experience a safe and secure booking process with our advanced encryption methods.</p>
            </div>
            <div class="feature-card">
                <img src="su.png" alt="24/7 Support">
                <h3>24/7 Support</h3>
                <p>Our customer support is available around the clock to assist you with any queries.</p>
            </div>
            <div class="feature-card">
                <img src="d.png" alt="Top Destinations">
                <h3>Top Destinations</h3>
                <p>Fly to the most popular destinations around the world with competitive prices.</p>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Airline Booking System. All rights reserved.</p>
    </footer>
</body>
</html>
