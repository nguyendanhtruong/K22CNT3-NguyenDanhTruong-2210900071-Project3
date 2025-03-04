<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Phòng Trọ</title>
</head>
<body>
<h2>Chỉnh Sửa Phòng Trọ</h2>
<form action="<c:url value='/phongtro/edit' />" method="POST">
    <input type="hidden" name="maPhong" value="${phongTro.maPhong}">
    <label>Diện Tích: <input type="number" step="0.1" name="dienTich" value="${phongTro.dienTich}" required></label><br>
    <label>Số Người: <input type="number" name="soNguoi" value="${phongTro.soNguoi}" required></label><br>
    <label>Giá Thuê: <input type="number" step="0.01" name="giaThue" value="${phongTro.giaThue}" required></label><br>
    <label>Đối Tượng Thuê: <input type="text" name="doiTuongThue" value="${phongTro.doiTuongThue}"></label><br>
    <label>Tình Trạng: <input type="text" name="tinhTrang" value="${phongTro.tinhTrang}"></label><br>
    <button type="submit">Lưu</button>
</form>
</body>
</html>