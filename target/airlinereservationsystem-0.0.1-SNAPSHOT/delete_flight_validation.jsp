<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Check if the session is not created
    if (session.getAttribute("admin_name") == null) {
        // Redirect to login.jsp
        String originalURL = request.getRequestURI();
        session.setAttribute("originalURL", originalURL);
        response.sendRedirect("login_a.jsp");
        // End processing this JSP
        return;
    }
%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*,java.text.*"%>
<%
try {
    String flight_id=request.getParameter("flight_Id");
    String flight_no=request.getParameter("flight_no");
    String flight_name=request.getParameter("flight_name");

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net","tech4","Nalsoft123");
System.out.println("inside delete");
    String deleteQuery = "DELETE FROM flight_details WHERE flight_id=? AND flight_no=? AND flight_name=?";
    System.out.println("id"+flight_id);
    System.out.println("no"+flight_no);
    System.out.println("name"+flight_name);
    
    PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
    pstmt.setString(1, flight_id);
    pstmt.setString(2, flight_no);
    pstmt.setString(3, flight_name);
    
    int rowsAffected = pstmt.executeUpdate();
    
    if(rowsAffected > 0) {
        response.sendRedirect("delete_validation_success.jsp");
    } else {
        response.sendRedirect("delete_validation_failed.jsp");
    }

} catch(Exception e) {
    response.sendRedirect("delete_validation_failed.jsp");
}
%>
tml>