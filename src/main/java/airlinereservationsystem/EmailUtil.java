package airlinereservationsystem;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailUtil {

    private static final String USER_NAME = "airtestmailing@gmail.com";  // GMail user name
    private static final String PASSWORD = "kdakrxeaktdjxrot"; // GMail password (no spaces)

    public static void sendEmail(String to, String subject, String body) {
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", USER_NAME);
        props.put("mail.smtp.password", PASSWORD);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(USER_NAME));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", USER_NAME, PASSWORD);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}

