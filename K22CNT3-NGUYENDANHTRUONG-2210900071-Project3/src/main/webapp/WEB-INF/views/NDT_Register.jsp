<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
<h2 class="text-center mb-4">Đăng ký tài khoản</h2>

<!-- Hiển thị thông báo lỗi nếu có -->
<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<form action="${pageContext.request.contextPath}/register" method="post" class="p-3 border rounded bg-light">
    <div class="mb-3">
        <label for="username" class="form-label">Tên tài khoản:</label>
        <input type="text" id="username" name="NDT_UserName" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Mật khẩu:</label>
        <input type="password" id="password" name="NDT_Pass" class="form-control" required>
    </div>

    <!-- Trường ẩn để đảm bảo quyền luôn là "user" -->
    <input type="hidden" name="NDT_Role" value="user">

    <button type="submit" class="btn btn-primary">Đăng ký</button>
</form>
</body>
</html>
