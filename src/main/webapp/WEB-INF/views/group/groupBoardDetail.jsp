<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="${conPath}/css/boardDetail.css" rel="stylesheet" />
</head>
<body>
	<div class="back">
		<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
	</div>
 	<div class="boardDetail">
		<c:if test="${not empty groupBoardDetail }">
				<h2>${groupBoardDetail.group_board_title }</h2>
				<h5>작성자: ${groupBoardDetail.mid }</h5>
				<p>${groupBoardDetail.group_board_content }</p>
				<h4>댓글</h4>
				<c:if test="${empty groupBoardComment }">
				<h5>댓글이 없습니다.</h5>
				</c:if>
				<c:if test="${not empty groupBoardComment }">
					<c:forEach var="gbComment" items="${groupBoardComment }">
						<h4>${gbComment.mid }</h4>
						<h5>${gbComment.group_board_rep_content }</h5>
					</c:forEach>
				</c:if>
				<textarea class="inputBox"></textarea><input type="submit" value="등록">
		</c:if>		
	</div>
</body>
</html>