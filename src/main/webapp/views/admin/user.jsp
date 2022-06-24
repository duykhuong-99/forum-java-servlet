<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý người dùng</title>
</head>
<body>
	<div class="main">
		<h1 class="text-center">Quản lý ngưới dùng</h1>
		<div class="row d-flex justify-content-center">
			<div class="col-md-10 col-sm-8 col-xs-8">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th></th>
							<th>Tên tài khoản</th>
							<th>Họ tên</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${listAccount}">
							<c:if test="${item.userName != account.userName && item.isAdmin == 1}">
								<tr>
									<td class="text-center"><c:url var="edit"
											value="/admin/user/info">
											<c:param name="userName" value="${item.userName}"></c:param>
										</c:url> <a class="btn btn-primary" href="${edit}"> <i
											class="fa fa-pencil-square-o" aria-hidden="true"></i>
									</a></td>
									<th>${item.userName}</th>
									<td>${item.fullName}</td>
									<td><c:if test="${item.status == 1}">Đang hoạt động</c:if>
										<c:if test="${item.status == 2}">Chặn bình luận</c:if> <c:if
											test="${item.status == 3}">Bị khóa</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>