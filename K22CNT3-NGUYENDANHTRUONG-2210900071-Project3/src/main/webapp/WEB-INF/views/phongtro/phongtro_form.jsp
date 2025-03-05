<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm/Sửa Phòng Trọ</title>
</head>
<body>
<h2>${phongTro.NDT_maPhong == null ? 'Thêm Phòng Trọ' : 'Sửa Phòng Trọ'}</h2>

<form method="post" action="${pageContext.request.contextPath}/phongtro/save">
    Mã Phòng: <input type="text" name="NDT_maPhong" value="${phongTro.NDT_maPhong}" required /><br/>
    Diện Tích: <input type="number" name="NDT_dienTich" value="${phongTro.NDT_dienTich}" required /><br/>
    Số Người: <input type="number" name="NDT_soNguoi" value="${phongTro.NDT_soNguoi}" required /><br/>
    Giá Thuê: <input type="number" name="NDT_giaThue" value="${phongTro.NDT_giaThue}" required /><br/>
    Đối Tượng Thuê: <input type="text" name="NDT_DoiTuongThue" value="${phongTro.NDT_DoiTuongThue}" required /><br/>
    Tình Trạng: <input type="text" name="NDT_TinhTrang" value="${phongTro.NDT_TinhTrang}" required /><br/>

    <input type="submit" value="Lưu" />
</form>

<a href="${pageContext.request.contextPath}/phongtro/list">Quay lại</a>

</body>
</html>
