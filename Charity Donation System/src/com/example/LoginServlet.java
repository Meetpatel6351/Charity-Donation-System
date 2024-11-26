package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userType = request.getParameter("userType");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
                   
            String dbURL = "jdbc:mysql://localhost:3306/charity_system";
            String dbUser = "root";
            String dbPassword = "";

            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Query to verify login credentials
            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // Use hashing for production
            stmt.setString(3, userType);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Successful login, redirect to dashboard
                response.sendRedirect("dashboard.jsp?userType=" + userType);
            } else {
                // Failed login, return to login page with error
                response.getWriter().write("<h3>Invalid credentials. Please try again.</h3>");
                response.getWriter().write("<a href='login.jsp'>Back to Login</a>");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<h3>Database connection error. Please try again later.</h3>");
        }
    }
}
