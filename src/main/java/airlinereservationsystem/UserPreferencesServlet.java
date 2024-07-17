package airlinereservationsystem;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONObject;
@WebServlet("/UserPreferencesServlet")
public class UserPreferencesServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net";
    private static final String DB_USER = "tech4";
    private static final String DB_PASSWORD = "Nalsoft123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<Map<String, Object>> preferences = new ArrayList<>();
        Map<String, Integer> destinationCount = new HashMap<>();

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to the database
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Prepare a statement to retrieve user preferences for the given username
            String sql = "SELECT * FROM user_preferences WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                Map<String, Object> preference = new HashMap<>();
                preference.put("id", rs.getInt("id"));
                preference.put("username", rs.getString("username"));
                preference.put("destination", rs.getString("destination"));
                preference.put("departure", rs.getString("departure"));
                preference.put("search_date", rs.getTimestamp("search_date"));
                preferences.add(preference);

                // Count destination occurrences
                String destination = rs.getString("destination");
                destinationCount.put(destination, destinationCount.getOrDefault(destination, 0) + 1);
            }

        } catch (Exception e) {
            throw new ServletException("Database access error", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new ServletException("Error closing database resources", e);
            }
        }

        // Prepare chart data
        JSONObject chartData = new JSONObject();
        List<String> labels = new ArrayList<>();
        List<Integer> data = new ArrayList<>();

        destinationCount.forEach((key, value) -> {
            labels.add(key);
            data.add(value);
        });

        chartData.put("labels", labels);
        chartData.put("data", data);

        // Set request attributes and forward to JSP
        request.setAttribute("username", username);
        request.setAttribute("preferences", preferences);
        request.setAttribute("chartData", chartData.toString());
        RequestDispatcher dispatcher = request.getRequestDispatcher("userPreferences.jsp");
        dispatcher.forward(request, response);
    }
}
