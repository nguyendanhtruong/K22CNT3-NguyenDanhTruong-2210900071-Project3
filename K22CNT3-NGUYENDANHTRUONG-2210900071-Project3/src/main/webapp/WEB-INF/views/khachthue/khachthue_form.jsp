<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Form Khách Thuê</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Thông Tin Khách Thuê</h2>
<form action="${pageContext.request.contextPath}/khachthue/save" method="post">
  <table>
    <tr>
      <td>Mã Khách Thuê:</td>
      <td><input type="text" name="NDT_maKT" value="${khachThue.NDT_maKT}" required></td>
    </tr>
    <tr>
      <td>Họ Tên:</td>
      <td><input type="text" name="NDT_HoTen" value="${khachThue.NDT_HoTen}" required></td>
    </tr>
    <tr>
      <td>Ngày Sinh:</td>
      <td><input type="date" name="NDT_NgaySinh" value="${khachThue.NDT_NgaySinh}" required></td>
    </tr>
    <tr>
      <td>Nghề Nghiệp:</td>
      <td><input type="text" name="NDT_NgheNghiep" value="${khachThue.NDT_NgheNghiep}"></td>
    </tr>
    <tr>
      <td>Giới Tính:</td>
      <td>
        <select name="NDT_GioiTinh">
          <option value="Nam" ${khachThue.NDT_GioiTinh == 'Nam' ? 'selected' : ''}>Nam</option>
          <option value="Nữ" ${khachThue.NDT_GioiTinh == 'Nữ' ? 'selected' : ''}>Nữ</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>SĐT:</td>
      <td><input type="text" name="NDT_Sdt" value="${khachThue.NDT_Sdt}" required></td>
    </tr>
    <tr>
      <td>Quê Quán:</td>
      <td><input type="text" name="NDT_QueQuan" value="${khachThue.NDT_QueQuan}"></td>
    </tr>
    <tr>
      <td>Mã Phòng:</td>
      <td><input type="text" name="NDT_maPhong" value="${khachThue.NDT_maPhong}"></td>
    </tr>
  </table>
  <input type="submit" value="Lưu">
  <a href="${pageContext.request.contextPath}/khachthue/list">Hủy</a>
</form>
</body>
</html>
