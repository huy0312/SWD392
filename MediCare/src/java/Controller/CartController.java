package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));

            if (cart.containsKey(id)) {
                int newQuantity = (int) cart.get(id).get("quantity") + 1;
                cart.get(id).put("quantity", newQuantity);
            } else {
                Map<String, Object> item = new HashMap<>();
                item.put("name", name);
                item.put("price", price);
                item.put("quantity", 1);
                cart.put(id, item);
            }
        }

        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.size());

        response.getWriter().write(String.valueOf(cart.size()));
    }
}
