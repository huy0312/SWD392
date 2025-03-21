package Controller;

import DAO.UserDAO;
import Model.User;
import Model.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        boolean updateSuccess = userDAO.updateUserProfile(userId, name, phone);

        if ("PATIENT".equals(user.getRole())) {
            String dateOfBirth = request.getParameter("dateOfBirth");
            String address = request.getParameter("address");
            updateSuccess = userDAO.updatePatientProfile(userId, dateOfBirth, phone, address);
        }

        // Đổi mật khẩu (Kiểm tra mật khẩu cũ)
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword != null && !newPassword.isEmpty()) {
            if (!userDAO.checkPassword(userId, currentPassword)) {
                response.sendRedirect("edit-profile.jsp?error=wrong_password");
                return;
            }
            if (!newPassword.equals(confirmPassword)) {
                response.sendRedirect("edit-profile.jsp?error=password_mismatch");
                return;
            }
            updateSuccess = userDAO.updatePassword(userId, newPassword);
        }

        session.setAttribute("user", user);

        if (updateSuccess) {
            response.sendRedirect("edit-profile.jsp?success=1");
        } else {
            response.sendRedirect("edit-profile.jsp?error=1");
        }
    }
}
