package airlinereservationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class search_results extends HttpServlet {

    // Method to log user preferences
    private void logUserPreference(Connection conn, String username, String from_city, String to_city) {
        try {
            String sql = "INSERT INTO user_preferences (username, departure, destination) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            String from_city_first_word = from_city.split(" ")[0];
            String to_city_first_word = to_city.split(" ")[0];
            statement.setString(2, from_city_first_word);
            statement.setString(3, to_city_first_word);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement st = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
            System.out.println("121324");
            System.out.println("connected124!.....");
            System.out.println("121324");
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            System.out.println("1234");
            String from_city = request.getParameter("from_city");
            String to_city = request.getParameter("to_city");
            String flight_name = request.getParameter("flight_name");
            String to_date = request.getParameter("departure-date");
            
            System.out.println("date"+to_city);
          System.out.println("date"+to_date);
            // Log the user preference
            if (username != null && from_city != null && to_city != null && !from_city.isEmpty() && !to_city.isEmpty()) {
                logUserPreference(conn, username, from_city, to_city);
            }

            if ((from_city == null || from_city.isEmpty()) && (to_city == null || to_city.isEmpty())) {
                RequestDispatcher error = request.getRequestDispatcher("error.jsp");
                error.forward(request, response);
                conn.close();
                System.out.println("Disconnected!");
                return;
            } else {
                ArrayList al = null;
                ArrayList pid_list = new ArrayList();
                StringBuilder query = new StringBuilder("SELECT * FROM flight_details WHERE 1=1");

                if (from_city != null && !from_city.isEmpty()) {
                    query.append(" AND from_city = ?");
                }
                if (to_city != null && !to_city.isEmpty()) {
                    query.append(" AND to_city = ?");
                }
                
                if (to_date != null && !to_date.isEmpty()) {
                    query.append(" AND date_of_flight = ?");
                } else {
                    query.append(" AND TO_DATE(date_of_flight, 'YYYY-MM-DD') >= SYSDATE");
                }

                PreparedStatement pstmt = conn.prepareStatement(query.toString());
                int paramIndex = 1;

                if (from_city != null && !from_city.isEmpty()) {
                    pstmt.setString(paramIndex++, from_city);
                }
                if (to_city != null && !to_city.isEmpty()) {
                    pstmt.setString(paramIndex++, to_city);
                }
                if (to_date != null && !to_date.isEmpty()) {
                    pstmt.setString(paramIndex++, to_date);
                }

                System.out.println("query " + query);

                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    // Get the arrival time from the result set
                    String arrivalTimeStr = rs.getString("flight_arrival_time");
          
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
                RequestDispatcher view = request.getRequestDispatcher("search1.jsp");
                view.forward(request, response);
                conn.close();
                System.out.println(pid_list);
                System.out.println("Disconnected!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "getting records from database through servlet controller";
    }
}
