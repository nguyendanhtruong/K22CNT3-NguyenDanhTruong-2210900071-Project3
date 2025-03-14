<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thống Kê Phòng Trọ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
      min-height: 100vh;
      padding: 40px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
    }
    h2 {
      color: #1e3a8a;
      font-weight: 700;
      text-align: left;
      margin-bottom: 30px;
      position: relative;
    }
    h2::after {
      content: '';
      position: absolute;
      bottom: -5px;
      left: 0;
      width: 80px;
      height: 3px;
      background: #3b82f6;
      border-radius: 2px;
    }
    .stats-container {
      width: 100%;
      max-width: 800px;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    .stat-card {
      background: #ffffff;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      display: flex;
      align-items: center;
      transition: all 0.3s ease;
    }
    .stat-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
    }
    .stat-icon {
      font-size: 30px;
      color: #3b82f6;
      margin-right: 20px;
      width: 40px;
      text-align: center;
    }
    .stat-content {
      flex-grow: 1;
    }
    .stat-label {
      color: #1e3a8a;
      font-weight: 600;
      font-size: 18px;
      margin-bottom: 5px;
    }
    .stat-value {
      color: #4b5563;
      font-size: 24px;
      font-weight: 700;
    }
    .doanh-thu .stat-value {
      color: #d9534f;
      font-size: 28px;
    }
  </style>
</head>
<body>
<h2>Thống Kê Phòng Trọ</h2>
<div class="stats-container">
  <div class="stat-card">
    <i class="fas fa-home stat-icon"></i>
    <div class="stat-content">
      <div class="stat-label">Tổng Số Phòng</div>
      <div class="stat-value">${thongKe.tongSoPhong}</div>
    </div>
  </div>
  <div class="stat-card">
    <i class="fas fa-door-open stat-icon"></i>
    <div class="stat-content">
      <div class="stat-label">Số Phòng Trống</div>
      <div class="stat-value">${thongKe.soPhongTrong}</div>
    </div>
  </div>
  <div class="stat-card">
    <i class="fas fa-door-closed stat-icon"></i>
    <div class="stat-content">
      <div class="stat-label">Số Phòng Đã Thuê</div>
      <div class="stat-value">${thongKe.soPhongDaThue}</div>
    </div>
  </div>
  <div class="stat-card">
    <i class="fas fa-users stat-icon"></i>
    <div class="stat-content">
      <div class="stat-label">Tổng Số Khách Thuê</div>
      <div class="stat-value">${thongKe.tongKhachThue}</div>
    </div>
  </div>
  <div class="stat-card doanh-thu">
    <i class="fas fa-money-bill-wave stat-icon"></i>
    <div class="stat-content">
      <div class="stat-label">Tổng Doanh Thu</div>
      <c:set var="doanhThu" value="${thongKe.doanhThu}" />
      <c:choose>
        <c:when test="${doanhThu >= 1000000000}">
          <div class="stat-value"><fmt:formatNumber value="${doanhThu / 1000000000}" pattern="#.##"/> tỷ VNĐ</div>
        </c:when>
        <c:when test="${doanhThu >= 1000000}">
          <div class="stat-value"><fmt:formatNumber value="${doanhThu / 1000000}" pattern="#.#"/> triệu VNĐ</div>
        </c:when>
        <c:when test="${doanhThu >= 1000}">
          <div class="stat-value"><fmt:formatNumber value="${doanhThu / 1000}" pattern="#,##0"/> nghìn VNĐ</div>
        </c:when>
        <c:otherwise>
          <div class="stat-value"><fmt:formatNumber value="${doanhThu}" pattern="#,##0"/> VNĐ</div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>