<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">🛒 Giỏ hàng</h2>
    <hr>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tên thuốc</th>
                <th>Giá</th>
                <th>Số lượng</th>
            </tr>
        </thead>
        <tbody>
            <%
                Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    for (Map.Entry<Integer, Map<String, Object>> entry : cart.entrySet()) {
                        Map<String, Object> item = entry.getValue();
            %>
            <tr>
                <td><%= item.get("name") %></td>
                <td><%= item.get("price") %> VND</td>
                <td><%= item.get("quantity") %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="3" class="text-center">🛒 Giỏ hàng trống!</td></tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="medications.jsp" class="btn btn-primary">🔙 Tiếp tục mua hàng</a>
</div>

</body>
</html>
