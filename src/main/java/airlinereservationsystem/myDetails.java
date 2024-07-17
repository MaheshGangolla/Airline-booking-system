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
public class myDetails extends HttpServlet{
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

	        String query = "SELECT * FROM user_details WHERE username = ?";

	        PreparedStatement pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, (String) request.getSession().getAttribute("username"));
	        System.out.println("query " + query);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            System.out.println("dfd");
	            al = new ArrayList();

	            al.add(rs.getString("fullname"));
	            al.add(rs.getString("username"));
	            al.add(rs.getString("password"));
	            al.add(rs.getString("mobileno"));
	            al.add(rs.getString("email_address"));
	            al.add(rs.getString("city"));
	            al.add(rs.getString("state"));
	            al.add(rs.getString("pincode"));
	            System.out.println(rs.getString("fullname"));
		        System.out.println(rs.getString("username"));
		        System.out.println(rs.getString("password"));
		        System.out.println(rs.getString("mobileno"));
		        System.out.println(rs.getString("email_address"));
		        System.out.println(rs.getString("email_address"));
		        System.out.println(rs.getString("state"));

	            System.out.println("al :: " + al);
	            pid_list.add(al);
	        }
	        request.setAttribute("piList", pid_list);
	        RequestDispatcher view = request.getRequestDispatcher("userDetails_u.jsp");
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

