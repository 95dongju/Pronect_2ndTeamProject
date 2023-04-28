<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<style>
		
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<form action="${conPath }/fcomment/reply.do">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="commentPageNum" value="${param.commentPageNum}">
		<input type="hidden" name="fid" value="${fcomment.fid }">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="fcgroup" value="${fcomment.fcgroup}">
		<input type="hidden" name="fcstep" value="${fcomment.fcstep}">
		<input type="hidden" name="fcindent" value="${fcomment.fcindent}">
		<input type="hidden" name="fcip" value="${fcomment.fcip}">
		<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
		<input type="submit" value="댓글저장" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
</body>
</html>