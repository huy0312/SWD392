/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MedicationDAO;
import Model.Medication;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Huy Nguyen
 */
@WebServlet("/MedicationController")
public class MedicationController extends HttpServlet {
    private MedicationDAO medicationDAO = new MedicationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Medication> medicationList = medicationDAO.getAllMedications();
        request.setAttribute("medications", medicationList);
        request.getRequestDispatcher("/medications.jsp").forward(request, response);
    }
}
