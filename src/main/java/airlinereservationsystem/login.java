package airlinereservationsystem;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // JDBC connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");

            PreparedStatement pst = conn.prepareStatement("SELECT admin_name FROM admin_log WHERE admin_name=? AND admin_pass=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            // Authentication logic
            if (rs.next()) {
                // If user exists, set session attribute and redirect to the original URL
                String adminName = rs.getString("admin_name");
                HttpSession session = request.getSession();
                session.setAttribute("admin_name", adminName);

                // Retrieve the original URL from the session attribute
                String originalURL = (String) session.getAttribute("originalURL");
                if (originalURL != null) {
                    // Redirect back to the original URL
                    response.sendRedirect(originalURL);
                } else {
                    // If the original URL is not available, redirect to a default page
                    response.sendRedirect("adminhome.jsp");
                }
            } else {
                // If user does not exist, redirect back to the admin login page
                response.sendRedirect("login_a.jsp");
            }

            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

