<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
</head>
<body>
	<div class="container-fluid ">
	<h1 class = "text-center">This page for admin</h1>
		<c:forEach var="item" items="${post.postList}">
			<div class="row d-flex justify-content-center">
				<div class="col-md-10 home-card">
					<a href=""></a>
					<div>
						<p>${item.title}></p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>