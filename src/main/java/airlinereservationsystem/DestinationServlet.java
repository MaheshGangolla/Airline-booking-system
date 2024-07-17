package airlinereservationsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class DestinationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Database connection parameters
        String jdbcURL = "jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net";
        String dbUser = "TECH4";
        String dbPassword = "Nalsoft123";

        try {
            // Load JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to get top 3 destinations from user_preferences
            String sql = "SELECT destination, COUNT(destination) AS count " +
                         "FROM user_preferences " +
                         "GROUP BY destination " +
                         "ORDER BY count DESC " +
                         "FETCH FIRST 3 ROWS ONLY";

            // Create statement and execute query
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            // Process the result set
            int index = 1;
            while (resultSet.next() && index <= 3) {
                String destination = resultSet.getString("destination");
                request.setAttribute("destination" + index, destination);
                index++;
            }

            // Close connections
            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("flight_search.jsp");
        dispatcher.forward(request, response);
    }
}
