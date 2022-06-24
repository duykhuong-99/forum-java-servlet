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
	<div class="container-fluid">
		<c:forEach var="item" items="${post.postList}">
			<div class="row d-flex justify-content-center">
				<div class="col-md-10 home-card row">
				<div class="col-md-10 col-sm-9">
					<c:url var="detailURL" value="/post/detail"> 
						<c:param name="id" value="${item.postId}"></c:param>
					</c:url>
						<a href="${detailURL}" class="atitle">
							<p class="title">${item.title}</p>
						</a>
					</div>
					<div class="col-md-2 col-sm-3">Lượt like: ${item.likes}</div>
					<div class="col-md-12 info-post">
						 &nbsp;&nbsp;&nbsp;&nbsp;
						Được viết bởi: <a href="">${item.author}</a>
						 vào ngày: ${item.createDate}

					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>