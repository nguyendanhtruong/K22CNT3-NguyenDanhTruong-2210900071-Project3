<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý Tài Khoản</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center text-primary">Quản Lý Tài Khoản</h2>

    <!-- Bảng danh sách tài khoản -->
    <div class="card mt-3 shadow">
        <div class="card-header bg-dark text-white">
            <h5 class="mb-0">Danh Sách Tài Khoản</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th>Tên đăng nhập</th>
                    <th>Mật khẩu</th>
                    <th>Quyền</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tk" items="${taikhoan}">
                    <tr>
                        <td>${tk.NDT_UserName}</td>
                        <td>${tk.NDT_Pass}</td>
                        <td>${tk.NDT_Role}</td>
                        <td>
                            <!-- Nút Sửa -->
                            <button class="btn btn-warning btn-sm"
                                    onclick="editAccount('${tk.NDT_UserName}', '${tk.NDT_Pass}', '${tk.NDT_Role}')">
                                Sửa
                            </button>

                            <!-- Nút Xóa -->
                            <form action="delete" method="post" class="d-inline">
                                <input type="hidden" name="NDT_UserName" value="${tk.NDT_UserName}">
                                <button type="submit" class="btn btn-danger btn-sm"
                                        onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
                                    Xóa
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Form thêm tài khoản -->
    <div class="card mt-4 shadow">
        <div class="card-header bg-success text-white">
            <h5 class="mb-0">Thêm Tài Khoản</h5>
        </div>
        <div class="card-body">
            <form action="add" method="post" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Tên đăng nhập</label>
                    <input type="text" name="NDT_UserName" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Mật khẩu</label>
                    <input type="password" name="NDT_Pass" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Quyền</label>
                    <select name="NDT_Role" class="form-select" required>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-success">Thêm Tài Khoản</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Form sửa tài khoản (ẩn mặc định) -->
    <div id="editFormContainer" class="card mt-4 shadow" style="display: none;">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Sửa Tài Khoản</h5>
        </div>
        <div class="card-body">
            <form action="edit" method="post" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Tên đăng nhập</label>
                    <input type="text" id="editNDT_UserName" name="NDT_UserName" class="form-control" readonly>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Mật khẩu</label>
                    <input type="password" id="editNDT_Pass" name="NDT_Pass" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Quyền</label>
                    <select id="editNDT_Role" name="NDT_Role" class="form-select" required>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                    <button type="button" class="btn btn-secondary" onclick="hideEditForm()">Hủy</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Hiển thị form sửa tài khoản
    function editAccount(username, password, role) {
        document.getElementById('editNDT_UserName').value = username;
        document.getElementById('editNDT_Pass').value = password;
        document.getElementById('editNDT_Role').value = role;
        document.getElementById('editFormContainer').style.display = 'block';
    }

    // Ẩn form sửa tài khoản
    function hideEditForm() {
        document.getElementById('editFormContainer').style.display = 'none';
    }
</script>

</body>
</html>
