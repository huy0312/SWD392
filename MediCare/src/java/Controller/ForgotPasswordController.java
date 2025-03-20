package Controller;

import DAO.UserDAO;
import Utils.EmailUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/ForgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String email = request.getParameter("email");

        if (!userDAO.isEmailExists(email)) {
            response.sendRedirect("forgot-password.jsp?error=not_found");
            return;
        }

        // Gửi link đặt lại mật khẩu (dùng email đơn giản trên URL)
        String resetLink = "http://localhost:8080/MediCare/reset-password.jsp?email=" + email;

        EmailUtility.sendResetEmail(email, resetLink);

        response.sendRedirect("forgot-password.jsp?success=1");
    }
}
