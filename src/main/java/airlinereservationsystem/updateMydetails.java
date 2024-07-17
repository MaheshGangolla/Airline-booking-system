package airlinereservationsystem;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class updateMydetails extends HttpServlet{
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        
	    }
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    processRequest(request, response);
	    System.out.println("-------------------------------INSIDE REGISTRATION ----------------------");
	    PrintWriter out = response.getWriter();
	    Connection conn = null;
	    String url = "jdbc:oracle:thin:TECH23/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net";
	    String dbName = "trainingdb";
	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String userName = "Tech4";
	    String password1 = "Nalsoft123";
	    try {
	        int count = 0;
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        conn = DriverManager.getConnection(
	                "jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
	        System.out.println("connected!.....");
	        String fullname = request.getParameter("fullname");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String mobileno = request.getParameter("mobile");
	        String email = request.getParameter("email");
	        String state = request.getParameter("state");
	        String city = request.getParameter("city");
	        String pincode = request.getParameter("pincode");
	        System.out.println(fullname);
	        System.out.println(username);
	        System.out.println(password);
	        System.out.println(mobileno);
	        System.out.println(email);
	        System.out.println(state);
	        System.out.println(city);
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("fullname", fullname);

	        Statement st = conn.createStatement();
	        ResultSet rs = st.executeQuery("SELECT * FROM user_details WHERE username='" + username + "'");
	        while (rs.next()) {
	            count++;
	        }
	        if (count > 0) {
	            // If the username already exists, update the existing record
	            int i = st.executeUpdate("UPDATE user_details SET fullname='" + fullname + "', password='" + password
	                    + "', mobileno='" + mobileno + "', email_address='" + email + "', city='" + city
	                    + "', state='" + state + "', pincode=" + pincode + " WHERE username='" + username + "'");
	            System.out.println("-------------------------------INSIDE REGISTRATION ----------------------");
	            RequestDispatcher view = request.getRequestDispatcher("userhome.jsp");
	            view.forward(request, response);
	            System.out.print("Record Updated");
	        } else {
	            // If the username does not exist, show an error message
	            RequestDispatcher view = request.getRequestDispatcher("registration_failed.jsp");
	            view.forward(request, response);
	            System.out.print("Record Not Updated");
	        }
	    } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
	        System.out.print(e);
	    }
	    System.out.println("-------------------------------INSIDE REGISTRATION ----------------------");
	}
	
	  @Override
	    public String getServletInfo() {
	        return "Short description";
	    }// </editor-fold>

}
