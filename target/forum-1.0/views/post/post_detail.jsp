<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<body>
	<div class="container-fluid ">
		<div class="row d-flex justify-content-center">
			<div class="col-md-10 row post-detail">
				<div class="col-md-12 col-sm-12">
					<h1 class="col-md-12 post-detail-title">${post.title}</h1>
				</div>
				<div class="col-md-12 col-sm-12 post-detail-info">
					<button class="btn btn-primary">
						<i class="fa fa-thumbs-up" aria-hidden="true"></i>&nbsp;
						${post.likes}
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp; Đăng ngày ${post.createDate} bởi <a
						href="">${post.author}</a>
				</div>
				<div class="col-md-12 col-sm-12 post-detail-content">
					<p>${post.content}</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>