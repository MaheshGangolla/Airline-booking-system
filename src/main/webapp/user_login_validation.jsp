<%@ page import ="java.sql.*" %>

<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("oracle.jdbc.driver.OracleDriver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net","tech4","Nalsoft123");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from user_details where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
           String U_name=request.getParameter("username");
           session.setAttribute("username",U_name);
           response.sendRedirect("home.jsp");
        }       
        else
           response.sendRedirect("login_u.jsp");            
   }
   catch(Exception e){       
       response.sendRedirect("error.jsp");       
   }      
%>