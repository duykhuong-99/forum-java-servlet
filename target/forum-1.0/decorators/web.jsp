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
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


</head>
<body>
	<div class="container-fluid">
		<!-- header -->
		<%@ include file="/common/web/header.jsp"%>
		<!-- header -->

		<div>
			<dec:body />
		</div>
		<!-- footer -->
		<%@ include file="/common/web/footer.jsp"%>
		<!-- footer -->
	</div>

</body>
</html>