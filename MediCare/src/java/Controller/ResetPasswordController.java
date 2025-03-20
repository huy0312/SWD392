/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Huy Nguyen
 */
@WebServlet("/ResetPasswordController")
public class ResetPasswordController extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (email == null || newPassword == null || !newPassword.equals(confirmPassword)) {
            response.sendRedirect("reset-password.jsp?email=" + email + "&error=1");
            return;
        }

        boolean updated = userDAO.updatePasswordByEmail(email, newPassword);

        if (updated) {
            response.sendRedirect("login.jsp?reset_success=1");
        } else {
            response.sendRedirect("reset-password.jsp?email=" + email + "&error=1");
        }
    }
}
