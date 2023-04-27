<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<br>
	<div>
		<form action="${conPath}/fcomment/modify.do" method="post">
			<input type="hidden" name="fcid" value="${fcomment.fcid }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="commentPageNum" value="${param.commentPageNum}">
			<input type="hidden" name="fid" value="${fcomment.fid}">
			<c:forEach var="i" begin="1" end="${fcomment.fcindent }">
				<c:if test="${i==fcomment.fcindent }">
					&nbsp; &nbsp; &nbsp; └
				</c:if>
				<c:if test="${i!=fcomment.fcindent }">
					&nbsp; &nbsp; &nbsp; 
				</c:if>
			</c:forEach>
			<span style="display:block; height:30px; float:left; margin: 5px;">${fcomment.fcid }.</span>
			
			<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:30px; float:left; margin: 5px;">${fcomment.fccontent }</textarea>
			<input type="submit" value="수정" class="btn" style="height:30px; float:left; margin: 5px;">
		</form>
	</div>
	<p style="clear:both;"></p>
	<br>
</body>
</html>