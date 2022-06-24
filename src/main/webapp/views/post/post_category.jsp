<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forum</title>
</head>
<body>
	<div class="main">
		<c:forEach var="item" items="${post.postList}">
			<div class="row d-flex justify-content-center">
				<div class="col-md-10 home-card row">
				<div class="col-md-10 col-sm-9">
					<c:url var="detailURL" value="/post/detail"> 
						<c:param name="id" value="${item.postId}"></c:param>
					</c:url>
						<a href="${detailURL}" class="atitle">
							${item.title}
						</a>
					</div>
					
					<div class="col-md-12 info-post">
						Được viết bởi: <a href=""  style="text-decoration: none">${item.author}</a>
						 vào ngày: ${item.createDate}

					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>