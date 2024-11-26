<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Charity Donation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }
        main {
            margin: 2rem auto;
            max-width: 600px;
            text-align: center;
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        a {
            display: inline-block;
            margin: 1rem;
            text-decoration: none;
            color: #007bff;
            font-size: 1.2rem;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<div style="position: fixed; top: 10px; right: 10px;">
    <a href="dashboard.jsp" style="
        text-decoration: none; 
        font-size: 18px; 
        font-weight: bold; 
        padding: 10px 20px; 
        background-color: #007bff; 
        color: white; 
        border-radius: 5px; 
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
        transition: background-color 0.3s ease, transform 0.2s ease;">
        Dashboard
    </a>
</div>
    <header>
        <h1>Welcome to the Charity Donation System</h1>
    </header>
    <main>
        <p>Choose an option to proceed:</p>
        <a href="manageUsers.jsp">Manage Users</a>
        <a href="viewReports.jsp">View Reports</a>
        <a href="approveCharity.jsp">Approve Charities</a>
    </main>
</body>
</html>
