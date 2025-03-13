<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thống kê</title>
  <style>
    /* Reset mặc định */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      text-align: center;
    }

    /* Tiêu đề */
    h2 {
      color: #333;
      margin-top: 20px;
    }

    /* Bảng thống kê */
    table {
      width: 60%;
      margin: 20px auto;
      border-collapse: collapse;
      background: white;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      overflow: hidden;
    }

    /* Định dạng hàng và cột */
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    /* Tiêu đề cột */
    th {
      background-color: #007bff;
      color: white;
      text-align: center;
    }

    /* Hàng xen kẽ màu */
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    /* Tổng doanh thu in đậm */
    .doanh-thu {
      font-weight: bold;
      color: #d9534f;
    }
  </style>
</head>
<body>
<h2>Thống kê phòng trọ</h2>
<table>
  <tr><th>Tổng số phòng:</th> <td>${thongKe.tongSoPhong}</td></tr>
  <tr><th>Số phòng trống:</th> <td>${thongKe.soPhongTrong}</td></tr>
  <tr><th>Số phòng đã thuê:</th> <td>${thongKe.soPhongDaThue}</td></tr>
  <tr><th>Tổng số khách thuê:</th> <td>${thongKe.tongKhachThue}</td></tr>
  <tr><th>Tổng doanh thu:</th> <td class="doanh-thu">${thongKe.doanhThu} VNĐ</td></tr>
</table>
</body>
</html>
