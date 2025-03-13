<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi Tiết Phòng Trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            margin: 20px auto;
            max-width: 600px;
        }
        .btn-custom {
            border-radius: 20px;
            padding: 5px 15px;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="card">
        <div class="card-header bg-dark text-white">
            <h3 class="mb-0"><i class="fas fa-home me-2"></i>Chi Tiết Phòng Trọ</h3>
        </div>
        <div class="card-body">
            <p><strong>Mã Phòng:</strong> ${phongTro.NDT_maPhong}</p>
            <p><strong>Diện Tích:</strong> ${phongTro.NDT_dienTich} m²</p>
            <p><strong>Số Người:</strong> ${phongTro.NDT_soNguoi} người</p>
            <p><strong>Giá Thuê:</strong> ${phongTro.NDT_giaThue} VNĐ</p>
            <p><strong>Tình Trạng:</strong>
                <span class="badge ${phongTro.NDT_TinhTrang eq 'Trong' ? 'bg-success' : 'bg-danger'} p-2">
                    ${phongTro.NDT_TinhTrang}
                </span>
            </p>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary btn-custom">Quay Lại</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>