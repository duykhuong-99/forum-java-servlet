<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="row">
	<div class="menu col-md-12">
		<a class="btn" href="<c:url value="/post/create"/>">Bài viết mới</a>
		<c:url var="mypost" value="/post/category">
			<c:param name="username" value="${account.userName}"></c:param>
		</c:url>
		<a class="btn" href="${mypost}">Bài viết mới</a>
		<a class="btn" href="<c:url value="/account/info"/>">Thông tin tài khoản</a>
	</div>
</div>