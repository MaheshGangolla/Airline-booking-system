package airlinereservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TopDestinationsServlet")
public class TopDestinationsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        System.out.println("fsf");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establishing database connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net", "TECH4", "Nalsoft123");

            // SQL query to fetch top destinations
            String sql = "SELECT d.destination_name, d.description, d.img_location, COUNT(up.destination) AS count " +
                         "FROM user_preferences up " +
                         "INNER JOIN destination_info d ON up.destination = d.destination_name " +
                         "GROUP BY d.destination_name, d.description, d.img_location " +
                         "ORDER BY count DESC " +
                         "FETCH FIRST 3 ROWS ONLY";

            // Creating prepared statement
            PreparedStatement statement = conn.prepareStatement(sql);

            // Executing query
            ResultSet resultSet = statement.executeQuery();

            int index = 1;
            while (resultSet.next() && index <= 3) {
                // Retrieving destination information from result set
                String destinationName = resultSet.getString("destination_name");
                String description = resultSet.getString("description");
                String imgLocation = resultSet.getString("img_location");

                // Setting destination attributes in request
                request.setAttribute("destination" + index, destinationName);
                request.setAttribute("description" + index, description);
                request.setAttribute("imgLocation" + index, imgLocation);

                index++;
            }

            // Closing resources
           
            ResultSet resultSet1 = statement.executeQuery();
           
            request.getRequestDispatcher("userhome.jsp").forward(request, response);
            resultSet.close();
            statement.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Closing connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

