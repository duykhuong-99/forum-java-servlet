<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${post.title}</title>
</head>
<body>
	<div class="main">
		<div class="row">
			<div class="col-md-2 "></div>
			<div class="col-md-8 post-detail">
				<h1 class="post-detail-title">${post.title}</h1>

				<div class="post-detail-info">
					<button class="btn btn-primary">
						<i class="fa fa-thumbs-up" aria-hidden="true"></i>&nbsp;
						${post.likes}
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp; Đăng ngày ${post.createDate} bởi <a
						href="" style="text-decoration: none">${post.author}</a>
				</div>

				<div class="post-detail-content">
					<p>${post.content}</p>
				</div>

				<div class="post-detail-comment">

					<!-- Chưa đăng nhập -->
					<c:if test="${empty account}">
						<p class="text-center login-to-comment">
							<a href="<c:url value="/account/login" />"
								style="text-decoration: none">Đăng nhập</a> để bình luận bải
							viết
						</p>
					</c:if>

					<!-- Đã đăng nhập -->
					<c:if test="${not empty account}">
						<form class="form-floating"
							action='<c:url value="/comment?action=newcomment" />'
							method="post">
							<div class="form-floating">
								<textarea class="form-control" placeholder="Nhập bình luận..."
									style="height: 100px" id="content" name="content"></textarea>
								<label for="content">Nhập bình luận ...</label>
							</div>
							<input type="hidden" id="postId" name="postId"
								value="${post.postId}"> <input type="hidden"
								id="userName" name="userName" value="${account.userName}">
							<div class=" d-flex justify-content-end">
								<button class="btn btn-success">Đăng bình luận</button>
							</div>
						</form>
					</c:if>

					<!-- k có  bình luận-->
					<c:if test="${empty comment}">
						<h4 class="text-center">Chưa có bình luận</h4>
					</c:if>

					<!-- có  bình luận-->
					<c:forEach var="item" items="${comment}">
						<div class="comment">
							<div class="comment-info">
								<a href="#" style="text-decoration: none">${item.userComment}</a>,
								ngày ${item.cmtDate}

							</div>
							<div class="comment-content">${item.content}</div>
							<c:if test="${account.isAdmin == 0}">
								<div class="d-flex justify-content-end">

									<c:url var="delete" value="/comment">
										<c:param name="postId" value="${post.postId}"></c:param>
										<c:param name="action" value="delete"></c:param>
										<c:param name="commentId" value="${item.commentId}"></c:param>
									</c:url>
									<a class="btn btn-outline-danger " href='${delete}'>Xóa
										bình luận</a>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>