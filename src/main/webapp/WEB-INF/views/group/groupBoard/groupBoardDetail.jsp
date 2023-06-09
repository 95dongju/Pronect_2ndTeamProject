<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
	<script>
		$(document).ready(function(){
			var pageNum = ${param.pageNum};
			if(pageNum == null || pageNum == ''){
				pageNum = 1;
			}
			$('tr:not(:first-child)').click(function(){
				if(${not empty groupBoard}){
					var group_bid = Number($(this).children().eq(0).text());
					location.href='${conPath}/groupBoard/detail.do?group_bid='+group_bid+'&gid='+${groupDetail.gid}+'&pageNum='+pageNum;
				}
			});
			$('#groupBoard_writeBtn').click(function(){
				location.href='${conPath}/groupBoard/write.do?gid='+${groupDetail.gid}+'&pageNum='+pageNum;
			});
			$('#groupBoard_searchBtn').click(function(){
				let searchGroupBoard_Word = $('#searchGroupBoard_Word').val();
				let searchGroupBoard = $('#searchGroupBoard').val();
				document.getElementById('calendar').style.display = 'none';
				$('.groupDetail').html('');
				$.ajax({
					url : '${conPath}/groupBoard/list.do?',
					datatype : 'html',
					data : "gid="+${groupDetail.gid }+"&pageNum="+pageNum+"&searchGroupBoard="+searchGroupBoard+"&searchGroupBoard_Word="+searchGroupBoard_Word,
					success : function(data, status){
						$('.groupDetail').html(data);
					}
				});
			});
			$('#editGroupBoardContent').click(function(){
				location.href = '${conPath}/groupBoard/modify.do?group_bid=${param.group_bid}&gid=${param.gid }&pageNum='+pageNum;
			});
	  		$('#deleteGroupBoardContent').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning'
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/groupBoard/delete.do?group_bid=${param.group_bid}&gid=${param.gid }&pageNum='+pageNum;
			        }
			    });
			    return false;
	  		});
		});
	</script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
	<jsp:include page="../groupDetailHeader.jsp"/>
	<div id="main">
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
							<p id="boardCommentWriter">${gbComment.mid } <span id="boardCommentRdate">${gbComment.group_board_cmt_rdate }</span> </p>
							<c:if test="${gbComment.mid eq member.mid}">
								<pre> 삭제 </pre> <pre> 수정 </pre>
							</c:if>
							<p id="boardCommentContent" style="all: none;">${gbComment.group_board_cmt_content }</p>
						</c:forEach>
					</c:if>
				</div>
				<form action="${conPath }/groupBoardComment/write.do?group_bid=${groupBoardDetail.group_bid}">
					<input type="hidden" name="gid" value="${groupBoardDetail.gid }">
					<input type="hidden" name="mid" value="${member.mid }">
					<input type="hidden" name="group_bid" value="${groupBoardDetail.group_bid}">
					<textarea class="inputBox" name="group_board_cmt_content"></textarea>
					<input type="submit" value="등록">	
				</form>
				<div id="div_paging">
					<c:if test="${commentPaging.startPage > commentPaging.blockSize }">
						[ <a href="${conPath }/groupBoard/detail.do?gid=${param.gid}&boardPageNum=${param.boardPageNum }&commentPageNum=${commentPaging.startPage-1}">이전</a> ]
					</c:if>
					<c:forEach var="i" begin="${commentPaging.startPage }" end="${commentPaging.endPage }">
						<c:if test="${i eq commentPaging.currentPage }">
							[ <b> ${i } </b> ]
						</c:if>
						<c:if test="${i != commentPaging.currentPage }">
							[ <a href="${conPath }/groupBoard/detail.do?gid=${param.gid}&boardPageNum=${param.boardPageNum }&commentPageNum=${i}">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.pageCnt }">
						[ <a href="${conPath }/groupBoard/detail.do?gid=${param.gid}&boardPageNum=${param.boardPageNum }&commentPageNum=${commentPaging.endPage+1}">다음</a> ]
					</c:if>
				</div>
			</c:if>		
		</div>
	</div>
	<jsp:include page="../../main/footer.jsp"/>
</body>
</html>