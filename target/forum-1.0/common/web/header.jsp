<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="row">
	<div class="header h-background">
		<p class="text-center h-name">FORUM</p>
	</div>
	<nav class="col navbar navbar-expand-lg navbar-light bg-light"
		style="padding: 20px; font-size: 15px">
		<a class="navbar-brand" href='<c:url value="/home" />'>Trang chủ</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<c:forEach var="item" items="${category.listCate}">
					<li class="nav-item active"><c:url var="detailURL"
							value="/post/category">
							<c:param name="id" value="${item.cateId}"></c:param>
						</c:url> <a class="nav-link" href="${detailURL}">${item.cateName}</a></li>
				</c:forEach>

				<c:if test="${not empty account}">
					<li class="nav-item active"><a class="nav-link"
						href="<c:url value="/post/create"/>">Tạo bài viết</a></li>

					<li class="nav-item active"><c:url var="mypost"
							value="/post/mypost">
							<c:param name="username" value="${account.userName}"></c:param>
						</c:url> <a class="nav-link" href="${mypost}">Bài viết của bạn</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="<c:url value="/account/info"/>">Thông tin tài khoản</a></li>

				</c:if>
			</ul>


			<div class="form-inline my-2 my-lg-0">
				<c:if test="${empty account}">
					<a class="btn btn-outline-success my-2 my-sm-0 h-marginbtn"
						href='<c:url value="/account/login" />'>Đăng nhập</a>
					<a class="btn btn-outline-success my-2 my-sm-0 h-marginbtn"
						href='<c:url value="/account/register" />'>Đăng ký</a>
				</c:if>
				<c:if test="${not empty account}">
					<b> <i>${account.fullName}</i></b>
					<a class="btn btn-outline-success my-2 my-sm-0 h-marginbtn"
						href='<c:url value="/account/logout" />' id="logout"
						onclick="logout()">Đăng xuất</a>
				</c:if>

			</div>
		</div>
	</nav>
</div>

<script>
	function logout() {
		if (confirm("Bạn muốn đăng xuất ?")) {
			document.getElementById("logout").href = "<c:url value="/account/logout" />";

		} else {
			document.getElementById("logout").href = "#";

		}
	}
</script>