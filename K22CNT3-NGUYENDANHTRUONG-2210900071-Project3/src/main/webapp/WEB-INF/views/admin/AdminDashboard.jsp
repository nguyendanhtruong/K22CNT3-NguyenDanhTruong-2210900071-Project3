<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f4f4f9;
            color: #333;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #343a40;
            position: fixed;
            padding: 20px;
            border-right: 1px solid #dee2e6;
            color: #fff;
        }
        .sidebar a {
            color: #fff;
            display: block;
            padding: 10px;
            text-decoration: none;
            font-weight: bold;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .main-content {
            margin-left: 270px;
            padding: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            background-color: #ffffff;
            color: #000000;
            border: 1px solid #dee2e6;
        }
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead th {
            background: #2c3e50;
            color: white;
            border: none;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.3s;
        }
        .btn-custom {
            border-radius: 20px;
            padding: 5px 15px;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="text-center mb-4">
        <i class="fas fa-user-shield fa-3x"></i>
        <h4>Admin</h4>
    </div>
    <a href="#" onclick="loadDashboard('${pageContext.request.contextPath}/admin/taikhoan')"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="#" onclick="loadContent('${pageContext.request.contextPath}/phongtro/list')"><i class="fas fa-home"></i> Quản lý phòng</a>
    <a href="#" onclick="loadContent('${pageContext.request.contextPath}/khachthue/list')"><i class="fas fa-users"></i> Quản lý khách thuê</a>
    <a href="#" onclick="loadContent('${pageContext.request.contextPath}/hoadon/list')"><i class="fas fa-file-invoice"></i> Quản lý hóa đơn</a>
    <a href="#" onclick="loadContent('${pageContext.request.contextPath}/thongke/thongke')"><i class="fas fa-chart-bar"></i> Thống kê</a>
    <a href="#" onclick="loadPendingBookings('${pageContext.request.contextPath}/home/pending')"><i class="fas fa-check-circle"></i> Xác nhận đặt phòng</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger mt-3 w-100"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="main-content" id="mainContent">
    <!-- Nội dung mặc định: Dashboard -->
    <div id="dashboardContent">
        <h2 class="text-center">Admin Dashboard</h2>
        <div class="row mt-4">
            <div class="col-md-3">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Tổng số phòng</h5>
                        <p class="card-text" id="totalRooms"><%= request.getAttribute("totalRooms") != null ? request.getAttribute("totalRooms") : "0" %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Số phòng trống</h5>
                        <p class="card-text" id="availableRooms"><%= request.getAttribute("availableRooms") != null ? request.getAttribute("availableRooms") : "0" %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Tổng khách thuê</h5>
                        <p class="card-text" id="totalTenants"><%= request.getAttribute("totalTenants") != null ? request.getAttribute("totalTenants") : "0" %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Doanh thu tháng</h5>
                        <p class="card-text" id="monthlyRevenue"><%= request.getAttribute("monthlyRevenue") != null ? request.getAttribute("monthlyRevenue") : "0" %> VNĐ</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <canvas id="revenueChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Nội dung xác nhận đặt phòng (ẩn ban đầu) -->
    <div id="pendingBookingsContent" style="display: none;">
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        <div class="card">
            <div class="card-header bg-dark text-white">
                <h3 class="mb-0"><i class="fas fa-check-circle me-2"></i>Danh Sách Yêu Cầu Đặt Phòng</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Mã Phòng</th>
                            <th>Tên Người Thuê</th>
                            <th>Số Điện Thoại</th>
                            <th>Ngày Thuê</th>
                            <th>Hành Động</th>
                        </tr>
                        </thead>
                        <tbody id="pendingBookingsTable">
                        <!-- Dữ liệu sẽ được điền bằng AJAX -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script>
    function loadDashboard(url) {
        $.ajax({
            url: url,
            method: "GET",
            success: function(response) {
                $("#mainContent").html(response);
                $("#dashboardContent").show();
                $("#pendingBookingsContent").hide();
            },
            error: function() {
                alert("Không thể tải dashboard.");
            }
        });
    }

    function loadContent(url) {
        $.ajax({
            url: url,
            method: "GET",
            success: function(response) {
                $("#mainContent").html(response);
                $("#dashboardContent").hide();
                $("#pendingBookingsContent").hide();
            },
            error: function() {
                alert("Không thể tải nội dung.");
            }
        });
    }

    function loadPendingBookings(url) {
        $.ajax({
            url: url,
            method: "GET",
            dataType: "json", // Nhận dữ liệu JSON từ controller
            success: function(data) {
                $("#dashboardContent").hide();
                $("#pendingBookingsContent").show();

                // Xóa nội dung cũ
                $("#pendingBookingsTable").empty();

                // Nếu không có dữ liệu
                if (data.length === 0) {
                    $("#pendingBookingsTable").append(
                        '<tr><td colspan="5" class="text-center">Chưa có yêu cầu nào đang chờ xử lý.</td></tr>'
                    );
                } else {
                    // Điền dữ liệu vào bảng
                    data.forEach(function(booking) {
                        $("#pendingBookingsTable").append(
                            '<tr>' +
                            '<td>' + booking.maPhong + '</td>' +
                            '<td>' + booking.tenNguoiThue + '</td>' +
                            '<td>' + booking.soDienThoai + '</td>' +
                            '<td>' + booking.ngayThue + '</td>' +
                            '<td>' +
                            '<form action="${pageContext.request.contextPath}/home/confirm" method="post" class="d-inline">' +
                            '<input type="hidden" name="maPhong" value="' + booking.maPhong + '">' +
                            '<button type="submit" name="action" value="accept" class="btn btn-success btn-custom btn-sm me-2">' +
                            '<i class="fas fa-check me-1"></i>Xác Nhận' +
                            '</button>' +
                            '<button type="submit" name="action" value="reject" class="btn btn-danger btn-custom btn-sm">' +
                            '<i class="fas fa-times me-1"></i>Từ Chối' +
                            '</button>' +
                            '</form>' +
                            '</td>' +
                            '</tr>'
                        );
                    });
                }
            },
            error: function() {
                alert("Không thể tải danh sách yêu cầu đặt phòng.");
            }
        });
    }

    $(document).ready(function() {
        loadDashboard('${pageContext.request.contextPath}/admin/taikhoan');
    });
</script>
</body>
</html>