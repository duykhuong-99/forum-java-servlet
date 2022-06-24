<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật bài viết</title>
</head>
<body>
	<h1 class="text-center">Cập nhật bài viết</h1>
	<div class="row d-flex justify-content-center">
		<div class="container-fluid row">
			<form class="col-md-12 create-post" 
			action='<c:url value="/post/update?action=update" />'
			method="post" id="updateform">
				<div class="form-group">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="Nhập tiêu đề" value="${post.title}">
				</div>
				<div class="form-group">
					<select class="form-control" id="category" name="category">
						<option value="choose" selected="selected" disabled>--Chọn thể loại bài viết--</option>
						<c:forEach var="item" items="${category.listCate}">
							<option value="${item.cateId}"
								<c:if test="${item.cateId ==post.category}"> selected="selected"</c:if>>
								${item.cateName}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<textarea class="form-control" id="content" rows="15"
						name="content" placeholder="">${post.content}</textarea>
				</div>
				
				<input type="hidden"  id="author" name="author" value="${account.userName}">
				<input type="hidden"  id="postId" name="postId" value="${post.postId}">

				<div class="text-center">
					<button class="btn btn-success" type="submit">Cập nhật</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>