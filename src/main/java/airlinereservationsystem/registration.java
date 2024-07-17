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

public class registration extends HttpServlet {

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
            int count=0;
            Class.forName("oracle.jdbc.driver.OracleDriver");  
		 conn=DriverManager.getConnection(  
			"jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net","tech4","Nalsoft123"); 
            System.out.println("connected!.....");
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String countryCode = request.getParameter("countryCode");
            String phno = request.getParameter("phno");
            String email_address = request.getParameter("email_address");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String gender = request.getParameter("gender");
            String pincode = request.getParameter("pincode");
            String mobileno = "+"+countryCode+" "+phno;
            
            HttpSession session = request.getSession();
            session.setAttribute("fullname", fullname);
            int min = 12069;      
            int max = 94099;
            int userid = (int)(Math.random()*(max-min+1)+min);
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM user_details WHERE username='"+username+"'");
            while(rs.next()){
                count++;
            }
            if(count>0){
                RequestDispatcher view = request.getRequestDispatcher("error.jsp");
                view.forward(request, response);
                System.out.print("Record NOt Inserted");
            }
            else{
            	int i = st.executeUpdate("INSERT INTO user_details (fullname, username, password, mobileno, email_address, city, state, pincode, gender, userid) " +
                        "values('" + fullname + "','" + username + "','" + password + "', '" + mobileno + "', '" + email_address + "', '" + city + "', '" + state + "', '" + pincode + "', '" + gender + "', '" + userid + "')");
                System.out.println("-------------------------------INSIDE REGISTRATION ----------------------");
                RequestDispatcher view = request.getRequestDispatcher("login_u.jsp");
                view.forward(request, response);
                System.out.print("Record Inserted");
            }
        }
        catch(IOException | ClassNotFoundException  | SQLException | ServletException e){
            System.out.print(e);
        }  
        System.out.println("-------------------------------INSIDE REGISTRATION ----------------------");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

