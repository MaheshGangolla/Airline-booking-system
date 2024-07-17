package airlinereservationsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/resetpassword")
public class resetnewpassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("codeVerified") == null || !(Boolean) session.getAttribute("codeVerified")) {
            response.sendRedirect("validatecode.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("newPassword");
     System.out.println(email);
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String query = "UPDATE user_details SET password = ? WHERE email_address = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, newPassword);
            stmt.setString(2, email);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().write("Password reset successful.");
                session.invalidate(); // Invalidate the session after successful reset
            } else {
                response.getWriter().write("Error resetting password. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error resetting password. Please try again.");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
