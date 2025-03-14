<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Phòng Thành Công - ${phong.NDT_maPhong}</title>
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
            justify-content: center;
            padding: 20px;
            overflow: hidden;
        }
        .container {
            max-width: 600px;
            width: 100%;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            animation: fadeIn 0.5s ease-in-out;
            position: relative;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
        h2 {
            color: #1e3a8a;
            font-weight: 700;
            text-align: center;
            margin-bottom: 25px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            animation: bounce 1s infinite alternate;
        }
        @keyframes bounce {
            from { transform: translateY(0); }
            to { transform: translateY(-10px); }
        }
        .success-icon {
            font-size: 50px;
            color: #10b981;
            margin-bottom: 20px;
            animation: spin 2s infinite linear;
        }
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
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
        .btn-back {
            display: inline-block;
            background: #3b82f6;
            border: none;
            border-radius: 25px;
            padding: 10px 30px;
            font-weight: 600;
            color: #ffffff;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
            margin-top: 20px;
        }
        .btn-back:hover {
            background: #1e3a8a;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.6);
            color: #ffffff;
        }
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #ffd700;
            animation: fall 5s infinite;
            z-index: 1;
        }
        @keyframes fall {
            0% { transform: translateY(-100vh) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(720deg); opacity: 0; }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="text-center">
        <i class="fas fa-check-circle success-icon"></i>
        <h2>🎉 Đặt Phòng Thành Công! 🎉</h2>
    </div>

    <c:if test="${phong != null}">
        <div class="detail-item">
            <i class="fas fa-id-card"></i>
            <strong>Mã Phòng:</strong>
            <span>${phong.NDT_maPhong}</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-ruler"></i>
            <strong>Diện Tích:</strong>
            <span>${phong.NDT_dienTich} m²</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-users"></i>
            <strong>Số Người:</strong>
            <span>${phong.NDT_soNguoi} người</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-money-bill"></i>
            <strong>Giá Thuê:</strong>
            <span>${phong.NDT_giaThue} VNĐ</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-info-circle"></i>
            <strong>Tình Trạng:</strong>
            <span class="badge ${phong.NDT_TinhTrang eq 'Trống' ? 'bg-success' : 'bg-danger'}">${phong.NDT_TinhTrang}</span>
        </div>
        <div class="detail-item">
            <i class="fas fa-comment-dots"></i>
            <strong>Mô Tả:</strong>
            <span>${phong.NDT_moTa}</span>
        </div>
    </c:if>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/home" class="btn-back"><i class="fas fa-arrow-left me-2"></i>Quay Về Danh Sách Phòng</a>
    </div>
</div>

<!-- Hiệu ứng Confetti -->
<script>
    function createConfetti() {
        const colors = ['#ffd700', '#ff69b4', '#00ffcc', '#ff4500', '#1e90ff'];
        for (let i = 0; i < 50; i++) {
            const confetti = document.createElement('div');
            confetti.className = 'confetti';
            confetti.style.left = Math.random() * 100 + 'vw';
            confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
            confetti.style.animationDelay = Math.random() * 5 + 's';
            document.body.appendChild(confetti);
            setTimeout(() => confetti.remove(), 5000);
        }
    }
    window.onload = createConfetti;
</script>

<!-- Gói JS Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>