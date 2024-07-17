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
public class displaydisputes extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    Connection conn = null;
	    Statement st = null;
	    try {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
	        System.out.println("connected!.....");

	        ArrayList al = null;
	        ArrayList pid_list = new ArrayList();

	        String query = "SELECT * FROM FlightDisputes ORDER BY id DESC";

	        PreparedStatement pstmt = conn.prepareStatement(query);
	        System.out.println("query " + query);
           
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            System.out.println("dfd");
	            al = new ArrayList();

	            al.add(rs.getString("id"));
	            al.add(rs.getString("name"));
	            al.add(rs.getString("ticket_type"));
	            al.add(rs.getString("pnr_number"));
	            al.add(rs.getString("date_of_flight"));
	            al.add(rs.getString("mobile_number"));
	            al.add(rs.getString("message"));
	           
	            System.out.println(rs.getString("id"));
		        System.out.println(rs.getString("name"));
		        System.out.println(rs.getString("ticket_type"));
		        System.out.println(rs.getString("pnr_number"));
		        System.out.println(rs.getString("date_of_flight"));
		        System.out.println(rs.getString("mobile_number"));
		        System.out.println(rs.getString("message"));

	            System.out.println("al :: " + al);
	            pid_list.add(al);
	        }
	        request.setAttribute("piList", pid_list);
	        RequestDispatcher view = request.getRequestDispatcher("support_u.jsp");
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
	    }// </editor-fold>
                
		}

