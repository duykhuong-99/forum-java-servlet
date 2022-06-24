<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin của ${user_info}</title>
</head>
<body>
	<div class="main">
		<h1 class="text-center">Thông tin của ${user_info.userName}</h1>
		<div class="row d-flex justify-content-center">
			<div class="col-md-4 col-sm-4 col-xs-4">
				<form action="<c:url value="/admin/user/info?action=change_status" />" 
				method="post" style="margin: 20px">
					<div class="form-group">
						<label for="fullName">Họ tên</label> <input type="text" value="${user_info.fullName}"
							class="form-control" id="fullName" name="fullName" readonly>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email" value="${user_info.email}"
							class="form-control" id="email" name="email" readonly>
					</div>
					<div class="form-group">
						<label for="joinDate">Ngày tham gia</label> <input type="text" value="${user_info.joinDate}"
							class="form-control" id="joinDate" name="joinDate" readonly>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="radio" id="status"
								name="status" value="1"
								<c:if test="${user_info.status == 1}">checked</c:if>> <label
								class="form-check-label" for="status">Cho phép hoạt động</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" id="status"
								name="status" value="2"
								<c:if test="${user_info.status == 2}">checked</c:if>> <label
								class="form-check-label" for="status">Chặn bình luận và
								đăng bài</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" id="status"
								name="status" value="3"
								<c:if test="${user_info.status == 3}">checked</c:if>> <label
								class="form-check-label" for="status">Khóa tài khoản</label>
						</div>
						
						<input type="hidden" name="userName" value="${user_info.userName}"/>
					</div>
					<div class="text-center">
						<button class="btn btn-primary">Cập nhật</button>
					</div>
				</form>
				<div class="text-center">
					<c:url var="deleteAccount" value="/admin/user/info">
						<c:param name="action" value="delete_user"></c:param>
						<c:param name="userName" value="${user_info.userName}"></c:param>
					</c:url>
					<a class="btn btn-danger" href="${deleteAccount}" role="button">Xóa
						tài khoản</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>