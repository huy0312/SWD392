package DAO;

import Model.Patient;
import Model.User;
import java.sql.*;

public class PatientDAO {

    public Patient getPatientByUserId(int userId) {
        String sql = "SELECT * FROM Patients WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Patient(
                    rs.getInt("id"),
                    new User(userId, null, null, null, "PATIENT", true),
                    rs.getString("date_of_birth"),
                    rs.getString("phone"),
                    rs.getString("address")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updatePatientProfile(Patient patient) {
        String sql = "UPDATE Patients SET date_of_birth = ?, phone = ?, address = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, patient.getDateOfBirth());
            stmt.setString(2, patient.getPhone());
            stmt.setString(3, patient.getAddress());
            stmt.setInt(4, patient.getUser().getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updatePatientName(int userId, String name) {
    String sql = "UPDATE Users SET name = ? WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, name);
        stmt.setInt(2, userId);
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

}
