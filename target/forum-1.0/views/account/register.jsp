<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký tài khoản</title>
</head>
<body>
	<div class="container-fluid">
		<h1 class="text-center">Đăng ký tài khoản</h1>
		<div class="row justify-content-center ">
			<form class="col-md-6"
				action='<c:url value="/account/register?action=register" />'
				method="post">
				
				<c:if test="${not empty alert}">
					<div class="form-group row" id="alert">
						<div class="col-sm-3 col-form-label"></div>
						<div class="col-sm-9">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								${alert}
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close" id="closeAlert">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
				</c:if>

				<div class="form-group row">
					<label for="userName" class="col-sm-3 col-form-label">Tên
						tài khoản</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="userName"
							name="userName" name="userName" placeholder="Nhập tên tài khoản"
							required>
					</div>
				</div>

				<div class="form-group row">
					<label for="userPassword" class="col-sm-3 col-form-label">Mật
						khẩu</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="userPassword"
							name="userPassword" name="password" placeholder="Nhập mật khẩu"
							required>
					</div>
				</div>

				<div class="form-group row">
					<label for="passwordConfirm" class="col-sm-3 col-form-label">Nhập
						lại mật khẩu</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="passwordConfirm"
							name="passwordConfirm" placeholder="Nhập lại mật khẩu" required>
					</div>
				</div>



				<div class="form-group row">
					<label for="fullName" class="col-sm-3 col-form-label">Họ
						tên</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="fullName"
							name="fullName" placeholder="Nhập họ tên" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="email" class="col-sm-3 col-form-label">Email</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Email" required>
					</div>
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
			var pw = document.getElementById("userPassword");
			var pwc = document.getElementById("passwordConfirm");
			if (pw.type === "password") {
				pw.type = "text";
				pwc.type = "text";
			} else {
				pw.type = "password";
				pwc.type = "password";
			}
		};
	</script>
</body>
</html>