<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="col-md-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Quên mật khẩu</h3>

                    <% if (request.getParameter("success") != null) { %>
                        <div class="alert alert-success">Chúng tôi đã gửi một email đặt lại mật khẩu. Vui lòng kiểm tra hộp thư của bạn!</div>
                    <% } %>

                    <% if (request.getParameter("error") != null) { 
                        if (request.getParameter("error").equals("not_found")) { %>
                            <div class="alert alert-danger">Email không tồn tại trong hệ thống!</div>
                    <%  } else if (request.getParameter("error").equals("server_error")) { %>
                            <div class="alert alert-danger">Lỗi hệ thống! Vui lòng thử lại sau.</div>
                    <%  } } %>

                    <form action="ForgotPasswordController" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Nhập email của bạn:</label>
                            <input type="email" class="form-control" id="email" name="email" required placeholder="Nhập email của bạn">
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                        </div>
                    </form>

                    <p class="text-center mt-3"><a href="login.jsp">Quay lại đăng nhập</a></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
