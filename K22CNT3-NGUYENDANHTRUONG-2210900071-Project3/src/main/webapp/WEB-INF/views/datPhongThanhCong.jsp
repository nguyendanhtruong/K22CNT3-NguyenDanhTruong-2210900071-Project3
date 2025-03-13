<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Phòng Thành Công</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<div class="container">
    <h2>🎉 Đặt Phòng Thành Công! 🎉</h2>

    <c:if test="${phong != null}">
        <p><strong>Mã Phòng:</strong> ${phong.NDT_maPhong}</p>
        <p><strong>Diện Tích:</strong> ${phong.NDT_dienTich} m²</p>
        <p><strong>Số Người:</strong> ${phong.NDT_soNguoi} người</p>
        <p><strong>Giá Thuê:</strong> ${phong.NDT_giaThue} VNĐ</p>
        <p><strong>Tình Trạng:</strong> ${phong.NDT_TinhTrang}</p>
        <p><strong>Mô Tả:</strong> ${phong.NDT_moTa}</p>



    </c:if>

    <a href="${pageContext.request.contextPath}/home">🔙 Quay về danh sách phòng</a>
</div>
</body>
</html>
