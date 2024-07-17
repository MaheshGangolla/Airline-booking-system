package airlinereservationsystem;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserHistoryAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement st = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
            System.out.println("connected!.....");

            ArrayList<ArrayList<String>> pid_list = new ArrayList<>();

            String query = "SELECT bd.username, bd.flight_no, bd.date_of_flight, bd.no_of_seats, bd.ticket_type, bd.PNR, pd.actual_fair " +
                           "FROM booking_details bd " +
                           "INNER JOIN payment_details pd ON bd.PNR = pd.PNR " +
                           "WHERE bd.username = ?";

            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, (String) request.getSession().getAttribute("username"));
            System.out.println("query: " + query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ArrayList<String> al = new ArrayList<>();
                al.add(rs.getString("username"));
                al.add(rs.getString("flight_no"));
                al.add(rs.getString("date_of_flight"));
                al.add(String.valueOf(rs.getInt("no_of_seats")));
                al.add(rs.getString("ticket_type"));
                al.add(rs.getString("PNR"));
                al.add(String.valueOf(rs.getInt("actual_fair")));
                pid_list.add(al);
            }
            request.setAttribute("piList", pid_list);
            System.out.println("nani");
            RequestDispatcher view = request.getRequestDispatcher("history_u.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "getting records from database through servlet controller";
    }
}
