package DAO;

import Model.News;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {
    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT id, title, content, author, published_at FROM News ORDER BY published_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                News news = new News(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getString("author"),
                    rs.getTimestamp("published_at")
                );
                newsList.add(news);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return newsList;
    }
}
