<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container-fluid ">
		<h1 class="text-center ">Đăng nhập</h1>
		<div class="row justify-content-center ">
			<form class="col-md-6"
				action='<c:url value="/account/login?action=login" />' method="post">
				<div class="form-group">
					<label for="username">Tên tài khoản</label> <input type="text"
						class="form-control" id="userName" name="userName"
						aria-describedby="userName" placeholder="Nhập tên tài khoản"
						required>
				</div>

				<div class="form-group">
					<label for="password">Nhập mật khẩu</label> <input type="password"
						class="form-control" id="userPassword" name="userPassword"
						placeholder="Mật khẩu" required>
				</div>
				<div class="col text-center">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="cb"
							onclick="showHidePassword()"> <label
							class="form-check-label" for="cb">Hiện mật khẩu</label>
					</div>
					<button type="submit" class="btn btn-success">Đăng nhập</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		function showHidePassword() {
			var x = document.getElementById("userPassword");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>
</body>
</html>