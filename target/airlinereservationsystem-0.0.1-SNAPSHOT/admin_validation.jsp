<%@ page import ="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
    try {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net","tech4","Nalsoft123");

        PreparedStatement pst = conn.prepareStatement("SELECT admin_name, admin_pass FROM admin_log WHERE admin_name=? AND admin_pass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

       <
// Authentication logic
     if (rs.next()) {
    // If user exists, set session attribute and redirect to the original URL
    String adminName = rs.getString("admin_name");
    session.setAttribute("admin_name", adminName);
    
    // Retrieve the original URL from the session attribute
    String originalURL = (String) session.getAttribute("originalURL");
    if (originalURL != null) {
        // Redirect back to the original URL
        response.sendRedirect(originalURL);
    } else {
        // If the original URL is not available, redirect to a default page
        response.sendRedirect("adminhome.jsp");
    }
} else {
    // If user does not exist, redirect back to the admin login page
    response.sendRedirect("login_a.jsp");
}


        conn.close();
    } catch(SQLException e) {
       e.printStackTrace();
       response.sendRedirect("error.jsp");
    } catch(Exception e) {
       e.printStackTrace();
       response.sendRedirect("error.jsp");
    }
%>
