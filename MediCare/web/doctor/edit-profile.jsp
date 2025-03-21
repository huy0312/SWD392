<%@ page import="Model.Doctor, Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    Doctor doctor = (Doctor) request.getAttribute("doctor");

    if (user == null || doctor == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa hồ sơ bác sĩ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3>Chỉnh sửa hồ sơ cá nhân</h3>
    <% if (request.getAttribute("update_success") != null) { %>
    <div class="alert alert-success">
        ✅ <%= request.getAttribute("update_success") %>
    </div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        ❌ <%= request.getAttribute("error") %>
    </div>
<% } %>


    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">Có lỗi xảy ra khi cập nhật!</div>
    <% } %>

    <form action="<%= request.getContextPath() %>/DoctorProfileController" method="post">
        <div class="mb-3">
            <label>Chuyên môn:</label>
            <input type="text" class="form-control" name="specialization" value="<%= doctor.getSpecialization() %>" required>
        </div>

        <div class="mb-3">
            <label>Kinh nghiệm (năm):</label>
            <input type="number" class="form-control" name="experienceYears" value="<%= doctor.getExperienceYears() %>" required>
        </div>

        <div class="mb-3">
            <label>Bệnh viện:</label>
            <input type="text" class="form-control" name="hospital" value="<%= doctor.getHospital() %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="<%= request.getContextPath() %>/doctor/doctor-dashboard.jsp" class="btn btn-secondary">Quay lại</a>

    </form>
</div>
</body>
</html>
