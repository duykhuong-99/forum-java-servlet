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
	<div class="main">
		<h1 class="text-center ">Đăng nhập</h1>
		<div class="row d-flex justify-content-center">
			<div class="col-md-5">
			<form action='<c:url value="/account/login?action=login" />' method="post">
				<c:if test="${not empty alert}">
					<div class="form-group" id="alert">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							${alert}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close" id="closeAlert">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
				</c:if>

				<c:if test="${not empty message}">
					<div class="form-group" id="alert">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							${message}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close" id="closeAlert">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
				</c:if>

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