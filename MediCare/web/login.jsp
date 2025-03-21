<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="col-md-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Đăng nhập</h3>

                    <% if (request.getParameter("error") != null) { 
                        if (request.getParameter("error").equals("invalid")) { %>
                            <div class="alert alert-danger">Email hoặc mật khẩu không đúng!</div>
                    <%  } else if (request.getParameter("error").equals("not_verified")) { %>
                            <div class="alert alert-warning">Tài khoản chưa được xác thực. Vui lòng kiểm tra email của bạn!</div>
                    <%  } } %>

                    <% if (request.getParameter("logout") != null) { %>
                        <div class="alert alert-success">Bạn đã đăng xuất thành công.</div>
                    <% } %>

                    <% if (request.getParameter("reset_success") != null) { %>
                        <div class="alert alert-success">Mật khẩu của bạn đã được đặt lại thành công. Hãy đăng nhập bằng mật khẩu mới!</div>
                    <% } %>

                    <form action="LoginController" method="post">
                        <input type="hidden" name="action" value="login">

                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required placeholder="Nhập email của bạn">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu:</label>
                            <input type="password" class="form-control" id="password" name="password" required placeholder="Nhập mật khẩu">
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="forgot-password.jsp" class="text-decoration-none">Quên mật khẩu?</a>
                        </div>

                        <div class="d-grid mt-3">
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </div>
                    </form>

                    <p class="text-center mt-3">Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
