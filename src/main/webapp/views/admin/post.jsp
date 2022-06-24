<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý bải viết</title>
</head>
<body>
	<div class="main">
		<h1 class="text-center">Quản lý bài viết</h1>
		<div class="row d-flex justify-content-center">
			<div class="col-md-10 col-sm-8 col-xs-8">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th></th>
							<th>Tiêu đề</th>
							<th>Người viết</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${listPost}">
							<c:if test="${item.author != account.userName}">
								<tr>
									<td class="text-center"><c:url var="deletePostAdmin"
											value="/admin/post">
											<c:param name="action" value="delete_post"></c:param>
											<c:param name="postId" value="${item.postId}"></c:param>
										</c:url> <a class="btn btn-danger" href="${deletePostAdmin}"> <i
											class="fa fa-trash-o" aria-hidden="true"></i>
									</a></td>

									<td>${item.title}</td>

									<td><c:url var="user_info" value="/admin/user/info">
											<c:param name="userName" value="${item.author}"></c:param>
										</c:url> <a class="btn text-primary" href="${user_info}">${item.author}</a>
									</td>
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