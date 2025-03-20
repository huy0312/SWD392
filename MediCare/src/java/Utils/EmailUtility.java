package Utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtility {
    private static final String SMTP_HOST = "smtp.mailtrap.io";  // Máy chủ Mailtrap
    private static final String SMTP_PORT = "587";  // Cổng SMTP (hoặc 2525)
    private static final String SMTP_USERNAME = "174f281765992f";  // Nhập Username từ Mailtrap
    private static final String SMTP_PASSWORD = "099c1e1263edd5";  // Nhập Password từ Mailtrap
    private static final String FROM_EMAIL = "noreply@webmed.com";

    public static void sendVerificationEmail(String recipientEmail, String verificationLink) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.trust", SMTP_HOST);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Xác nhận tài khoản WebMed");
            message.setText("Chào bạn,\n\n"
                    + "Vui lòng click vào đường link dưới đây để xác nhận tài khoản của bạn:\n"
                    + verificationLink + "\n\n"
                    + "Cảm ơn bạn đã đăng ký WebMed!");

            Transport.send(message);
            System.out.println("✅ Email đã được gửi thành công qua Mailtrap!");

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("❌ Lỗi khi gửi email: " + e.getMessage());
        }
    }
}
