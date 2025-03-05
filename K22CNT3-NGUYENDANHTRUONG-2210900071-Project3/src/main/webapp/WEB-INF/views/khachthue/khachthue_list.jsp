<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh Sách Khách Thuê</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Danh Sách Khách Thuê</h2>
<a href="${pageContext.request.contextPath}/khachthue/add">Thêm Khách Thuê</a>
<table border="1">
  <tr>
    <th>Mã KT</th>
    <th>Họ Tên</th>
    <th>Ngày Sinh</th>
    <th>Nghề Nghiệp</th>
    <th>Giới Tính</th>
    <th>SĐT</th>
    <th>Quê Quán</th>
    <th>Mã Phòng</th>
    <th>Hành Động</th>
  </tr>
  <c:forEach var="kt" items="${listKhachThue}">
    <tr>
      <td>${kt.NDT_maKT}</td>
      <td>${kt.NDT_HoTen}</td>
      <td>${kt.NDT_NgaySinh}</td>
      <td>${kt.NDT_NgheNghiep}</td>
      <td>${kt.NDT_GioiTinh}</td>
      <td>${kt.NDT_Sdt}</td>
      <td>${kt.NDT_QueQuan}</td>
      <td>${kt.NDT_maPhong}</td>
      <td>
        <a href="${pageContext.request.contextPath}/khachthue/edit/${kt.NDT_maKT}">Sửa</a>
        |
        <a href="${pageContext.request.contextPath}/khachthue/delete/${kt.NDT_maKT}" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
