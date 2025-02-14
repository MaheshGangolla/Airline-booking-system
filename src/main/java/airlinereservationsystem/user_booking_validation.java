package airlinereservationsystem;
import java.lang.Math;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class user_booking_validation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("-------------------------------INSIDE USER_BOOKING_VALIDATION_CHECK ----------------------");
        PrintWriter out = response.getWriter();
        Connection con = null;
     
        Statement st=null;    
        
        int min = 11069;      
        int max = 99099;
        String PNR = "PNR00"+(int)(Math.random()*(max-min+1)+min);
        
     
        int Bookingid = (int)(Math.random()*(max-min+5)+min);
        int paymentid = (int)(Math.random()*(max-min+10)+min);
        int passengerId = (int)(Math.random()*(max-min+6)+min);
        Random rnd = new Random();
        char a = (char) ('a' + rnd.nextInt(26));
        char b = (char) ('a' + rnd.nextInt(26));
        char c = (char) ('a' + rnd.nextInt(26));
        char A = Character.toUpperCase(a);
        char B = Character.toUpperCase(b);
        char C = Character.toUpperCase(c);
        String transaction_id = "XX"+a+B+c+"YY"+(int)(Math.random()*(max-min+1)+min)+C+b+A;    
        System.out.println(1);
        String username=request.getParameter("username");   
        System.out.println("fdf"+username);
        
        String flight_id=request.getParameter("flight_id");  
        System.out.println(3);
        String flight_No=request.getParameter("flight_No");  
        System.out.println(4);
        String ticket_type=request.getParameter("ticket_type");    
        System.out.println(5);
        String date_of_flight=request.getParameter("date_of_flight");  
        System.out.println(6);
        String departure = request.getParameter("Departure"); // Add departure
        System.out.println(7);
        String destination = request.getParameter("destination"); // Add destination
        System.out.println(8);
        String adults1=request.getParameter("adults");
        System.out.println(9);
        int adults=Integer.parseInt(adults1);   
        
        String no_of_seats1=request.getParameter("noOfPassengers");   
        System.out.println(91);
        System.out.println("dfsf"+no_of_seats1);
        int no_of_seats=Integer.parseInt(no_of_seats1);
        System.out.println(92);
        int child = no_of_seats - adults;
        System.out.println(93);
        String pname=request.getParameter("pname");
        System.out.println(94);
        String mobile=request.getParameter("mobile");
        System.out.println(95);
        String email=request.getParameter("email");
        System.out.println(96);
        String gender=request.getParameter("gender");
        System.out.println(97);
        int age=Integer.parseInt(request.getParameter("age"));
        String coupon=request.getParameter("coupon");
        System.out.println(98);
      
        
        
        System.out.println("departure: "+destination);
        System.out.println("adults: "+adults);
        System.out.println("child: "+child);
        System.out.println("no_of_seats: "+no_of_seats);
            
        HttpSession session = request.getSession();
        session.setAttribute("pnrno", PNR);
        session.setAttribute("no_of_seats", no_of_seats);
        session.setAttribute("ticket_type", ticket_type);
        session.setAttribute("tid", transaction_id);
        System.out.println("tidv"+transaction_id);
        System.out.println(ticket_type);
        System.out.println(no_of_seats);
        String triptype=(String) session.getAttribute("triptype");
        double discountPercentage=0;
        
        try    
        {    
        	 Class.forName("oracle.jdbc.driver.OracleDriver");  
    		 con=DriverManager.getConnection(  
    			"jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net","tech4","Nalsoft123"); 
            System.out.println("connected!.....");
            if (coupon != null && !coupon.isEmpty()) {
                // If the coupon value is provided, check it in the coupon table
                String checkCouponQuery = "SELECT DISCOUTNPERCENTAGE FROM coupon_table WHERE cname = ?";
                PreparedStatement checkCouponStmt = con.prepareStatement(checkCouponQuery);
                checkCouponStmt.setString(1, coupon);
                ResultSet couponResult = checkCouponStmt.executeQuery();
                
                if (couponResult.next()) {
                    // If the coupon exists, apply the discount
                    discountPercentage = couponResult.getDouble("DISCOUTNPERCENTAGE");
                    // Calculate the new ticket amount after applying the discount
                    session.setAttribute("discount", discountPercentage);
                } else {
                    // If the coupon does not exist, display an error message
                	discountPercentage=0;
                	  session.setAttribute("discount", discountPercentage);
                }}
            String checkUserQuery = "SELECT * FROM user_details WHERE username = ?";
            PreparedStatement checkUserStmt = con.prepareStatement(checkUserQuery);
            checkUserStmt.setString(1, username);
            ResultSet userResult = checkUserStmt.executeQuery();
            
            if (!userResult.next()) {
                // If the username doesn't exist, display an error message
                out.println("Invalid username. Please try again.");
                con.close();
                return; // Exit the method
            }
            if(null != ticket_type)switch (ticket_type) {
                case "Business Class":
                	
                    int bs_valid=0;
                    String query_for_bs = "SELECT buss_class_seat_aval FROM flight_details WHERE flight_id = ? AND date_of_flight = ? ";
                    PreparedStatement pstmt_bs=con.prepareStatement(query_for_bs);
                    pstmt_bs.setString(1,flight_id);
                    pstmt_bs.setString(2,date_of_flight);
                    ResultSet rst = pstmt_bs.executeQuery();
                    
                    while(rst.next()){
                        bs_valid = rst.getInt(1);
                        }
                    
                    
                    
                    if(no_of_seats > bs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                        
                    }
                    else{
                    
                        int fair_1=1;
                        String cost_1 = "SELECT buss_class_price FROM flight_details WHERE flight_id = ?";
                        PreparedStatement cst1_ps=con.prepareStatement(cost_1);
                        cst1_ps.setString(1, flight_id);
                        ResultSet rst_cst1 = cst1_ps.executeQuery();
                    
                        while(rst_cst1.next()){
                            fair_1 = rst_cst1.getInt(1);
                        }
                        
                        int ff_1 = fair_1 * no_of_seats;
                        if ("roundtrip".equals(triptype)) {
                            ff_1 *= 2;
                        }
                        if (discountPercentage != 0) {
                        ff_1= (int) (ff_1-(ff_1 * (discountPercentage / 100.0)));}
                        
                        String bff =String.valueOf(ff_1);
                        String ff=  bff ;
                    
                        HttpSession ses=request.getSession();
                        ses.setAttribute("ff",ff);
                        String seatno='B'+String.valueOf(bs_valid);
                        String query = "INSERT INTO booking_details (username, flight_no, date_of_flight, departure, destination, no_of_seats, ticket_type, adults, child, PNR, flight_id, sLdate,status,bookingid,seatno,triptype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE,'NOT CONFIRMED',?,?,?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, username);
                        pstmt.setString(2, flight_No);
                        pstmt.setString(3, date_of_flight);
                        pstmt.setString(4, departure);
                        pstmt.setString(5, destination);
                        pstmt.setInt(6, no_of_seats);
                        pstmt.setString(7, ticket_type);
                        pstmt.setInt(8, adults);
                        pstmt.setInt(9, child);
                        pstmt.setString(10, PNR);
                        pstmt.setString(11, flight_id);
                        pstmt.setInt(12, Bookingid);
                        pstmt.setString(13, seatno);
                        pstmt.setString(14, triptype);
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            System.out.println("Values Inserted Successfully");
                        }
                        String passengerInsertQuery = "INSERT INTO passenger_details (passenger_id, booking_id, name, mobile, age, gender) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement passengerStmt = con.prepareStatement(passengerInsertQuery);
                        passengerStmt.setInt(1, passengerId);
                        passengerStmt.setInt(2, Bookingid);
                        passengerStmt.setString(3, pname);
                        passengerStmt.setString(4, mobile);
                        passengerStmt.setInt(5, age);
                        passengerStmt.setString(6, gender);
                        int passengerInsert = passengerStmt.executeUpdate();
                        if (passengerInsert == 1) {
                            System.out.println("Passenger details inserted successfully.");
                        }
                        
                        String update_bs = "UPDATE flight_details SET buss_class_seat_booked = buss_class_seat_booked + ?, buss_class_seat_aval = buss_class_seat_aval - ? WHERE flight_id = ? AND date_of_flight = ? ";
                        PreparedStatement pst_up_bs=con.prepareStatement(update_bs);
                        pst_up_bs.setInt(1,no_of_seats);
                        pst_up_bs.setInt(2,no_of_seats);
                        pst_up_bs.setString(3,flight_id);
                        pst_up_bs.setString(4,date_of_flight);
                        
                        int y=pst_up_bs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully To Flight Details");
                        }
                        
                      
                        
                        String pay_q_bs="Insert into payment_details (PNR, transaction_id, address, payment_gateway, fair, coupon, discount, actual_fair,payment_id) values (?, ?, ?, ?, ?, ?, ?, ?,?)";
                        PreparedStatement pay_ps_bs =con.prepareStatement(pay_q_bs);
                        pay_ps_bs.setString(1, PNR);
                        pay_ps_bs.setString(2, transaction_id);
                        pay_ps_bs.setString(3, "NULL");
                        pay_ps_bs.setString(4, "NULL");
                        pay_ps_bs.setInt(5, ff_1);
                        pay_ps_bs.setString(6, "NULL");
                        pay_ps_bs.setInt(7, 0);
                        pay_ps_bs.setInt(8, ff_1);
                        pay_ps_bs.setInt(9, paymentid);
                        int pay_bs=pay_ps_bs.executeUpdate();
                        if(pay_bs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }   break;
                case "First Class":
                    
                    int fair_2=1;
                        String cost_2 = "SELECT first_class_price FROM flight_details WHERE flight_id = ?";
                        PreparedStatement cst2_ps=con.prepareStatement(cost_2);
                        cst2_ps.setString(1, flight_id);
                        ResultSet rst_cst2 = cst2_ps.executeQuery();
                    
                        while(rst_cst2.next()){
                            fair_2 = rst_cst2.getInt(1);
                        }
                        
                        int ff_2 = fair_2 * no_of_seats;
                        if ("roundtrip".equals(triptype)) {
                            ff_2 *= 2;
                        }
                        if (discountPercentage != 0) {
                        	ff_2= (int) (ff_2-(ff_2 * (discountPercentage / 100.0)));}
                        
                        String fff =String.valueOf(ff_2);
                        String ff=  fff ;
                        
                        HttpSession ses=request.getSession();
                        ses.setAttribute("ff",ff);
                       
                    
                    int fs_valid=0;
                    String query_for_fs = "SELECT first_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                    PreparedStatement pstmt_fs=con.prepareStatement(query_for_fs);
                    pstmt_fs.setString(1,flight_id);
                    //ResultSet rst = null;
                    ResultSet rst1 = pstmt_fs.executeQuery();
                    
                    while(rst1.next()){
                        fs_valid = rst1.getInt(1);
                    }
                    
                    if(no_of_seats > fs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                    }
                    else{
                    	 String seatno='F'+String.valueOf(fs_valid);
                        String query = "INSERT INTO booking_details (username, flight_no, date_of_flight, departure, destination, no_of_seats, ticket_type, adults, child, PNR, flight_id, sLdate,status,bookingid,seatno,triptype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE,'NOT CONFIRMED',?,?,?)";
                    	PreparedStatement pstmt=con.prepareStatement(query);
                    	 pstmt.setString(1, username);
                         pstmt.setString(2, flight_No);
                         pstmt.setString(3, date_of_flight);
                         pstmt.setString(4, departure);
                         pstmt.setString(5, destination);
                         pstmt.setInt(6, no_of_seats);
                         pstmt.setString(7, ticket_type);
                         pstmt.setInt(8, adults);
                         pstmt.setInt(9, child);
                         pstmt.setString(10, PNR);
                         pstmt.setString(11, flight_id);
                         pstmt.setInt(12, Bookingid);
                         pstmt.setString(13, seatno);
                         pstmt.setString(14, triptype);
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            out.println("Values Inserted Successfully");
                        }
                        String passengerInsertQuery = "INSERT INTO passenger_details (passenger_id, booking_id, name, mobile, age, gender) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement passengerStmt = con.prepareStatement(passengerInsertQuery);
                        passengerStmt.setInt(1, passengerId);
                        passengerStmt.setInt(2, Bookingid);
                        passengerStmt.setString(3, pname);
                        passengerStmt.setString(4, mobile);
                        passengerStmt.setInt(5, age);
                        passengerStmt.setString(6, gender);
                        int passengerInsert = passengerStmt.executeUpdate();
                        if (passengerInsert == 1) {
                            System.out.println("Passenger details inserted successfully.");
                        }
                        
                        String update_fs = "UPDATE flight_details SET first_class_seat_booked = first_class_seat_booked + ?, first_class_seat_aval = first_class_seat_aval - ? WHERE flight_id = ? AND date_of_flight = ? ";
                        PreparedStatement pst_up_fs=con.prepareStatement(update_fs);
                        pst_up_fs.setInt(1,no_of_seats);
                        pst_up_fs.setInt(2,no_of_seats);
                        pst_up_fs.setString(3,flight_id);
                        pst_up_fs.setString(4,date_of_flight);
                        
                        int y=pst_up_fs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully");
                        }
                        
                        String pay_q_fs="Insert into payment_details (PNR, transaction_id, address, payment_gateway, fair, coupon, discount, actual_fair,payment_id) values (?, ?, ?, ?, ?, ?, ?, ?,?)";
                        PreparedStatement pay_ps_fs =con.prepareStatement(pay_q_fs);
                        pay_ps_fs.setString(1, PNR);
                        pay_ps_fs.setString(2, transaction_id);
                        pay_ps_fs.setString(3, "NULL");
                        pay_ps_fs.setString(4, "NULL");
                        pay_ps_fs.setInt(5, ff_2);
                        pay_ps_fs.setString(6, "NULL");
                        pay_ps_fs.setInt(7, 0);
                        pay_ps_fs.setInt(8, ff_2);
                        pay_ps_fs.setInt(9, paymentid);
                        int pay_fs=pay_ps_fs.executeUpdate();
                        if(pay_fs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }break;
                    
                case "Coach Class":
                    int fair_3=1;
                        String cost_3 = "SELECT eco_class_price FROM flight_details WHERE flight_id = ?";
                        PreparedStatement cst3_ps=con.prepareStatement(cost_3);
                        cst3_ps.setString(1, flight_id);
                        ResultSet rst_cst3 = cst3_ps.executeQuery();
                    
                        while(rst_cst3.next()){
                            fair_3 = rst_cst3.getInt(1);
                        }
                        
                        int ff_3 = fair_3 * no_of_seats;
                        if ("roundtrip".equals(triptype)) {
                        	ff_3 *= 2;
                        }
                        if (discountPercentage != 0) {
                        	ff_3= (int) (ff_3-(ff_3 * (discountPercentage / 100.0)));}
                        String eff =String.valueOf(ff_3);
                        String eeff= eff; 
                        
                        HttpSession sess=request.getSession();
                        sess.setAttribute("ff",eeff);
                    
                    int cs_valid=0;
                    String query_for_cs = "SELECT eco_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                    PreparedStatement pstmt_cs=con.prepareStatement(query_for_cs);
                    pstmt_cs.setString(1,flight_id);
                    //ResultSet rst = null;
                    ResultSet rst2 = pstmt_cs.executeQuery();
                    
                    while(rst2.next()){
                        cs_valid = rst2.getInt(1);
                    }
                    
                    if(no_of_seats > cs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                    }
                    else{
                    	 String seatno='F'+String.valueOf(cs_valid);
                        String query = "INSERT INTO booking_details (username, flight_no, date_of_flight, departure, destination, no_of_seats, ticket_type, adults, child, PNR, flight_id, sLdate,status,bookingid,seatno,triptype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE,'NOT CONFIRMED',?,?,?)";
                    	PreparedStatement pstmt=con.prepareStatement(query);
                    	 pstmt.setString(1, username);
                         pstmt.setString(2, flight_No);
                         pstmt.setString(3, date_of_flight);
                         pstmt.setString(4, departure);
                         pstmt.setString(5, destination);
                         pstmt.setInt(6, no_of_seats);
                         pstmt.setString(7, ticket_type);
                         pstmt.setInt(8, adults);
                         pstmt.setInt(9, child);
                         pstmt.setString(10, PNR);
                         pstmt.setString(11, flight_id);
                         pstmt.setInt(12, Bookingid);
                         pstmt.setString(5, seatno);
                         pstmt.setString(14, triptype);
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            out.println("Values Inserted Successfully");
                        }
                        String passengerInsertQuery = "INSERT INTO passenger_details (passenger_id, booking_id, name, mobile, age, gender) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement passengerStmt = con.prepareStatement(passengerInsertQuery);
                        passengerStmt.setInt(1, passengerId);
                        passengerStmt.setInt(2, Bookingid);
                        passengerStmt.setString(3, pname);
                        passengerStmt.setString(4, mobile);
                        passengerStmt.setInt(5, age);
                        passengerStmt.setString(6, gender);
                        int passengerInsert = passengerStmt.executeUpdate();
                        if (passengerInsert == 1) {
                            System.out.println("Passenger details inserted successfully.");
                        }
                        
                        String update_cs = "UPDATE flight_details SET eco_class_seat_booked = eco_class_seat_booked + ?, eco_class_seat_aval = eco_class_seat_aval - ? WHERE flight_id = ? AND date_of_flight = ? ";
                        PreparedStatement pst_up_cs=con.prepareStatement(update_cs);
                        pst_up_cs.setInt(1,no_of_seats);
                        pst_up_cs.setInt(2,no_of_seats);
                        pst_up_cs.setString(3,flight_id);
                        pst_up_cs.setString(4,date_of_flight);
                        
                        int y=pst_up_cs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully");
                        }
                        
                        String pay_q_cs="Insert into payment_details (PNR, transaction_id, address, payment_gateway, fair, coupon, discount, actual_fair,payment_id) values (?, ?, ?, ?, ?, ?, ?, ?,?)";
                        PreparedStatement pay_ps_cs =con.prepareStatement(pay_q_cs);
                        pay_ps_cs.setString(1, PNR);
                        pay_ps_cs.setString(2, transaction_id);
                        pay_ps_cs.setString(3, "NULL");
                        pay_ps_cs.setString(4, "NULL");
                        pay_ps_cs.setInt(5, ff_3);
                        pay_ps_cs.setString(6, "NULL");
                        pay_ps_cs.setInt(7, 0);
                        pay_ps_cs.setInt(8, ff_3);
                        pay_ps_cs.setInt(9, paymentid);
                        int pay_cs=pay_ps_cs.executeUpdate();
                        if(pay_cs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }break;
                default:
                    break;
            }
            
         
           System.out.println("-------------------------------INSIDE USER_BOOKING_VALIDATION_CHECK ----------------------");    
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        out.close();
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}