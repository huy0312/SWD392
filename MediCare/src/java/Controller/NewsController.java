package Controller;

import DAO.NewsDAO;
import Model.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/NewsController")
public class NewsController extends HttpServlet {
    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<News> newsList = newsDAO.getAllNews();
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }
}