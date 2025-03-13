<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Chủ - Quản Lý Phòng Trọ</title>

    <!-- Nhúng Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead th {
            background: #2c3e50;
            color: white;
            border: none;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.3s;
        }
        .btn-custom {
            border-radius: 20px;
            padding: 5px 15px;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
        }
        .header-section {
            background: white;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 20px;
        }
        h2 {
            color: #2c3e50;
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <!-- Thanh điều hướng -->
    <div class="header-section d-flex justify-content-between align-items-center">
        <h2><i class="fas fa-home me-2"></i>Danh Sách Phòng Trọ</h2>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-custom">
            <i class="fas fa-sign-out-alt me-2"></i>Đăng Xuất
        </a>
    </div>

    <!-- Thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Bảng danh sách phòng -->
    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
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
                                    <span class="badge ${phong.NDT_TinhTrang eq 'Trong' ? 'bg-success' : 'bg-danger'} p-2">
                                            ${phong.NDT_TinhTrang}
                                    </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/phongtro/detail/${phong.NDT_maPhong}"
                               class="btn btn-info btn-custom btn-sm me-2">
                                <i class="fas fa-eye me-1"></i>Xem
                            </a>
                            <c:choose>
                                <c:when test="${phong.NDT_TinhTrang eq 'Trong'}">
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

<!-- Nhúng Bootstrap JavaScript và dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>