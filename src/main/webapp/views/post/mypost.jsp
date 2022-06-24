<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bài viết của bạn</title>
</head>
<body>
	<div class="main">
		<div class="row d-flex justify-content-center">
			<c:forEach var="item" items="${post.postList}">
				<div class="card col-md-3">
					<div class="card-body">
						<h5 class="card-title mypost-title">${item.title}</h5>
						<h6 class="card-subtitle mb-2 text-muted">
							<i class="fa fa-thumbs-up" aria-hidden="true"></i>&nbsp;
							${item.likes}
							&nbsp;&nbsp;-&nbsp;&nbsp;
							Ngày: ${item.createDate}
						</h6>
						<div class="text-center ">

							<c:url var="detail" value="/post/detail">
								<c:param name="id" value="${item.postId}"></c:param>
							</c:url>
							<a href='${detail}' class="card-link btn btn-success"> <i
								class="fa fa-search" aria-hidden="true"></i></a>

							<c:url var="update" value="/post/update">
								<c:param name="username" value="${account.userName}"></c:param>
								<c:param name="id" value="${item.postId}"></c:param>
							</c:url>
							<a href='${update}' class="card-link btn btn-primary"> <i
								class="fa fa-pencil-square-o" aria-hidden="true"></i></a>

							<c:url var="delete" value="/post/delete">
								<c:param name="action" value="delete"></c:param>
								<c:param name="id" value="${item.postId}"></c:param>
								<c:param name="username" value="${account.userName}"></c:param>
							</c:url>
							<a href="${delete}" class="card-link btn btn-danger"><i
								class="fa fa-trash" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>