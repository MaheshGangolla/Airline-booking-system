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


public class Search_By_PNR_u extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");

        String pnr = request.getParameter("pnr");
        System.out.println("sent pnr "+pnr);
        if(pnr == null || pnr.equals("")){
            RequestDispatcher error = request.getRequestDispatcher("error.jsp");
            error.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        }
        else{
        	   System.out.println(pnr);
        	   String query = "SELECT b.*, NVL(p.payment_status, 'Not paid') AS payment_status, p.pdate,f.flight_name, p.fair, b.status AS booking_status, f.flight_id " +
                       "FROM flight_details f " +
                       "JOIN booking_details b ON f.flight_id = b.flight_id " +
                       "JOIN payment_details p ON b.PNR = p.PNR " +
                       "WHERE b.PNR = ?";


        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, pnr);

        rs = pstmt.executeQuery();
      
        ArrayList<ArrayList<String>> flightDetailsList = new ArrayList<>();
     
        while (rs.next()) {
            ArrayList<String> flightDetails = new ArrayList<>();
            for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                flightDetails.add(rs.getString(i));
            }
            flightDetailsList.add(flightDetails);
        }
       
        request.setAttribute("flightDetailsList", flightDetailsList);
        System.out.println("reached page");
        System.out.println(flightDetailsList);
        RequestDispatcher view = request.getRequestDispatcher("SearchByPNR_u.jsp");
        view.forward(request, response);
    }} catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}}
