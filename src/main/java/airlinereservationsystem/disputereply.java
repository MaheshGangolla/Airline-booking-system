package airlinereservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReplyServlet")
public class disputereply extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public disputereply() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("name");
        String userDispute = request.getParameter("issue");
        String adminReply = request.getParameter("reply");
        String date = request.getParameter("date");
        String type = request.getParameter("type");
        String pnr = request.getParameter("pnr");
 
        // Get the email address of the user from the user_details table using the username
        String userEmail = getUserEmailFromDatabase(username);

        // Prepare the email content
        String subject = "Reply to Your Dispute";
        if (userEmail != null) {
            // Send the email
            sendEmail(userEmail, subject, createMailContent(username,type,pnr,userDispute,date,adminReply));
            System.out.println("Email sent successfully to: " + userEmail);
        } else {
            // Handle the case where user email is not found
            System.out.println("User email not found for username: " + username);
        }

        // Optionally, you can redirect the user to a confirmation page
        response.sendRedirect("confirmation.jsp");
    }


    private String getUserEmailFromDatabase(String username) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String userEmail = null;
     
        try {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
          
            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
            System.out.println("Connected to database...");

            // Prepare SQL query
            String sql = "SELECT email_address FROM user_details WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            
            // Set the username parameter
            stmt.setString(1, username.trim());

            // Execute the query
            rs = stmt.executeQuery();

            // Retrieve the email address if found
            if (rs.next()) {
                userEmail = rs.getString("email_address");
                System.out.println("Email address found for username " + username + ": " + userEmail);
            } else {
                System.out.println("No email address found for username: " + username);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions appropriately
            }
        }

        return userEmail;
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
    
    private String createMailContent(String username,String seatType, String pnr, String issue, String dateOfFlight, String adminReply) {
        String content = "<html><head></head><body style=\"font-family: Arial, sans-serif;\">" +
                "<div style=\"max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; background-color: #f9f9f9;\">" +
                "<div style=\"background-color: #007bff; color: #fff; padding: 10px 0; text-align: center; border-radius: 5px 5px 0 0;\"><h2>Flight Dispute Resolution</h2></div>" +
                "<div style=\"padding: 20px 0;\">" +
                "<p><strong>Dear</strong> " + username + "</p>" +
                "<p>We acknowledge your recent dispute regarding your flight with us.</p>" +
                "<p>Here are the details of your dispute:</p>" +
                "<ul>" +
                "<li><strong>Seat Type:</strong> " + seatType + "</li>" +
                "<li><strong>PNR:</strong> " + pnr + "</li>" +
                "<li><strong>Issue:</strong> " + issue + "</li>" +
                "<li><strong>Date of Flight:</strong> " + dateOfFlight + "</li>" +
                "</ul>" +
                "<p><br/><span>"+"We apologize for any inconvenience you may have experienced. " + adminReply + "</span></p>" +
                "<p>Thank you for your patience and understanding.</p>" +
                "<p>Best regards,<br/>Customer Service Team - AirLine Systems</p>" +
                "</div>" +
                "<div style=\"background-color: #f0f0f0; padding: 10px 0; text-align: center; border-radius: 0 0 5px 5px;\">Hope we resolved you issue,else feel free to contact</div>" +
                "</div></body></html>";

        return content;
    }

}
