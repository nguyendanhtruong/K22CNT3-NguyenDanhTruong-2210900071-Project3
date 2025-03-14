<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cho Thuê Phòng Trọ - Nguyễn Danh Trường</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
            min-height: 100vh;
            overflow-x: hidden;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        header {
            background: linear-gradient(90deg, #1e3a8a, #3b82f6);
            color: #ffffff;
            padding: 20px 40px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            animation: headerGlow 3s infinite alternate;
        }
        @keyframes headerGlow {
            0% { box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); }
            100% { box-shadow: 0 4px 25px rgba(59, 130, 246, 0.5); }
        }
        .header-buttons {
            position: absolute;
            top: 15px;
            left: 20px;
            display: flex;
            gap: 15px;
        }
        .login-btn {
            position: absolute;
            top: 15px;
            right: 20px;
        }
        .btn-header {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 25px;
            padding: 8px 20px;
            transition: all 0.3s ease;
        }
        .btn-header:hover {
            background: rgba(255, 255, 255, 0.4);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            font-weight: 700;
            letter-spacing: 2px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }
        .carousel-inner img {
            border-radius: 15px;
            max-height: 400px;
            object-fit: cover;
            filter: brightness(90%);
            transition: filter 0.3s ease;
        }
        .carousel-inner img:hover {
            filter: brightness(110%);
        }
        .carousel {
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            border-radius: 15px;
            overflow: hidden;
        }
        .btn-thue {
            background: #10b981;
            border: none;
            border-radius: 30px;
            padding: 12px 40px;
            font-size: 18px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
        }
        .btn-thue:hover {
            background: #059669;
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.6);
        }
        .room-list .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: #ffffff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .room-list .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .card:hover .card-img-top {
            transform: scale(1.1);
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            color: #1e3a8a;
            font-weight: 600;
        }
        .card-text {
            color: #4b5563;
        }
        h2.text-primary {
            font-weight: 700;
            color: #1e3a8a;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
            display: inline-block;
        }
        h2.text-primary::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 50%;
            height: 3px;
            background: #3b82f6;
            border-radius: 2px;
        }
        footer {
            background: linear-gradient(90deg, #1e3a8a, #111827);
            color: #d1d5db;
            padding: 20px;
            margin-top: 40px;
            text-align: center;
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.2);
        }
        .modal-content {
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            animation: slideIn 0.5s ease;
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .modal-header {
            background: #3b82f6;
            color: #ffffff;
            border-radius: 15px 15px 0 0;
        }
        .bling {
            background: linear-gradient(45deg, #ffd700, #ff69b4, #00ffcc, #ffd700);
            background-size: 200% 200%;
            animation: blingEffect 3s infinite;
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        @keyframes blingEffect {
            0% { background-position: 0% 0%; }
            50% { background-position: 100% 100%; }
            100% { background-position: 0% 0%; }
        }
    </style>
</head>
<body>

<header>
    <div class="header-buttons">
        <button type="button" class="btn btn-header btn-sm" data-bs-toggle="modal" data-bs-target="#aboutModal">Giới thiệu</button>
        <button type="button" class="btn btn-header btn-sm" data-bs-toggle="modal" data-bs-target="#contactModal">Liên hệ</button>
    </div>
    <h1 class="bling">Cho Thuê Phòng Trọ</h1>
    <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-light btn-sm login-btn">Đăng Nhập</a>
</header>

<section class="container my-5">
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://xaydungaau.com/wp-content/uploads/2023/12/luu-y-thiet-ke-noi-that-phong-tro-an.jpg" class="d-block w-100" alt="Phòng trọ cao cấp">
            </div>
            <div class="carousel-item">
                <img src="https://xaydungaau.com/wp-content/uploads/2023/12/thiet-ke-noi-that-phong-tro-an-tuong-tien-nghi.jpg" class="d-block w-100" alt="Phòng trọ tiện nghi">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="Phòng trọ hiện đại">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1560448205-4d9b3e6bb6db?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="Phòng trọ ấm cúng">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1600585154526-990dced4db0d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="Phòng trọ sáng sủa">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Trước</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Tiếp</span>
        </button>
    </div>
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/admin/AdminDashboard" class="btn btn-thue">Thuê Phòng Ngay</a>
    </div>
</section>

<div class="container mt-5">
    <h2 class="text-primary text-center mb-4">Danh Sách Phòng Trọ</h2>
    <div class="row room-list g-4">
        <div class="col-md-4">
            <div class="card">
                <img src="https://i-connect.com.vn/data/news/7046/anh-2-phong-tro-rong.jpg" class="card-img-top" alt="Phòng Trọ 20m²">
                <div class="card-body">
                    <h5 class="card-title">Phòng Trọ 20m²</h5>
                    <p class="card-text"><strong>Giá:</strong> 3.500.000 VND/tháng</p>
                    <p>Tiện nghi đầy đủ, gần trung tâm.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="https://i-connect.com.vn/data/news/7046/anh-32-vach-ngan-phong-tro-thong-minh-da-nang.jpg" class="card-img-top" alt="Phòng Trọ 25m²">
                <div class="card-body">
                    <h5 class="card-title">Phòng Trọ 25m²</h5>
                    <p class="card-text"><strong>Giá:</strong> 4.200.000 VND/tháng</p>
                    <p>Ban công rộng, khu an ninh.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="https://bandon.vn/uploads/posts/thiet-ke-nha-tro-dep-2020-bandon-0.jpg" class="card-img-top" alt="Phòng Trọ 30m²">
                <div class="card-body">
                    <h5 class="card-title">Phòng Trọ 30m²</h5>
                    <p class="card-text"><strong>Giá:</strong> 5.000.000 VND/tháng</p>
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
                <p>Chào mừng bạn đến với dịch vụ cho thuê phòng trọ của chúng tôi! Chúng tôi cung cấp các phòng trọ tiện nghi, giá cả hợp lý, phù hợp với mọi nhu cầu. Được quản lý bởi <strong>Nguyễn Danh Trường</strong>, chúng tôi cam kết mang đến sự thoải mái và hài lòng tối đa cho khách hàng.</p>
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
                    <li><i class="fas fa-phone me-2"></i><strong>Hotline:</strong> 0797475264</li>
                    <li><i class="fas fa-envelope me-2"></i><strong>Email:</strong> nguyendanhtruong@example.com</li>
                    <li><i class="fas fa-map-marker-alt me-2"></i><strong>Địa chỉ:</strong> Ninh Bình</li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>© 2025 Nguyễn Danh Trường - Hotline: <a href="tel:0797475264" class="text-light">0797475264</a></p>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>