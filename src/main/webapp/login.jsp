<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
        justify-content: center;
        align-items: center;
    }
    .login-box {
        background: white;
        color: #333;
        border-radius: 15px;
        padding: 50px;
        width: 400px;
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
    .login-box h1 {
        font-size: 38px;
        margin-bottom: 20px;
        color: #4CAF50;
        font-family: 'Pacifico', cursive;
    }
    .login-box label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        color: #555;
        text-align: left;
    }
    .login-box input[type="text"], 
    .login-box input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        background-color: #f4f4f4;
    }
    .login-box button {
        padding: 15px 30px;
        background: linear-gradient(90deg, #000000, #4CAF50);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .login-box button:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        background: #81c784;
        color: black;
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
    <div class="login-box">
        <h1>Login</h1>
        <form action="/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </div>
</div>

<div class="footer">
    <p>&copy; 2024 Project Hub. All Rights Reserved.</p>
</div>

</body>
</html>
