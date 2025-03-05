<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thống kê</title>
  <style>
    body { font-family: Arial, sans-serif; }
    table { width: 50%; margin: 20px auto; border-collapse: collapse; }
    th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background-color: #f4f4f4; }
  </style>
</head>
<body>
<h2 style="text-align: center;">Thống kê phòng trọ</h2>
<table>
  <tr><th>Tổng số phòng:</th> <td>${thongKe.tongSoPhong}</td></tr>
  <tr><th>Số phòng trống:</th> <td>${thongKe.soPhongTrong}</td></tr>
  <tr><th>Số phòng đã thuê:</th> <td>${thongKe.soPhongDaThue}</td></tr>
  <tr><th>Tổng số khách thuê:</th> <td>${thongKe.tongKhachThue}</td></tr>
  <tr><th>Tổng doanh thu:</th> <td>${thongKe.doanhThu} VNĐ</td></tr>
</table>
</body>
</html>
