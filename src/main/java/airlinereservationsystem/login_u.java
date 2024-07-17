package airlinereservationsystem;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login_u extends HttpServlet {

    // Method to log user activity and return the generated ID
    private int logUserAction(Connection conn, String username, String action, String details) {
        int logId = -1;
        if (username == null || username.isEmpty()) {
            System.err.println("Username cannot be null or empty for logging.");
            return logId;
        }
        try {
            String sql = "INSERT INTO user_activity_log (username, action, details) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, username);
            statement.setString(2, action);
            statement.setString(3, details);
            
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
           
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logId;
    }

    // Method to fetch top three destinations
    private void fetchTopDestinations(Connection conn, HttpSession session) {
        try {
            String sql = "SELECT d.destination_name, d.description, d.img_location, COUNT(up.destination) AS count " +
                    "FROM user_preferences up " +
                    "INNER JOIN destination_info d ON up.destination = d.destination_name " +
                    "GROUP BY d.destination_name, d.description, d.img_location " +
                    "ORDER BY count DESC " +
                    "FETCH FIRST 3 ROWS ONLY";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            int index = 1;
            while (resultSet.next() && index <= 3) {
                String destinationName = resultSet.getString("destination_name");
                String description = resultSet.getString("description");
                String imgLocation = resultSet.getString("img_location");

                session.setAttribute("destination" + index, destinationName);
                session.setAttribute("description" + index, description);
                session.setAttribute("imgLocation" + index, imgLocation);

                index++;
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    // Process requests (both GET and POST)
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Check if username or password is null
            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                response.sendRedirect("login_u.jsp");
                return;
            }

            // JDBC connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net", "TECH4", "Nalsoft123");

            PreparedStatement pst = conn.prepareStatement("SELECT username, password FROM user_details WHERE username=? AND password=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            // Log the login attempt
           
            // Authentication logic
            if (rs.next()) {
                // If user exists, set session attribute and fetch top destinations
                String userName = rs.getString("username");
                HttpSession session = request.getSession();
                session.setAttribute("username", userName);

                // Log the successful login
                logUserAction(conn, username, "Login", "User successfully logged in");

                // Fetch top destinations and set as session attributes
                fetchTopDestinations(conn, session);

                // Retrieve the original URL from the session attribute
                String originalURL = (String) session.getAttribute("originalURL");
                if (originalURL != null) {
                    // Redirect back to the original URL
                    response.sendRedirect(originalURL);
                } else {
                    // If the original URL is not available, forward to the flight_search.jsp
                    RequestDispatcher dispatcher = request.getRequestDispatcher("userhome.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // If user does not exist, log the failed login and redirect back to the login page
                logUserAction(conn, username, "Login Failed", "User login attempt failed");
                response.sendRedirect("login_u.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            // Ensure the connection is closed
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
