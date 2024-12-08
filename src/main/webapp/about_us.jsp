<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(120deg, #4CAF50, #81c784);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: rgb(55, 56, 54);
        }
        nav {
            background: rgba(0, 0, 0, 0.9);
            display: flex;
            justify-content: center;
            padding: 10px 0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        nav a:hover {
            background: #81c784;
            transform: scale(1.1);
            color: black;
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .about-box {
            background: white;
            color: #333;
            border-radius: 15px;
            padding: 40px;
            max-width: 800px;
            text-align: center;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
            animation: slideIn 1s ease-in-out;
        }
        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        .about-box h2 {
            font-size: 38px;
            margin-bottom: 20px;
            color: #4CAF50;
            font-family: 'Pacifico', cursive;
        }
        .about-box p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .about-box h3 {
            color: #4CAF50;
            margin-bottom: 10px;
        }
        .footer {
            background: linear-gradient(90deg, #333333, #000000);
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 14px;
            box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<nav>
    <a href="/home">Home</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
    <a href="/about-us">About Us</a>
</nav>

<div class="container">
    <div class="about-box">
        <h2>About Us</h2>
        <p>
            Welcome to our **Student Portal**, a comprehensive platform designed to help students manage academic projects and build their professional portfolios efficiently.
        </p>
        <p>
            This portal provides tools for tracking project progress, showcasing completed works, and collaborating with peers. Our goal is to ensure that students are equipped with a structured and organized approach to managing their academic and extracurricular projects.
        </p>
        <h3>Our Vision</h3>
        <p>
            To empower students with tools that bridge the gap between academic achievement and professional growth. By leveraging the power of technology, we aim to prepare students for the competitive world ahead.
        </p>
        <h3>Why Choose Us?</h3>
        <ul style="text-align: left; margin: 20px 0; line-height: 1.8;">
            <li><b>Intuitive Design:</b> A user-friendly interface that simplifies project management.</li>
            <li><b>Collaboration Features:</b> Tools to facilitate teamwork and peer collaboration.</li>
            <li><b>Portfolio Showcase:</b> Easily create and share your portfolio with potential employers.</li>
            <li><b>Secure & Reliable:</b> Robust security measures to protect your data and credentials.</li>
        </ul>
        <h3>Our Commitment</h3>
        <p>
            We are committed to providing a platform that helps students grow, learn, and excel in their academic and professional journeys. Whether you're working on a school project or preparing for a job interview, our portal has the features to support your success.
        </p>
    </div>
</div>

<div class="footer">
    <p>&copy; 2024 Student Portal. All Rights Reserved.</p>
</div>

</body>
</html>
