<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cho Thuê Phòng Trọ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            animation: fadeIn 1s;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            position: relative;
        }
        .login-btn {
            position: absolute;
            top: 10px;
            right: 20px;
        }
        .header-buttons {
            position: absolute;
            top: 10px;
            left: 20px;
            display: flex;
            gap: 10px;
        }
        .carousel-inner img {
            border-radius: 10px;
            max-height: 300px;
            object-fit: cover;
        }
        .room-list .card {
            transition: transform 0.3s ease-in-out;
        }
        .room-list .card:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        footer {
            background: #343a40;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<header>
    <div class="header-buttons">
        <button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#aboutModal">Giới thiệu</button>
        <button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#contactModal">Liên hệ</button>
    </div>
    <h1>Cho Thuê Phòng Trọ</h1>
    <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-light btn-sm login-btn">Đăng Nhập</a>
</header>

<section class="container my-4">
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://xaydungaau.com/wp-content/uploads/2023/12/luu-y-thiet-ke-noi-that-phong-tro-an.jpg" class="d-block w-100" alt="Banner Khuyến Mãi">
            </div>
            <div class="carousel-item">
                <img src="https://xaydungaau.com/wp-content/uploads/2023/12/thiet-ke-noi-that-phong-tro-an-tuong-tien-nghi.jpg" class="d-block w-100" alt="Banner Khuyến Mãi">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
    <div class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-success btn-lg">Thuê Phòng</a>
    </div>
</section>

<div class="container mt-5">
    <h2 class="text-center text-primary">Danh Sách Phòng Trọ</h2>
    <div class="row room-list">
        <div class="col-md-4">
            <div class="card">
                <img src="https://i-connect.com.vn/data/news/7046/anh-2-phong-tro-rong.jpg" class="card-img-top" alt="Phòng Trọ">
                <div class="card-body">
                    <h5 class="card-title">Phòng Trọ 20m²</h5>
                    <p class="card-text">Giá: 3.500.000 VND/tháng</p>
                    <p>Tiện nghi đầy đủ, gần trung tâm.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="https://i-connect.com.vn/data/news/7046/anh-32-vach-ngan-phong-tro-thong-minh-da-nang.jpg" class="card-img-top" alt="Phòng Trọ">
                <div class="card-body">
                    <h5 class="card-title">Phòng Trọ 25m²</h5>
                    <p class="card-text">Giá: 4.200.000 VND/tháng</p>
                    <p>Ban công rộng, khu an ninh.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="https://bandon.vn/uploads/posts/thiet-ke-nha-tro-dep-2020-bandon-0.jpg" class="card-img-top" alt="Phòng Trọ">
                <div class="card-body">
                    <h5 class="card-title">Phòng Trọ 30m²</h5>
                    <p class="card-text">Giá: 5.000.000 VND/tháng</p>
                    <p>Máy lạnh, wifi miễn phí.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Giới thiệu -->
<div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="aboutModalLabel">Giới thiệu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Chào mừng bạn đến với dịch vụ cho thuê phòng trọ của chúng tôi! Chúng tôi cung cấp các phòng trọ tiện nghi, giá cả hợp lý, phù hợp với nhiều nhu cầu khác nhau. Được quản lý bởi Nguyễn Danh Trường, mục tiêu của chúng tôi là mang đến sự thoải mái và hài lòng cho khách hàng.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Liên hệ -->
<div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contactModalLabel">Liên hệ</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="list-unstyled">
                    <li><strong>Hotline:</strong> 0797475264</li>
                    <li><strong>Email:</strong> nguyendanhtruong@example.com</li>
                    <li><strong>Địa chỉ:</strong> 123 Đường ABC, Quận XYZ, TP.HCM</li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>© Nguyễn Danh Trường . Hotline: 0797475264</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>