<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create</title>
</head>
<body>
	<h1 class="text-center">Tạo bài viết mới</h1>

	<div class="row d-flex justify-content-center">
		<div class="container-fluid row">
			<form class="col-md-12 create-post" 
			action='<c:url value="/post/create?action=create" />'
			 method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="title" name="title" placeholder="Nhập tiêu đề" required>
				</div>
				<div class="form-group">
				<label for="category">Thể loại bài viết</label>
					<select class="form-control" id="category" name="category">
						<c:forEach var="item" items="${category.listCate}">
							<option value="${item.cateId}">${item.cateName}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<textarea class="form-control" id="content" rows="10"
						name="content" required></textarea>
				</div>
				
				<input type="hidden"  id="author" name="author" value="${account.userName}">

				<div class="text-center">
					<button class="btn btn-success" type="submit">Đăng ngay</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>