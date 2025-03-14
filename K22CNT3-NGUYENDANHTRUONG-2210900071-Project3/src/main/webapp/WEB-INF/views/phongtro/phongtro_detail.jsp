<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi Tiết Phòng Trọ - ${phongTro.NDT_maPhong}</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 40px 20px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            margin: 0 auto;
            background: #ffffff;
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .card-header {
            background: linear-gradient(90deg, #1e3a8a, #3b82f6);
            color: #ffffff;
            border-radius: 15px 15px 0 0;
            padding: 20px;
            text-align: center;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 30px;
        }
        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .detail-item:hover {
            background: #f1f5f9;
            transform: translateX(5px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .detail-item i {
            font-size: 20px;
            color: #3b82f6;
            margin-right: 15px;
            width: 30px;
            text-align: center;
        }
        .detail-item strong {
            color: #1e3a8a;
            font-weight: 600;
            min-width: 120px;
        }
        .detail-item span {
            color: #4b5563;
        }
        .badge {
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 20px;
        }
        .btn-custom {
            background: #10b981;
            border: none;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
        }
        .btn-custom:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.6);
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <h3 class="mb-0"><i class="fas fa-home me-2"></i>Chi Tiết Phòng Trọ</h3>
    </div>
    <div class="card-body">
        <div class="detail-item">
            <i class="fas fa-id-card"></i>
            <strong>Mã Phòng:</strong>
            <span>${phongTro.NDT_maPhong}</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-ruler"></i>
            <strong>Diện Tích:</strong>
            <span>${phongTro.NDT_dienTich} m²</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-users"></i>
            <strong>Số Người:</strong>
            <span>${phongTro.NDT_soNguoi} người</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-money-bill"></i>
            <strong>Giá Thuê:</strong>
            <span>${phongTro.NDT_giaThue} VNĐ</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-info-circle"></i>
            <strong>Tình Trạng:</strong>
            <span class="badge ${phongTro.NDT_TinhTrang eq 'Trống' ? 'bg-success' : 'bg-danger'}">${phongTro.NDT_TinhTrang}</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-comment-dots"></i>
            <strong>Mô Tả:</strong>
            <span>${phongTro.NDT_moTa}</span>
        </div>
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-custom"><i class="fas fa-arrow-left me-2"></i>Quay Lại</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>