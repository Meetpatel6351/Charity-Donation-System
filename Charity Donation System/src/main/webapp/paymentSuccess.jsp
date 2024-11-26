<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        .details {
            text-align: left;
            margin: 20px 0;
        }

        .details p {
            margin: 5px 0;
            font-size: 16px;
        }

        a {
            text-decoration: none;
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Successful!</h1>
        <%
            // Retrieve payment details from the form
            String charityId = request.getParameter("charity");
            String amount = request.getParameter("amount");
            String cardName = request.getParameter("name");
            String charityName = "";
            String charityDescription = "";

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Establish database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "your_password");

                // Fetch charity details
                String query = "SELECT name, description FROM charities WHERE id = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(charityId));
                rs = stmt.executeQuery();

                if (rs.next()) {
                    charityName = rs.getString("name");
                    charityDescription = rs.getString("description");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
        <p>Thank you, <b><%= cardName %></b>, for your generous contribution.</p>

        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
