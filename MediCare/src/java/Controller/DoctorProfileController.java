package Controller;

import DAO.DoctorDAO;
import Model.Doctor;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DoctorProfileController")
public class DoctorProfileController extends HttpServlet {

    private DoctorDAO doctorDAO = new DoctorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"DOCTOR".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Doctor doctor = doctorDAO.getDoctorByUserId(user.getId());

        if (doctor == null) {
            response.sendRedirect(request.getContextPath() + "/doctor/dashboard.jsp?error=no_doctor");
            return;
        }

        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("/doctor/edit-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"DOCTOR".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String specialization = request.getParameter("specialization");
        int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
        String hospital = request.getParameter("hospital");

        // Cập nhật thông tin bác sĩ
        Doctor doctor = new Doctor();
        doctor.setUser(user);
        doctor.setSpecialization(specialization);
        doctor.setExperienceYears(experienceYears);
        doctor.setHospital(hospital);

        boolean success = doctorDAO.updateDoctorProfile(doctor);

        if (success) {
      
            Doctor updatedDoctor = doctorDAO.getDoctorByUserId(user.getId());
            request.setAttribute("doctor", updatedDoctor);

     
            request.setAttribute("update_success", "Hồ sơ đã được cập nhật thành công!");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi cập nhật hồ sơ!");
        }

       
        request.getRequestDispatcher("/doctor/edit-profile.jsp").forward(request, response);
    }
}
