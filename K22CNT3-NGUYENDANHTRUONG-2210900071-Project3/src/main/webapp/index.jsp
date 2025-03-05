<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý phòng trọ</title>

    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        /* Tùy chỉnh thêm CSS */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 15px;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }
        nav ul li {
            margin-right: 20px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .dashboard, .actions {
            background: white;
            padding: 20px;
            margin: 20px 0;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .stat-item {
            padding: 15px;
            background: #007bff;
            color: white;
            text-align: center;
            border-radius: 5px;
        }
        .btn {
            margin: 10px;
        }
        footer {
            text-align: center;
            padding: 15px;
            background: #343a40;
            color: white;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="d-flex justify-content-between align-items-center px-4">
    <div class="logo">Quản lý phòng trọ</div>
    <nav>
        <ul class="d-flex">
            <li><a href="#" class="active">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/phongtro/list">Quản Lý Phòng Trọ</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/khachthue/list">Khách thuê</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/hoadon/list">Hóa đơn</a></li>
            <li><a href="${pageContext.request.contextPath}/thongke/thongke">Thống Kê</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/dashboard">Admin</a></li>

            <li><a href="#">Đăng xuất</a></li>
        </ul>
    </nav>
</header>

<!-- Main Content -->
<main class="container">
    <!-- Dashboard -->
    <section class="dashboard">
        <h2 class="text-primary">Tổng quan</h2>
        <div class="row text-center">
            <div class="col-md-4">
                <div class="stat-item">
                    <h3>Tổng số phòng</h3>
                    <p>20</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-item bg-success">
                    <h3>Phòng trống</h3>
                    <p>5</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-item bg-danger">
                    <h3>Phòng đang thuê</h3>
                    <p>15</p>
                </div>
            </div>
        </div>
        <div class="finance mt-4 p-3 border rounded bg-light">
            <h3 class="text-secondary">Tài chính tháng này</h3>
            <p><strong>Tổng tiền:</strong> 10,000,000 VND</p>
            <p><strong>Đã thu:</strong> 8,000,000 VND</p>
            <p><strong>Chưa thu:</strong> 2,000,000 VND</p>
        </div>
    </section>

    <!-- Quick Actions -->
    <section class="actions text-center">
        <h2 class="text-primary">Thao tác nhanh</h2>
        <button class="btn btn-primary">Thêm phòng mới</button>
        <button class="btn btn-success">Thêm khách thuê</button>
        <button class="btn btn-warning">Tạo hóa đơn</button>
    </section>
</main>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Quản lý phòng trọ. All rights reserved.</p>
    <p>Liên hệ: <a href="mailto:support@example.com" class="text-light">support@example.com</a></p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>