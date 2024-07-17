package airlinereservationsystem;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logout_u extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Invalidate the session
            session.invalidate();
        }

        // Redirect to the login page
        response.sendRedirect("login_u.jsp");
    }
}
