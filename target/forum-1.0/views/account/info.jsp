<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="text-center">Thông tin tài khoản</h1>


	<div class="row d-flex justify-content-center">
		<div class="container-fluid row">
		
		
			<form class="col-md-12 create-post"
				action='<c:url value="/account/info?action=update" />' method="post">
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
					<label for="fullName" class="col-sm-3 col-form-label">Họ tên</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="fullName"
							name="fullName" placeholder="Nhập họ tên" value="${account.fullName}" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="email" class="col-sm-3 col-form-label">Email</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Email" value="${account.email}" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="userPassword" class="col-sm-3 col-form-label">Mật khẩu</label>
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
					<label for="joinDate" class="col-sm-3 col-form-label">Ngày tham gia</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="joinDate"
							name="joinDate" value="${account.joinDate}" readonly>
					</div>
				</div>

				<div class="text-center">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="cb"
							onclick="showHidePassword()"> <label
							class="form-check-label" for="cb">Hiện mật khẩu</label>
					</div>

					<input type="hidden" id="author" name="author"
						value="${account.userName}">

					<div class="text-center">
						<button class="btn btn-success" type="submit">Cập nhật
							thông tin</button>
					</div>
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