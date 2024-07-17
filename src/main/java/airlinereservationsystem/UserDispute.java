package airlinereservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserDispute extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the parameters from the request
        String name = request.getParameter("name");
        String ticket_type = request.getParameter("type");
        String pnr_number = request.getParameter("PNR");
        String date_of_flight = request.getParameter("date");
        String mobile_number = request.getParameter("mobile");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement pstmt = null;
        System.out.println("Reached the servlet");

        try {
            // Database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");

            // Prepare SQL statement
            String sql = "INSERT INTO FlightDisputes (name, ticket_type, pnr_number, date_of_flight, mobile_number, message) " +
                         "VALUES (?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, name.trim());
            pstmt.setString(2, ticket_type);
            pstmt.setString(3, pnr_number);
            pstmt.setString(4, date_of_flight);
            pstmt.setString(5, mobile_number);
            pstmt.setString(6, message);

            // Execute update
            int rowsInserted = pstmt.executeUpdate();
            System.out.println("Rows inserted: " + rowsInserted);

            if (rowsInserted > 0) {
                response.sendRedirect("support.jsp?status=success");
            } else {
                request.setAttribute("status", "Failed to insert flight dispute.");
                request.getRequestDispatcher("support.jsp").forward(request, response);
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            
            
        }
        
        
        
        
    }
}
