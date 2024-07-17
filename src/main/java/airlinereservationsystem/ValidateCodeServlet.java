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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/validatecode")
public class ValidateCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = request.getParameter("code");

        // Initialize database connection
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
        	 String storedCode = PasswordResetService.getCode(email);

            if (storedCode != null && storedCode.equals(code)) {
                HttpSession session = request.getSession();
                session.setAttribute("codeVerified", true);
                session.setAttribute("email", email);
                response.setContentType("application/json");
                response.getWriter().write("{\"valid\":true}");
                PasswordResetService.removeCode(email);
            } else {
                response.setContentType("application/json");
                response.getWriter().write("{\"valid\":false}");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
