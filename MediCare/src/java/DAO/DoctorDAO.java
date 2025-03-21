package DAO;

import Model.Doctor;
import Model.User;
import java.sql.*;

public class DoctorDAO {

    public Doctor getDoctorByUserId(int userId) {
        String sql = "SELECT * FROM Doctors WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Doctor(
                        rs.getInt("id"),
                        new User(userId, null, null, null, "DOCTOR", true),
                        rs.getString("specialization"),
                        rs.getInt("experience_years"),
                        rs.getString("hospital")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateDoctorProfile(Doctor doctor) {
        String sql = "UPDATE Doctors SET specialization = ?, experience_years = ?, hospital = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, doctor.getSpecialization());
            stmt.setInt(2, doctor.getExperienceYears());
            stmt.setString(3, doctor.getHospital());
            stmt.setInt(4, doctor.getUser().getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
