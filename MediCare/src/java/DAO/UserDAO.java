/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Huy Nguyen
 */
import Model.User;
import java.sql.*;
import java.util.UUID;

public class UserDAO {

    public boolean registerUser(User user) {
        String sql = "INSERT INTO Users (name, email, password, role, is_verified) VALUES (?, ?, ?, ?, 0)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole() != null ? user.getRole() : "PATIENT");
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean verifyUser(String email) {
        String sql = "UPDATE Users SET is_verified = 1 WHERE email = ? AND is_verified = 0"; // Chỉ cập nhật nếu chưa xác thực
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("✅ Tài khoản " + email + " đã được xác thực!");
                return true;
            } else {
                System.out.println("❌ Không có dòng nào được cập nhật. Có thể tài khoản đã xác thực hoặc không tồn tại.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isUserVerified(String email) {
        String sql = "SELECT is_verified FROM Users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("is_verified");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM Users WHERE email = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                boolean isVerified = rs.getObject("is_verified") != null && rs.getBoolean("is_verified");
                return new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role"),
                        isVerified
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
