package airlinereservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/processPassengerDetails")
public class ProcessPassengerDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
        	
            String sql = "INSERT INTO passenger_details (passenger_id, booking_id, name, mobile, age, gender) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                for (int i = 1; i <= 2; i++) {
                    String firstName = request.getParameter("firstName" + i);
                    String lastName = request.getParameter("lastName" + i);
                    String age = request.getParameter("age" + i);
                    String mobile = request.getParameter("mobile" + i);
                    String email = request.getParameter("email" + i);
                    String gender = request.getParameter("gender" + i); // Ensure you add gender input field in the form

                    String name = firstName + " " + lastName;

                    pstmt.setInt(1, 0); // For auto-incrementing primary key
                    pstmt.setInt(2, getBookingId(request)); // Method to get booking_id
                    pstmt.setString(3, name);
                    pstmt.setString(4, mobile);
                    pstmt.setInt(5, Integer.parseInt(age));
                    pstmt.setString(6, gender);

                    pstmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }

        response.sendRedirect("user_booking.jsp");
    }

    private int getBookingId(HttpServletRequest request) {
        return Integer.parseInt(request.getParameter("bookingId"));
    }
}
