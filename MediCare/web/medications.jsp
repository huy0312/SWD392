<%@ page import="java.util.List" %>
<%@ page import="Model.Medication" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách thuốc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> 
    <style>
        .cart-icon {
            position: relative;
            color: white;
            font-size: 20px;
        }
        .cart-badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 3px 7px;
            font-size: 14px;
        }
        .btn-cart {
            margin-top: auto;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">💊 Danh sách thuốc</h2>
    <hr>

    <!-- Hiển thị giỏ hàng trên Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">WebMed</a>
            <div class="ms-auto">
                <a href="cart.jsp" class="cart-icon">
                    <i class="fa fa-shopping-cart"></i>
                    <span id="cart-count" class="cart-badge"><%= session.getAttribute("cartCount") != null ? session.getAttribute("cartCount") : "0" %></span>
                </a>
            </div>
        </div>
    </nav>

    <div class="row" id="medication-list">
        <%
            List<Medication> meds = (List<Medication>) request.getAttribute("medications");
            if (meds != null && !meds.isEmpty()) {
                for (Medication med : meds) {
        %>
        <div class="col-md-4 medication-item">
            <div class="card shadow-sm mb-4">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title"><%= med.getName() %></h5>
                    <p class="card-text"><strong>Mô tả:</strong> <%= med.getDescription() %></p>
                    <p class="card-text"><strong>Giá:</strong> <%= med.getPrice() %> VND</p>
                    <p class="card-text"><strong>Còn lại:</strong> <%= med.getStockQuantity() %></p>
                    <button class="btn btn-primary btn-cart" onclick="addToCart(<%= med.getId() %>, '<%= med.getName() %>', <%= med.getPrice() %>)">
                        <i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng
                    </button>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-md-12 text-center">
            <p class="text-muted">Không có dữ liệu thuốc.</p>
        </div>
        <%
            }
        %>
    </div>

</div>

<script>
    function addToCart(id, name, price) {
        fetch("CartController?action=add&id=" + id + "&name=" + encodeURIComponent(name) + "&price=" + price)
            .then(response => response.text())
            .then(data => {
                document.getElementById("cart-count").innerText = data;
                alert("✅ Đã thêm " + name + " vào giỏ hàng!");
            });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
