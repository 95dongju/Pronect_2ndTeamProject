<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content {
			width: 800px; height:350px;
			margin: 50px auto;
		}
		img{width: 100px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.slim.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="content">
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>