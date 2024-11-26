<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .registration-form {
            background-color: white;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .registration-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            margin-top: 10px;
            color: green;
            font-size: 14px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="registration-form">
        <h2>Register</h2>
        <form method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required />
            </div>
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" name="name" id="name" required />
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select name="role" id="role" required>
                    <option value="">--Select Role--</option>
                    <option value="Admin">Admin</option>
                    <option value="Donor">Donor</option>
                    <option value="Fundraiser">Fundraiser</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
        <%
            // Database connection and insertion logic
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String role = request.getParameter("role");
                String status = "Active"; // Default status

                Connection conn = null;
                PreparedStatement stmt = null;
                String message = "";

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charity_system", "root", "");

                    // Insert user data into the `users` table
                    String sql = "INSERT INTO users (username, password, name, status, role) VALUES (?, ?, ?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    stmt.setString(3, name);
                    stmt.setString(4, status);
                    stmt.setString(5, role);

                    int rows = stmt.executeUpdate();

                    if (rows > 0) {
                        message = "Registration successful!";
                    }
                } catch (Exception e) {
                    message = "Error: " + e.getMessage();
                } finally {
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                }
        %>
            <div class="message <%= message.contains("Error") ? "error" : "" %>"><%= message %></div>
        <%
            }
        %>
    </div>
</body>
</html>
