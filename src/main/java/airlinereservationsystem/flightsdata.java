package airlinereservationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetFlightData")
public class flightsdata extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");

            // Base SQL query
            String sql = "SELECT flight_name, date_of_flight, flight_arrival_time, from_city, to_city FROM flight_details WHERE TO_DATE(date_of_flight, 'YYYY-MM-DD') >= TRUNC(SYSDATE) AND TO_DATE(date_of_flight, 'YYYY-MM-DD') <= TRUNC(SYSDATE) + 30";
            
            // Add conditions for fromCity and toCity if they are provided
            if (fromCity != null && !fromCity.isEmpty()) {
                sql += " AND from_city = ?";
            }
            if (toCity != null && !toCity.isEmpty()) {
                sql += " AND to_city = ?";
            }

            // Prepare the statement
            pstmt = conn.prepareStatement(sql);

            // Set the parameters
            int paramIndex = 1;
            if (fromCity != null && !fromCity.isEmpty()) {
                pstmt.setString(paramIndex++, fromCity);
            }
            if (toCity != null && !toCity.isEmpty()) {
                pstmt.setString(paramIndex++, toCity);
            }

            // Execute the query
            rs = pstmt.executeQuery();

            // Convert the result set to CSV format
            StringBuilder csvBuilder = new StringBuilder();

            // Add flight arrival time to the CSV header
            csvBuilder.append("city_type,flight_name,date_of_flight,flight_arrival_time,city,flight_count\n"); // Header

            // Map to store flight counts for each date
            Map<String, Integer> flightCounts = new HashMap<>();

            while (rs.next()) {
                // Get flight information
                String flightName = rs.getString("flight_name");
                String dateOfFlight = rs.getString("date_of_flight");
                String flightArrivalTime = rs.getString("flight_arrival_time");
                String fromCityName = rs.getString("from_city");
                String toCityName = rs.getString("to_city");

                // Increment flight count for the current date
                String dateAndCityKey = dateOfFlight + "_" + fromCityName + "_" + toCityName;
                int count = flightCounts.getOrDefault(dateAndCityKey, 0) + 1;
                flightCounts.put(dateAndCityKey, count);

                // Add flight information to the CSV
                csvBuilder.append("from,");
                csvBuilder.append(flightName).append(",");
                csvBuilder.append(dateOfFlight).append(",");
                csvBuilder.append(flightArrivalTime).append(",");
                csvBuilder.append(fromCityName).append(",");
                csvBuilder.append(count).append("\n");

                // Add another entry for the "to" city
                csvBuilder.append("to,");
                csvBuilder.append(flightName).append(",");
                csvBuilder.append(dateOfFlight).append(",");
                csvBuilder.append(flightArrivalTime).append(",");
                csvBuilder.append(toCityName).append(",");
                csvBuilder.append(count).append("\n");
            }

            // Send the CSV response
            out.print(csvBuilder.toString());
            System.out.println(csvBuilder.toString());
        } catch (Exception e) {
            e.printStackTrace();
            out.print("");
        } finally {
            // Clean-up environment
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
