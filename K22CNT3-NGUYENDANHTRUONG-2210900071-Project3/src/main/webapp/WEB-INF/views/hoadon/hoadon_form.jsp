<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Form Hóa Đơn</title>
</head>
<body>
<h1><c:if test="${empty hoaDon.NDT_maHD}">Thêm</c:if><c:if test="${not empty hoaDon.NDT_maHD}">Cập nhật</c:if> Hóa Đơn</h1>

<form action="${pageContext.request.contextPath}/hoadon/save" method="post">
  <label for="maHD">Mã Hóa Đơn:</label>
  <input type="text" id="maHD" name="NDT_maHD" value="${hoaDon.NDT_maHD}" required/><br/>

  <label for="maKT">Mã Khách Thuê:</label>
  <input type="text" id="maKT" name="NDT_maKT" value="${hoaDon.NDT_maKT}" required/><br/>

  <label for="maPhong">Mã Phòng:</label>
  <input type="text" id="maPhong" name="NDT_maPhong" value="${hoaDon.NDT_maPhong}" required/><br/>

  <label for="tgian">Thời Gian:</label>
  <input type="date" id="tgian" name="NDT_tgian" value="${hoaDon.NDT_tgian}" required/><br/>

  <input type="submit" value="Lưu"/>
</form>

<a href="${pageContext.request.contextPath}/hoadon/list">Quay lại danh sách</a>
</body>
</html>
