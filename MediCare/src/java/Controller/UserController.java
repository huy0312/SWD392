package Controller;

import DAO.UserDAO;
import Model.User;
import Utils.EmailUtility;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = "PATIENT";

            User user = new User(0, name, email, password, role, false);
            if (userDAO.registerUser(user)) {

                String verificationLink = "http://localhost:8080" + request.getContextPath() + "/UserController?action=verify&email=" + email;
                EmailUtility.sendVerificationEmail(email, verificationLink);
                response.sendRedirect(request.getContextPath() + "/check-email.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/register.jsp?error=1");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("verify".equals(action)) {
            String email = request.getParameter("email");

            if (userDAO.isUserVerified(email)) {
                response.sendRedirect(request.getContextPath() + "/login.jsp?already_verified=1");
                return;
            }

            if (userDAO.verifyUser(email)) {
                response.sendRedirect(request.getContextPath() + "/login.jsp?verified=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/verify-failed.jsp");
            }
        }
    }
}
