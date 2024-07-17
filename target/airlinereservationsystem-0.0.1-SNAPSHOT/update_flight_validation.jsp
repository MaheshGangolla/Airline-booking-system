<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*,java.text.*"%>
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
<%
try {
    // Get parameters and trim any leading/trailing spaces
    String flight_id = request.getParameter("flight_Id").trim();
    String flight_no = request.getParameter("flight_no").trim();
    String flight_name = request.getParameter("flight_name").trim();
    String from_city = request.getParameter("from_city").trim();
    String to_city = request.getParameter("to_city").trim();
    String date_of_flight = request.getParameter("date_of_flight").trim();
    String flight_arrival_time = request.getParameter("flight_arrival_time").trim();
    String flight_reach_time = request.getParameter("flight_reach_time").trim();
    String first_class_seat = request.getParameter("first_class_seat").trim();
    String buss_class_seat = request.getParameter("buss_class_seat").trim();
    String eco_class_seat = request.getParameter("eco_class_seat").trim();
    String first_class_price = request.getParameter("first_class_price").trim();
    String buss_class_price = request.getParameter("buss_class_price").trim();
    String eco_class_price = request.getParameter("eco_class_price").trim();

    // Calculate duration
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
    Date date1 = simpleDateFormat.parse(flight_arrival_time);
    Date date2 = simpleDateFormat.parse(flight_reach_time);
    long differenceInMilliSeconds = Math.abs(date2.getTime() - date1.getTime());
    long differenceInHours = (differenceInMilliSeconds / (60 * 60 * 1000)) % 24;
    long differenceInMinutes = (differenceInMilliSeconds / (60 * 1000)) % 60;
    long differenceInSeconds = (differenceInMilliSeconds / 1000) % 60;
    String duration = differenceInHours + ":" + differenceInMinutes + ":" + differenceInSeconds;

    // Database connection
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
    Statement st = conn.createStatement();

    // Query to get existing booked seats
    String bookedSeatsQuery = "SELECT first_class_seat_booked, buss_class_seat_booked, eco_class_seat_booked FROM flight_details WHERE flight_id = '" + flight_id + "'";
    ResultSet bookedSeatsResult = st.executeQuery(bookedSeatsQuery);
    int firstClassBooked = 0;
    int bussClassBooked = 0;
    int ecoClassBooked = 0;
    if (bookedSeatsResult.next()) {
        firstClassBooked = bookedSeatsResult.getInt("first_class_seat_booked");
        bussClassBooked = bookedSeatsResult.getInt("buss_class_seat_booked");
        ecoClassBooked = bookedSeatsResult.getInt("eco_class_seat_booked");
    }

    // Calculate seats available
    int firstClassAvailable = Integer.parseInt(first_class_seat) - firstClassBooked;
    int bussClassAvailable = Integer.parseInt(buss_class_seat) - bussClassBooked;
    int ecoClassAvailable = Integer.parseInt(eco_class_seat) - ecoClassBooked;

    // Update query
    String sql = "UPDATE flight_details SET " +
                 "from_city = '" + from_city + "', " +
                 "to_city = '" + to_city + "', " +
                 "date_of_flight = '" + date_of_flight + "', " +
                 "flight_arrival_time = '" + flight_arrival_time + "', " +
                 "flight_reach_time = '" + flight_reach_time + "', " +
                 "duration = '" + duration + "', " +
                 "first_class_seat = " + first_class_seat + ", " +
                 "first_class_seat_aval = " + firstClassAvailable + ", " +
                 "buss_class_seat = " + buss_class_seat + ", " +
                 "buss_class_seat_aval = " + bussClassAvailable + ", " +
                 "eco_class_seat = " + eco_class_seat + ", " +
                 "eco_class_seat_aval = " + ecoClassAvailable + ", " +
                 "first_class_price = " + first_class_price + ", " +
                 "buss_class_price = " + buss_class_price + ", " +
                 "eco_class_price = " + eco_class_price + " " +
                 "WHERE flight_id = '" + flight_id + "' " +
                 "AND flight_no = '" + flight_no + "' " +
                 "AND flight_name = '" + flight_name + "'";

    // Print SQL statement for debugging
    System.out.println(sql);

    int i = st.executeUpdate(sql);
    System.out.println("Rows affected: " + i);
    if (i > 0) {
        response.sendRedirect("flight_update_success.jsp");
    } else {
        response.sendRedirect("flight_update_failed.jsp");
    }
} catch(Exception e) {
    e.printStackTrace();  // Print stack trace for debugging
    response.sendRedirect("flight_update_failed.jsp");
}
%>
