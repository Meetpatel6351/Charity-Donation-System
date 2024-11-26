<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Make a Payment</title>
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
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input, select, button {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }

        button {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Payment</h1>
        <a href="index.jsp">Home</a>
    </div>

    <!-- Payment Form -->
    <div class="container">
        <h2>Make a Payment</h2>
        <form action="paymentSuccess.jsp" method="post">
            <!-- Fetch and display charity options -->
            <label for="charity">Select Charity:</label>
            <select id="charity" name="charity" required>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Establish database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charity_system", "root", "");

                        // Fetch charity data
                        String query = "SELECT id, name, description FROM charities";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(query);

                        // Populate the dropdown
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String description = rs.getString("description");
                            out.println("<option value='" + id + "'>" + name + " - " + description + "</option>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </select>

            <!-- Payment Details -->
            <label for="name">Name on Card:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9101 1121" required>

            <label for="expiry">Expiry Date:</label>
            <input type="month" id="expiry" name="expiry" required>

            <label for="cvv">CVV:</label>
            <input type="password" id="cvv" name="cvv" placeholder="123" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" placeholder="Enter amount in USD" required>

            <button type="submit">Make Payment</button>
        </form>
    </div>
</body>
</html>
