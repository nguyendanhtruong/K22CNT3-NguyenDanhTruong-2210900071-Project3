<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Phòng Trọ</title>
</head>
<body>
<h2>Thêm Phòng Trọ</h2>
<form action="<c:url value='/phongtro/add' />" method="POST">
    <label>Mã Phòng: <input type="text" name="maPhong" required></label><br>
    <label>Diện Tích: <input type="number" step="0.1" name="dienTich" required></label><br>
    <label>Số Người: <input type="number" name="soNguoi" required></label><br>
    <label>Giá Thuê: <input type="number" step="0.01" name="giaThue" required></label><br>
    <label>Đối Tượng Thuê: <input type="text" name="doiTuongThue"></label><br>
    <label>Tình Trạng: <input type="text" name="tinhTrang"></label><br>
    <button type="submit">Thêm</button>
</form>
</body>
</html>