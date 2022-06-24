<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><dec:title default="Trang chủ" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value='/template/css/header.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/css/footer.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/css/style.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/css/style.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/css/post.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/css/menu.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/template/css/account.css' />"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">


</head>
<body>
	<div class="container-fluid" style="margin: 0; padding: 0">
		<!-- header -->
		<%@ include file="../views/web/header.jsp"%>
		<!-- header -->
		<div>
			<dec:body />
		</div>
		<!-- footer -->
		<%@ include file="../views/web/footer.jsp"%>
		<!-- footer -->
	</div>

</body>
</html>