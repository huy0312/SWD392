package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            User user = userDAO.loginUser(email, password);
            if (user != null) {
                if (!user.isVerified()) {
                    response.sendRedirect("login.jsp?error=not_verified"); 
                    return;
                }
                HttpSession session = request.getSession(); 
                session.setAttribute("user", user);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("login.jsp?error=invalid");
            }
        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false); 
            if (session != null) {
                session.invalidate(); 
            }
            response.sendRedirect("login.jsp?logout=1");
        }
    }
}
