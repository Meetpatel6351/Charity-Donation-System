package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;


public class ApproveCharityServlet extends HttpServlet {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/charity_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String[]> charities = fetchPendingCharities();

        // Pass the fetched charities to the JSP
        request.setAttribute("charities", charities);
        request.getRequestDispatcher("approveCharity.jsp").forward(request, response);
    }

    private ArrayList<String[]> fetchPendingCharities() {
        ArrayList<String[]> charities = new ArrayList<>();
        String query = "SELECT id, name, registration_date FROM charities WHERE status = 'Pending'";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                String[] charity = {
                    String.valueOf(rs.getInt("id")),
                    rs.getString("name"),
                    rs.getString("registration_date")
                };
                charities.add(charity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return charities;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String charityId = request.getParameter("id");
        String action = request.getParameter("action");

        if (charityId != null && action != null) {
            updateCharityStatus(charityId, action.equals("approve") ? "Approved" : "Rejected");
        }

        response.sendRedirect("approveCharity");
    }

    private void updateCharityStatus(String id, String status) {
        String query = "UPDATE charities SET status = ? WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, status);
            stmt.setInt(2, Integer.parseInt(id));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
