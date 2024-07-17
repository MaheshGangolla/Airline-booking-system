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

public class search_results_a extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement st = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
            System.out.println("connected!.....");

            String from_city = request.getParameter("from_city");
            String to_city = request.getParameter("to_city");
            String flight_name = request.getParameter("flight_name");
            String to_date = request.getParameter("departure-date");

            if ((from_city == null || from_city.isEmpty()) && (to_city == null || to_city.isEmpty())) {
                RequestDispatcher error = request.getRequestDispatcher("error.jsp");
                error.forward(request, response);
                conn.close();
                System.out.println("Disconnected!");
                return;
            }

            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            StringBuilder query = new StringBuilder("SELECT * FROM flight_details WHERE 1=1");

            if (from_city != null && !from_city.isEmpty()) {
                query.append(" AND from_city = ?");
            }
            if (to_city != null && !to_city.isEmpty()) {
                query.append(" AND to_city = ?");
            }
            if (flight_name != null && !flight_name.isEmpty()) {
                query.append(" AND flight_name = ?");
            }
            if (to_date != null && !to_date.isEmpty()) {
                query.append(" AND date_of_flight = ?");
            }

            PreparedStatement pstmt = conn.prepareStatement(query.toString());
            int paramIndex = 1;

            if (from_city != null && !from_city.isEmpty()) {
                pstmt.setString(paramIndex++, from_city);
            }
            if (to_city != null && !to_city.isEmpty()) {
                pstmt.setString(paramIndex++, to_city);
            }
            if (flight_name != null && !flight_name.isEmpty()) {
                pstmt.setString(paramIndex++, flight_name);
            }
            if (to_date != null && !to_date.isEmpty()) {
                pstmt.setString(paramIndex++, to_date);
            }

            System.out.println("query " + query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("dfd");
                al = new ArrayList();

                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));
                al.add(rs.getString(8));
                al.add(rs.getString(9));
                al.add(rs.getString(10));
                al.add(rs.getString(11));
                al.add(rs.getString(12));
                al.add(rs.getString(13));
                al.add(rs.getString(14));
                al.add(rs.getString(15));
                al.add(rs.getString(16));
                al.add(rs.getString(17));
                al.add(rs.getString(18));
                al.add(rs.getString(19));
                al.add(rs.getString(20));
                al.add(rs.getString(21));
                System.out.println("al :: " + al);
                pid_list.add(al);
            }

            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("search_a.jsp");
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
