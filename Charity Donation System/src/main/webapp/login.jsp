<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Charity Donation System</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .login-container h1 {
            color: #ff6f61;
            margin-bottom: 20px;
            font-size: 2rem;
        }
        .login-container p {
            color: #555;
            font-size: 16px;
            margin-bottom: 20px;
        }
        select, input[type="text"], input[type="password"], button {
            display: block;
            width: 100%;
            padding: 0.8rem;
            margin: 0.8rem 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        select {
            color: #007bff;
        }
        button {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #0056b3;
        }
        .register-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
            display: inline-block;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .icon {
            font-size: 50px;
            color: #ff6f61;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="icon">&#128100;</div> <!-- User icon -->
        <h1>Login to Charity Donation System</h1>
        <form action="LoginServlet" method="POST">
            <div>
                <label for="userType">User Type</label><br>
                <select name="userType" id="userType" required>
                    <option value="Donor">Donor</option>
                    <option value="Fundraiser">Fundraiser</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <input type="text" name="username" placeholder="Enter username" required>
            <input type="password" name="password" placeholder="Enter password" required>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account?</p>
        <a href="register.jsp" class="register-link">Create New Account</a>
    </div>
</body>
</html>
