<%@ page import="Model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ - WebMed</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">WebMed</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="HealthAZServlet">🩺 Health A-Z</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="FinanceServlet">💰 Finance</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/MedicationController">💊 Danh sách thuốc</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="FeedbackServlet">📝 Feedback</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AppointmentServlet">📅 Đặt lịch khám</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="NewsServlet">📰 Tin tức</a>
                    </li>

                    <!-- Nút "Sửa hồ sơ" CHỈ HIỂN THỊ nếu user là Patient -->
                    <% if ("PATIENT".equals(user.getRole())) { %>
                    <li class="nav-item">
                        <a class="nav-link text-warning fw-bold" href="<%= request.getContextPath() %>/PatientProfileController">
                            ✏️ Sửa hồ sơ
                        </a>
                    </li>
                    <% } %>

                    <!-- Biểu tượng giỏ hàng -->
                    <li class="nav-item">
                        <a class="nav-link position-relative" href="cart.jsp">
                            <i class="fa fa-shopping-cart"></i> 🛒 Giỏ hàng
                            <span id="cart-count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                <%= session.getAttribute("cartCount") != null ? session.getAttribute("cartCount") : "0" %>
                            </span>
                        </a>
                    </li>

                    <!-- Nút Logout -->
                    <li class="nav-item">
                        <form action="<%= request.getContextPath() %>/LoginController" method="post" class="d-inline">
                            <input type="hidden" name="action" value="logout">
                            <button type="submit" class="btn btn-danger ms-2">Đăng xuất</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Nội dung chính -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12 text-center">
                <h2>Chào mừng bạn đến WebMed!</h2>
                <p class="lead">Xin chào, <strong><%= user.getName() %></strong>!</p>
                <p>Email: <%= user.getEmail() %></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
