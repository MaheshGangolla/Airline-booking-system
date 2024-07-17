package airlinereservationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class user_booking_final_check extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Connection con = null;

        String address = request.getParameter("address");

        HttpSession session = request.getSession(false);
        String PNR = (String) session.getAttribute("PNR");
        String actual_fair = (String) session.getAttribute("ff");
        String tid = (String) session.getAttribute("tid");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
            System.out.println("connected!.....user booking final check");

            // Update payment status as paid
            String updateQuery = "UPDATE payment_details SET payment_status = 'paid', pdate = SYSDATE, payment_gateway ='RazorPay', address = ? WHERE PNR = ?";
            PreparedStatement updateStmt = con.prepareStatement(updateQuery);
            updateStmt.setString(1, address);
            updateStmt.setString(2, PNR);
            updateStmt.executeUpdate();
            System.out.println("Payment status updated to paid for PNR: " + PNR);

            String updateBookingQuery = "UPDATE booking_details SET status = 'CONFIRMED' WHERE PNR = ?";
            PreparedStatement updateBookingStmt = con.prepareStatement(updateBookingQuery);
            updateBookingStmt.setString(1, PNR);
            updateBookingStmt.executeUpdate();
            System.out.println("Booking status updated to CONFIRMED for PNR: " + PNR);

            // Fetch booking details along with user email
            String sqlQuery = "SELECT b.departure, b.destination, b.username, b.flight_no, b.date_of_flight, b.no_of_seats, b.ticket_type, p.payment_gateway, b.adults, b.child, b.PNR, b.seatno, u.email_address, f.flight_name, f.flight_arrival_time, f.flight_reach_time, f.duration, pd.name, pd.age, pd.gender, pd.mobile FROM booking_details b INNER JOIN payment_details p ON b.PNR = p.PNR INNER JOIN user_details u ON b.username = u.username INNER JOIN flight_details f ON b.flight_id = f.flight_id INNER JOIN passenger_details pd ON b.bookingid = pd.booking_id WHERE p.PNR = ?";




            PreparedStatement pstmt = con.prepareStatement(sqlQuery);
            pstmt.setString(1, PNR);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("name");
                System.out.println("fsdf");
                String flightNumber = rs.getString("flight_no");
                String dateOfFlight = rs.getString("date_of_flight");
                int noOfSeats = rs.getInt("no_of_seats");
                String ticketType = rs.getString("ticket_type");
                String gateway = rs.getString("payment_gateway");
                int adults = rs.getInt("adults");
                int child = rs.getInt("child");
                String PNRNumber = rs.getString("PNR");
                String email = rs.getString("email_address"); // Fetch email_address from the result set
                String Departure = rs.getString("Departure");
                String arrivaltime = rs.getString("flight_arrival_time");
                String reachtime = rs.getString("flight_reach_time");
                String duration = rs.getString("duration");
                String Destination = rs.getString("Destination");
                String fname = rs.getString("flight_name");
                String age = rs.getString("age");
                String gender = rs.getString("gender");
                String mobile = rs.getString("mobile");
                String name = rs.getString("name");
                String seatNo = rs.getString("seatno");
                String triptype=(String) session.getAttribute("triptype");

                // Log the email to check if it's null
                System.out.println("Fetched email: " + email);

                if (email == null || email.trim().isEmpty()) {
                    System.out.println("Email address is null or empty, skipping email sending.");
                } else {
                    request.setAttribute("gateway1", gateway);
                    request.setAttribute("username", username);
                    request.setAttribute("flightNumber", flightNumber);
                    request.setAttribute("dateOfFlight", dateOfFlight);
                    request.setAttribute("noOfSeats", noOfSeats);
                    request.setAttribute("ticketType", ticketType);
                    request.setAttribute("adults", adults);
                    request.setAttribute("child", child);
                    request.setAttribute("PNRNumber", PNRNumber);
                    request.setAttribute("actual_fair", actual_fair);
                    request.setAttribute("tid", tid);
                    request.setAttribute("fname", fname);

                    // Send email with booking details
                    sendEmail(email, "Booking Confirmation", buildEmailContent(username, PNRNumber, flightNumber, dateOfFlight, noOfSeats, ticketType, gateway, adults, child, actual_fair, tid,Departure,Destination,fname));
                    sendEmail(email,"BordingPass",generateEmailContent( name,  Departure,  Destination,  flightNumber,  dateOfFlight,  seatNo,  arrivaltime,  reachtime,  duration, PNRNumber,triptype));
                }

                RequestDispatcher view = request.getRequestDispatcher("payment_success.jsp");
                view.forward(request, response);
            } else {
                RequestDispatcher view = request.getRequestDispatcher("payment_failed.jsp");
                view.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            RequestDispatcher view = request.getRequestDispatcher("payment_failed.jsp");
            view.forward(request, response);
        } finally {
            out.close();
            try {
                if (con != null) {
                    con.close();
                    System.out.println("Disconnected!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void sendEmail(String to, String subject, String content) {
    	
    	 String from = "airtestmailing@GMAIL.COM";
         final String username = "airtestmailing@GMAIL.COM";
         final String password = "kdak rxea ktdj xrot ";

        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(content, "text/html"); 

            Transport.send(message);
            System.out.println("Sent message successfully....");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    
    private String generateEmailContent(String name, String departure, String destination, String flightNumber, String dateOfFlight, String seatNo, String arrivalTime, String reachTime, String duration, String PNRNumber,String triptype) {
        return "<!DOCTYPE html>"
            + "<html lang='en'>"
            + "<head>"
            + "<meta charset='utf-8'>"
            + "<meta name='viewport' content='width=device-width, initial-scale=1'>"
            + "<title>Airline Ticket</title>"
            + "</head>"
            + "<body style='font-family: Arial, sans-serif; background-color: #f2f2f2; padding: 20px; margin: 0;'>"
            + "<div style='max-width: 450px; margin: auto; background: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);'>"
            + "<header style='background: #0073e6; color: #ffffff; text-align: center; padding: 15px 0;'>"
            + "<h1 style='margin: 0; font-size: 20px;'>Boarding Pass</h1>"
            + "<p style='margin: 0; font-size: 14px;'>Airline Ticket</p>"
            + "</header>"
            + "<div style='padding: 15px;'>"
            + "<h2 style='margin-top: 0; color: #0073e6; font-size: 18px;'>Flight Details</h2>"
            + "<p><strong>From:</strong> " + departure + "</p>"
            + "<p><strong>To:</strong> " + destination + "</p>"
            + "<p><strong>Flight:</strong> " + flightNumber + "</p>"
            + "<p><strong>Date:</strong> " + dateOfFlight + "</p>"
            + "</div>"
            + "<div style='background: #f9f9f9; padding: 15px;'>"
            + "<h2 style='margin-top: 0; color: #0073e6; font-size: 18px;'>Schedule</h2>"
            + "<p><strong>Boards:</strong> " + arrivalTime + "</p>"
            + "<p><strong>Departs:</strong> " + reachTime + "</p>"
            + "<p><strong>Duration:</strong> <span id='formattedDuration'>" + duration+" Hours" + "</span></p>"
            + "</div>"
            + "<div style='padding: 15px;'>"
            + "<h2 style='margin-top: 0; color: #0073e6; font-size: 18px;'>Passenger Information</h2>"
            + "<p><strong>Passenger:</strong> " + name + "</p>"
            + "<p><strong>Seat:</strong> " + seatNo + "</p>"
            + "<p><strong>PNR Number:</strong> " + PNRNumber + "</p>"
             + "<p><strong>Trip:</strong> " + triptype + "</p>"
            + "</div>"
            + "<footer style='background: #0073e6; color: #ffffff; text-align: center; padding: 10px 0;'>"
            + "<p style='margin: 0; font-size: 12px;'>Thank you for choosing our airline!</p>"
            + "</footer>"
            + "</div>"
            + "<script>"
            + "function formatDuration(duration) {"
            + "    var parts = duration.split(':');"
            + "    var hours = parseInt(parts[0], 10);"
            + "    var minutes = parseInt(parts[1], 10);"
            + "    return hours + ' hours ' + minutes + ' minutes';"
            + "}"
            + "document.getElementById('formattedDuration').textContent = formatDuration('" + duration + "');"
            + "</script>"
            + "</body>"
            + "</html>";
    }









    private String buildEmailContent(String username, String PNRNumber, String flightNumber, String dateOfFlight, int noOfSeats, String ticketType, String gateway, int adults, int child, String actual_fair, String tid, String departure, String destination,String fname) {
        return "<html>\r\n" +
                "    <head>\r\n" +
                "        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css' integrity='sha512-N/6z7H5POMIMjB+OMaQ6hqAHcZ26ZpjrJjDqY7o19smzUguIrBsoaGJztyeJwov7EEM5+6b60lSsyuETQc/jFw==' crossorigin='anonymous' referrerpolicy='no-referrer' />\r\n" +
                "    </head>\r\n" +
                "    <body>\r\n" +
                "        <div style='font-family: Arial, sans-serif;'>\r\n" +
                "            <div style='border: 1px solid #ccc; border-radius: 10px; padding: 10px; width: fit-content; margin: 0 auto; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);'>\r\n" +
                "                <div style='font-size: 16px; font-weight: bold; margin-bottom: 20px; text-align: center;'>Booking Confirmation</div>\r\n" +
                "                <div style='margin-bottom: 10px;'><span style='font-weight: bold;'>Passenger:</span> " + username + "</div>\r\n" +
                "                <div style='margin-bottom: 10px;'><span style='font-weight: bold;'>PNR:</span> " + PNRNumber + "</div>\r\n" +
                "                <div style='margin-bottom: 10px;'><span style='font-weight: bold;'>Departure:</span> " + departure + "</div>\r\n" +
                "                <div style='margin-bottom: 10px;'><span style='font-weight: bold;'>Destination:</span> " + destination + "</div>\r\n" +
                "                <div style='margin-bottom: 10px;'><span style='font-weight: bold;'>Date of Flight:</span> " + dateOfFlight + "</div>\r\n" +
                "           <div style='margin-bottom: 10px;'><span style='font-weight: bold;'>Flight Name:</span> " + fname + "</div>\r\n" +
                "            </div>\r\n" +
                "            <table style='width: 800px;height:80px; margin: 20px auto; padding:20px;border-collapse: collapse; border: 1px solid #ccc;'>\r\n" +
                "                <tr style='background-color: #89898c;'>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Seats</th>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Type</th>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Gateway</th>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Adults</th>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Children</th>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Fare</th>\r\n" +
                "                    <th style='padding: 8px; border: 1px solid #ccc;'>Transaction ID</th>\r\n" +
                "                <tr>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + noOfSeats + "</td>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + ticketType + "</td>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + gateway + "</td>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + adults + "</td>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + child + "</td>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + actual_fair + "</td>\r\n" +
                "                    <td style='padding: 8px; border: 1px solid #ccc;'>" + tid + "</td>\r\n" +
                "                </tr>\r\n" +
                "            </table>\r\n" +
                "            <div style='text-align: center; font-weight: bold; margin-top: 20px;'>Thank you for choosing us.</div>\r\n" +
                "        </div>\r\n" +
                "    </body>\r\n" +
                "</html>";
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
