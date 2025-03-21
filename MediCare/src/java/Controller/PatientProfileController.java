package Controller;

import DAO.PatientDAO;
import Model.Patient;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/PatientProfileController")
public class PatientProfileController extends HttpServlet {
    private PatientDAO patientDAO = new PatientDAO();

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null || !"PATIENT".equals(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");  // ✅ Sửa lại đường dẫn login
        return;
    }

    Patient patient = patientDAO.getPatientByUserId(user.getId());
    
    if (patient == null) {
        response.sendRedirect(request.getContextPath() + "/patient/dashboard.jsp?error=no_patient");
        return;
    }

    request.setAttribute("patient", patient);
    request.getRequestDispatcher("/patient/edit-profile.jsp").forward(request, response);
}


    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null || !"PATIENT".equals(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");  // ✅ Sửa lại đường dẫn login
        return;
    }

    String name = request.getParameter("name");
    String dateOfBirth = request.getParameter("dateOfBirth");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    // Cập nhật thông tin bệnh nhân
    Patient patient = new Patient();
    patient.setUser(user);
    patient.setDateOfBirth(dateOfBirth);
    patient.setPhone(phone);
    patient.setAddress(address);

    // Cập nhật lại name vào session nếu đổi
    user.setName(name);
    boolean success1 = patientDAO.updatePatientProfile(patient);
    boolean success2 = patientDAO.updatePatientName(user.getId(), name);

    if (success1 || success2) {
        session.setAttribute("user", user); // cập nhật session
        response.sendRedirect(request.getContextPath() + "/patient/dashboard.jsp?update_success=1");
    } else {
        response.sendRedirect(request.getContextPath() + "/patient/edit-profile.jsp?error=1");
    }
}

}
