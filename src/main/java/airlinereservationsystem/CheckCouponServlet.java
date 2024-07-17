package airlinereservationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckCouponServlet")
public class CheckCouponServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String couponCode = request.getParameter("coupon");

        // Database connection parameters
        String url = "jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net";
        String username = "tech4";
        String password = "Nalsoft123";

        // SQL query to check if the coupon exists in the database
        String sql = "SELECT * FROM coupon_table WHERE cname = ?";

        try {
            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // Prepare and execute SQL statement
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, couponCode);
            ResultSet resultSet = statement.executeQuery();

            // Check if the coupon exists
            if (resultSet.next()) {
                // Coupon exists in the table
                int discountPercentage = resultSet.getInt("discountpercentage");
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("text/plain");
                PrintWriter out = response.getWriter();
                out.println("Coupon is valid! Discount: " + discountPercentage + "%");
            } else {
                // Coupon does not exist in the table
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.setContentType("text/plain");
                PrintWriter out = response.getWriter();
                out.println("Invalid coupon code!");
            }

            // Close database connection
            conn.close();
        } catch (Exception e) {
            // Handle any errors
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            out.println("Error processing coupon!");
        }
    }
}

