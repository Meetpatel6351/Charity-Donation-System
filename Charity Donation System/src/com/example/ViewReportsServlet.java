package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;


public class ViewReportsServlet extends HttpServlet {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/charity_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String[]> reports = fetchReports();

        // Pass the fetched reports to the JSP
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("viewReports.jsp").forward(request, response);
    }

    private ArrayList<String[]> fetchReports() {
        ArrayList<String[]> reports = new ArrayList<>();
        String query = "SELECT report_id, report_name, created_at FROM reports";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                String[] report = {
                    String.valueOf(rs.getInt("report_id")),
                    rs.getString("report_name"),
                    rs.getString("created_at")
                };
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }
}
