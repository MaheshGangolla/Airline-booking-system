package airlinereservationsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
   
        // Initialize database connection
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
        
            // Check if the email exists in the user_details table
            String query = "SELECT * FROM user_details WHERE email_address = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Email exists, generate and send the code
                String code = PasswordResetService.generateCode();
                PasswordResetService.storeCode(email, code);

                // Send the code to the user's email
                String subject = "Your Password Reset Code";
                String body = "Your password reset code is: " + code;
                EmailUtil.sendEmail(email, subject, body);

                response.getWriter().println("Code sent successfully!");
            } else {
                // Email does not exist
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().println("Email not found.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or query errors
        } finally {
            // Close resources in finally block
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
