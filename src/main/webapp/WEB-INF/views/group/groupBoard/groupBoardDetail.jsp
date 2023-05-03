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
				<h5>등록된 댓글이 없습니다.</h5>
			</c:if>
			<c:if test="${not empty groupBoardComment }">
				<c:forEach var="gbComment" items="${groupBoardComment }">
					<h4>${gbComment.mid }</h4>
					<h5>${gbComment.group_board_rep_content }</h5>
				</c:forEach>
			</c:if>
			<textarea class="inputBox"></textarea><input type="submit" value="등록">	
			<div class="paging">
				<c:if test="${commentPaging.startPage > commentPaging.blockSize }">
					[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${commentPaging.startPage-1}">이전</a> ]
				</c:if>
				<c:forEach var="i" begin="${commentPaging.startPage }" end="${commentPaging.endPage }">
					<c:if test="${i eq commentPaging.currentPage }">
						[ <b> ${i } </b> ]
					</c:if>
					<c:if test="${i != commentPaging.currentPage }">
						[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${i}">${i }</a> ]
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage < paging.pageCnt }">
					[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${commentPaging.endPage+1}">다음</a> ]
				</c:if>
			</div>
		</c:if>		
	</div>
</body>
</html>