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
public class userDetails extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
  
        Statement st=null;
        try {
        	
       	 Class.forName("oracle.jdbc.driver.OracleDriver");  
   		 conn=DriverManager.getConnection(  
   			"jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net","tech4","Nalsoft123");
            System.out.println("connected!.....");
           
            
         
           
            ArrayList<ArrayList<String>> pid_list = new ArrayList<>();
            String query = "SELECT * FROM user_details";

            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    ArrayList<String> al = new ArrayList<>();
                    al.add(rs.getString("fullname"));
                    al.add(rs.getString("username"));
                    al.add(rs.getString("password"));
                    al.add(rs.getString("mobileno"));
                    al.add(rs.getString("email_address"));
                    al.add(rs.getString("city"));
                    al.add(rs.getString("state"));
                    al.add(rs.getString("pincode"));
                    al.add(rs.getString("userid"));
                    pid_list.add(al);
                }

                request.setAttribute("piList", pid_list);
                RequestDispatcher view = request.getRequestDispatcher("userDetails.jsp");
                view.forward(request, response);
            } catch (SQLException e) {
                // Handle any SQL errors
                e.printStackTrace(); // Or log the error
                // Redirect or display an error page
                RequestDispatcher errorPage = request.getRequestDispatcher("error.jsp");
                errorPage.forward(request, response);
            } catch (ServletException | IOException e) {
                // Handle any other errors
                e.printStackTrace(); // Or log the error
                // Redirect or display an error page
                RequestDispatcher errorPage = request.getRequestDispatcher("error.jsp");
                errorPage.forward(request, response);
            }
        
          
            conn.close();
            System.out.println("Disconnected!");
            
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
  
}
