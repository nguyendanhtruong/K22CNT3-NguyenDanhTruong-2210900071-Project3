<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Chủ - Quản Lý Phòng Trọ</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            padding-top: 40px;
            padding-bottom: 40px;
        }
        .header-section {
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        h2 {
            color: #1e3a8a; /* Deep blue */
            font-weight: 600;
            margin: 0;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            background: #ffffff;
            overflow: hidden;
        }
        .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
        }
        .table thead th {
            background: #1e3a8a; /* Deep blue */
            color: #ffffff;
            padding: 15px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }
        .table tbody tr {
            transition: all 0.3s ease;
        }
        .table tbody tr:hover {
            background-color: #f1f5f9;
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .table td {
            padding: 15px;
            vertical-align: middle;
        }
        .btn-custom {
            border-radius: 25px;
            padding: 6px 18px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        .btn-info {
            background-color: #3b82f6;
            border-color: #3b82f6;
        }
        .btn-primary {
            background-color: #10b981;
            border-color: #10b981;
        }
        .btn-danger {
            background-color: #ef4444;
            border-color: #ef4444;
        }
        .badge {
            padding: 6px 12px;
            font-size: 12px;
            font-weight: 600;
            border-radius: 20px;
        }
        .alert {
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .alert-success {
            background-color: #d1fae5;
            color: #065f46;
        }
        .alert-danger {
            background-color: #fee2e2;
            color: #991b1b;
        }
        .carousel-inner img {
            height: 300px; /* Fixed height for consistency */
            object-fit: cover; /* Ensure images fill the space without distortion */
            border-radius: 15px;
        }
        .carousel {
            margin-bottom: 30px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Banner Carousel -->
    <div id="bannerCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://bandon.vn/uploads/posts/thiet-ke-nha-tro-dep-2020-bandon-0.jpg" class="d-block w-100" alt="Phòng trọ 1">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1560448205-4d9b3e6bb6db?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="Phòng trọ 2">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="Phòng trọ 3">
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1600585154526-990dced4db0d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="Phòng trọ 4">
            </div>
            <div class="carousel-item">
                <img src="https://spacet-release.s3.ap-southeast-1.amazonaws.com/img/blog/2023-10-04/guong-duoc-van-dung-giup-an-gian-dien-tich-651cda66c9649b0ef5c6f441.webp" class="d-block w-100" alt="Phòng trọ 5">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Thanh điều hướng -->
    <div class="header-section">
        <h2><i class="fas fa-home me-2"></i>Danh Sách Phòng Trọ</h2>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-custom">
            <i class="fas fa-sign-out-alt me-2"></i>Đăng Xuất
        </a>
    </div>

    <!-- Thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Bảng danh sách phòng -->
    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th><i class="fas fa-id-card me-2"></i>Mã Phòng</th>
                    <th><i class="fas fa-ruler me-2"></i>Diện Tích</th>
                    <th><i class="fas fa-users me-2"></i>Số Người</th>
                    <th><i class="fas fa-money-bill me-2"></i>Giá Thuê</th>
                    <th><i class="fas fa-info-circle me-2"></i>Tình Trạng</th>
                    <th><i class="fas fa-cogs me-2"></i>Hành Động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="phong" items="${listPhongTro}">
                    <tr>
                        <td>${phong.NDT_maPhong}</td>
                        <td>${phong.NDT_dienTich} m²</td>
                        <td>${phong.NDT_soNguoi} người</td>
                        <td>${phong.NDT_giaThue} VNĐ</td>
                        <td>
                            <span class="badge ${phong.NDT_TinhTrang eq 'Trống' ? 'bg-success' : 'bg-danger'}">
                                    ${phong.NDT_TinhTrang}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/phongtro/detail/${phong.NDT_maPhong}"
                               class="btn btn-info btn-custom btn-sm me-2">
                                <i class="fas fa-eye me-1"></i>Xem
                            </a>
                            <c:choose>
                                <c:when test="${phong.NDT_TinhTrang eq 'Trống'}">
                                    <form action="datPhong" method="post" class="d-inline">
                                        <input type="hidden" name="maPhong" value="${phong.NDT_maPhong}">
                                        <button type="submit" class="btn btn-primary btn-custom btn-sm">
                                            <i class="fas fa-bookmark me-1"></i>Đặt
                                        </button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted"><i class="fas fa-lock me-1"></i>Đã Thuê</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>