<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            margin-left: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 40px 20px;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            color: #333;
            margin-bottom: 10px;
        }

        .card p {
            color: #777;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .card a:hover {
            color: #0056b3;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card-container .card {
            flex: 1;
            margin: 10px;
            max-width: calc(33.333% - 20px);
            min-width: 250px;
        }

        @media (max-width: 768px) {
            .card-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Dashboard</h1>
        <div>
            <a href="index.jsp">Home</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Welcome to Your Dashboard!</h2>
        <p>Use the links below to navigate:</p>
        <div class="card-container">
            <div class="card">
                <h3>Manage Users</h3>
                <p>View, edit, and manage user accounts.</p>
                <a href="manageUsers.jsp">Go to Manage Users</a>
            </div>
            <div class="card">
                <h3>View Donations</h3>
                <p>Check donation records and reports.</p>
                <a href="viewDonations.jsp">Go to Donations</a>
            </div>
            <div class="card">
                <h3>Fundraisers</h3>
                <p>Manage active fundraisers and applications.</p>
                <a href="manageFundraisers.jsp">Go to Fundraisers</a>
            </div>
            <div class="card">
                <h3>Profile</h3>
                <p>Update your profile details.</p>
                <a href="profile.jsp">Go to Profile</a>
            </div>
            <div class="card">
                <h3>Settings</h3>
                <p>Adjust application settings and preferences.</p>
                <a href="settings.jsp">Go to Settings</a>
            </div>
            <div class="card">
                <h3>Reports</h3>
                <p>Generate and download reports.</p>
                <a href="reports.jsp">Go to Reports</a>
            </div>
            <div class="card">
                <h3>Payment</h3>
                <p>Make Payments</p>
                <a href="payment.jsp">Proceed to pay</a>
            </div>
        </div>
    </div>
</body>
</html>
