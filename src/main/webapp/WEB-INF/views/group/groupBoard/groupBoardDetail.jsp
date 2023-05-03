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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
	  		$('#deleteGroupBoardContent').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning'
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/groupBoard/delete.do?group_bid=${param.group_bid}&gid=${param.gid }';
			        }
			    });
			    return false;
	  		});
	  	});
	</script>
</head>
<body>
	<div class="back">
		<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
	</div>
 	<div class="boardDetail">
		<c:if test="${not empty groupBoardDetail }">
			<h2 id="boardTitle">${groupBoardDetail.group_board_title }</h2>
			<h5 id="boardWriter">작성자: ${groupBoardDetail.mid } <span id="boardRdate">작성일: ${groupBoardDetail.group_board_rdate }</span> </h5>
			<c:if test="${groupBoardDetail.mid eq member.mid}">
				<pre id="deleteGroupBoardContent"> 삭제 </pre> <pre id="editGroupBoardContent"> 수정 </pre>
			</c:if>
			<p id="boardContent">${groupBoardDetail.group_board_content }</p>
			<div id="div_comment">
				<h4 id="boardComment">댓글</h4>
				<c:if test="${empty groupBoardComment }">
					<p id="boardCommentContent">등록된 댓글이 없습니다.</p>
				</c:if>
				<c:if test="${not empty groupBoardComment }">
					<c:forEach var="gbComment" items="${groupBoardComment }">
						<p id="boardCommentWriter">${gbComment.mid } <span id="boardCommentRdate">${gbComment.group_board_rep_rdate }</span> </p>
						<c:if test="${gbComment.mid eq member.mid}">
							<pre> 삭제 </pre> <pre> 수정 </pre>
						</c:if>
						<p id="boardCommentContent">${gbComment.group_board_rep_content }</p>
					</c:forEach>
				</c:if>
			</div>
			<textarea class="inputBox"></textarea><input type="submit" value="등록">	
			<div id="div_paging">
				<c:if test="${commentPaging.startPage > commentPaging.blockSize }">
					[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&boardPageNum=${param.boardPageNum }&commentPageNum=${commentPaging.startPage-1}">이전</a> ]
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