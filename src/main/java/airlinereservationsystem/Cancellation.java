package airlinereservationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Cancellation extends HttpServlet {

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
    	  HttpSession session = request.getSession(false);
          if (session.getAttribute("username") == null) {
              response.sendRedirect("login_u.jsp");
              // End processing this JSP
              return;
          }
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        Connection con = null;

        // Retrieve PNR number and other details from the form
        String PNR = request.getParameter("PNR");
        String noSeats = request.getParameter("noseats");
        String ticketType = request.getParameter("type");

        // Retrieve username from the session
       
        String username = (String) session.getAttribute("username");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
            System.out.println("Connected!");

            // Retrieve flight ID from booking_details
            String selectQuery = "SELECT flight_id FROM booking_details WHERE PNR = ? AND username = ?";
            PreparedStatement selectStmt = con.prepareStatement(selectQuery);
            selectStmt.setString(1, PNR);
            selectStmt.setString(2, username);
            ResultSet rs = selectStmt.executeQuery();

            if (rs.next()) {
                String flightId = rs.getString("flight_id");

                // Update the seat counts in the flight_details table based on the ticket type
                String updateFlightQuery = "";
                if ("First Class".equalsIgnoreCase(ticketType)) {
                    updateFlightQuery = "UPDATE flight_details SET first_class_seat_booked = first_class_seat_booked - ?, first_class_seat_aval = first_class_seat_aval + ? WHERE flight_id = ?";
                } else if ("Business Class".equalsIgnoreCase(ticketType)) {
                    updateFlightQuery = "UPDATE flight_details SET buss_class_seat_booked = buss_class_seat_booked - ?, buss_class_seat_aval = buss_class_seat_aval + ? WHERE flight_id = ?";
                } else if ("Coach Class".equalsIgnoreCase(ticketType)) {
                    updateFlightQuery = "UPDATE flight_details SET eco_class_seat_booked = eco_class_seat_booked - ?, eco_class_seat_aval = eco_class_seat_aval + ? WHERE flight_id = ?";
                }

                // Update the booking status to 'CANCELLED' in the booking_details table
                String updateBookingQuery = "UPDATE booking_details SET status = 'CANCELLED' WHERE PNR = ? AND username = ?";
                PreparedStatement updateBookingStmt = con.prepareStatement(updateBookingQuery);
                updateBookingStmt.setString(1, PNR);
                updateBookingStmt.setString(2, username);
                int rowsUpdated = updateBookingStmt.executeUpdate();

                // Update the payment status to 'REFUNDED' in the payment_details table
                String updatePaymentQuery = "UPDATE payment_details SET payment_status = 'REFUNDED' WHERE PNR = ?";
                PreparedStatement updatePaymentStmt = con.prepareStatement(updatePaymentQuery);
                updatePaymentStmt.setString(1, PNR);
                int paymentRowsUpdated = updatePaymentStmt.executeUpdate();

                PreparedStatement updateFlightStmt = con.prepareStatement(updateFlightQuery);
                updateFlightStmt.setString(1, noSeats);
                updateFlightStmt.setString(2, noSeats);
                updateFlightStmt.setString(3, flightId);
                int flightRowsUpdated = updateFlightStmt.executeUpdate();

                if (rowsUpdated > 0 && paymentRowsUpdated > 0 && flightRowsUpdated > 0) {
                    // Fetch additional details for the email
                    String sqlQuery = "SELECT b.username, b.flight_no,b.departure,b.destination, b.date_of_flight, b.no_of_seats, b.ticket_type, p.payment_gateway, b.adults, b.child, b.PNR, u.email_address, p.actual_fair, p.transaction_id "
                            + "FROM booking_details b "
                            + "INNER JOIN payment_details p ON b.PNR = p.PNR "
                            + "INNER JOIN user_details u ON b.username = u.username "
                            + "WHERE p.PNR = ?";
                    PreparedStatement detailsStmt = con.prepareStatement(sqlQuery);
                    detailsStmt.setString(1, PNR);
                    ResultSet detailsRs = detailsStmt.executeQuery();

                    if (detailsRs.next()) {
                        String flightNumber = detailsRs.getString("flight_no");
                        String dateOfFlight = detailsRs.getString("date_of_flight");
                        int noOfSeats = detailsRs.getInt("no_of_seats");
                        String gateway = detailsRs.getString("payment_gateway");
                        int adults = detailsRs.getInt("adults");
                        int child = detailsRs.getInt("child");
                        String email = detailsRs.getString("email_address");
                        String actualFair = detailsRs.getString("actual_fair");
                        String tid = detailsRs.getString("transaction_id");
                        String departure = detailsRs.getString("departure");
                        String destination = detailsRs.getString("destination");

                        sendEmail(email, "Booking Cancellation", buildEmailContent(username, PNR, flightNumber, dateOfFlight, noOfSeats, ticketType, gateway, adults, child, actualFair, tid,departure,destination));
                    }

                    System.out.println("Booking status updated to CANCELLED and payment status updated to REFUNDED for PNR: " + PNR + " and username: " + username);
                    response.sendRedirect("cancellationpage.jsp");
                } else {
                    System.out.println("No booking found with PNR: " + PNR + " and username: " + username);
                    response.sendRedirect("cancel_failed.jsp");
                }
            } else {
                System.out.println("No booking found with PNR: " + PNR + " and username: " + username);
                response.sendRedirect("cancel_failed.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cancel_failed.jsp");
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
        final String password = "kdak rxea ktdj xrot "; // Use your actual email and app password

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

    private String buildEmailContent(String username, String PNRNumber, String flightNumber, String dateOfFlight, int noOfSeats, String ticketType, String gateway, int adults, int child, String actual_fair, String tid, String Departure, String Destination) {
        return "<html><body>" +
                "<p style='text-align: left;'>Dear " + username + ",</p>" +
                "<p style='text-align: center;'>Your booking has been Cancelled Here are the details:</p>" +
                "<table border='1' cellpadding='5' cellspacing='0' style='margin: 0 auto; border-collapse: collapse;'>" +
                "<tr style='background-color: #f2f2f2;'>" +
                "<th style='padding: 8px;'>Booking ID (PNR)</th>" +
                "<th style='padding: 8px;'>Flight Number</th>" +
                "<th style='padding: 8px;'>Departure</th>" +
                "<th style='padding: 8px;'>Destination</th>" +
                "<th style='padding: 8px;'>Date of Flight</th>" +
                "<th style='padding: 8px;'>Number of Seats</th>" +
                "<th style='padding: 8px;'>Ticket Type</th>" +
                "<th style='padding: 8px;'>Payment Gateway</th>" +
                "<th style='padding: 8px;'>Adults</th>" +
                "<th style='padding: 8px;'>Children</th>" +
                "<th style='padding: 8px;'>Total Fare</th>" +
                "<th style='padding: 8px;'>Transaction ID</th>" +

                "</tr>" +
                "<tr>" +
                "<td style='padding: 8px;'>" + PNRNumber + "</td>" +
                "<td style='padding: 8px;'>" + flightNumber + "</td>" +
                "<td style='padding: 8px;'>" + Departure + "</td>" +
                "<td style='padding: 8px;'>" + Destination + "</td>" +
                "<td style='padding: 8px;'>" + dateOfFlight + "</td>" +
                "<td style='padding: 8px;'>" + noOfSeats + "</td>" +
                "<td style='padding: 8px;'>" + ticketType + "</td>" +
                "<td style='padding: 8px;'>" + gateway + "</td>" +
                "<td style='padding: 8px;'>" + adults + "</td>" +
                "<td style='padding: 8px;'>" + child + "</td>" +
                "<td style='padding: 8px;'>" + actual_fair + "</td>" +
                "<td style='padding: 8px;'>" + tid + "</td>" +
             
                "</tr>" +
                "</table>" +
                "<p style='text-align: center; font-weight: bold;'>Thank you for choosing us.</p>" +
                "</body></html>";
    }


    @Override
    public String getServletInfo() {
        return "Servlet for cancelling booking and updating status to CANCELLED";
    }
}
