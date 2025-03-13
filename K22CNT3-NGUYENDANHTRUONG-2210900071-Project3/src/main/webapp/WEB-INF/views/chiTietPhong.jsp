<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Phòng</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<div class="container">
    <h2>🏠 Chi Tiết Phòng</h2>

    <c:if test="${phong != null}">
        <p><strong>Mã Phòng:</strong> ${phong.NDT_maPhong}</p>
        <p><strong>Diện Tích:</strong> ${phong.NDT_dienTich} m²</p>
        <p><strong>Số Người:</strong> ${phong.NDT_soNguoi} người</p>
        <p><strong>Giá Thuê:</strong> ${phong.NDT_giaThue} VNĐ</p>
        <p><strong>Tình Trạng:</strong> ${phong.NDT_TinhTrang}</p>
        <p><strong>Mô Tả:</strong> ${phong.NDT_moTa}</p>
        <p><strong>Tiện Ích:</strong> ${phong.NDT_tienIch}</p>

        <a href="/datPhong?maPhong=${phong.NDT_maPhong}">🛒 Đặt Phòng Ngay</a> |
        <a href="/phongtro/list">🔙 Quay về danh sách phòng</a>
    </c:if>

    <c:if test="${phong == null}">
        <p style="color:red;">Phòng không tồn tại hoặc đã bị xóa.</p>
    </c:if>
</div>
</body>
</html>
