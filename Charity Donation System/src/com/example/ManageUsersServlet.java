package com.example;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



@SuppressWarnings("serial")
public class ManageUsersServlet extends HttpServlet {
    // Database URL, username, password
    private static final String DB_URL = "jdbc:mysql://localhost:3306/charity_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role"); // role: Admin, Fundraiser, Donor
        if (role == null) role = "Donor"; // Default to 'Donor' if no role is selected

        ArrayList<String[]> users = null;
		try {
			users = getUsersByRole(role);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


        request.setAttribute("users", users);
        request.setAttribute("role", role);
        request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
    }

    // Method to fetch users based on their role
    private ArrayList<String[]> getUsersByRole(String role) throws ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        ArrayList<String[]> users = new ArrayList<>();
        String query = "SELECT id, username, name, status FROM users WHERE role = ?";
        
        // Test database connection
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            System.out.println("Database connection successful");
        } catch (SQLException e) {
            System.out.println("Database connection failed");
            e.printStackTrace();
            return users; // Return empty list if connection fails
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, role);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String[] user = {
                    String.valueOf(rs.getInt("id")),
                    rs.getString("username"),
                    rs.getString("name"),
                    rs.getString("status")
                };
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
