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
<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
<script>
	$(document).ready(function(){
		$('tr:not(:first-child)').click(function(){
			var group_bid = Number($(this).children().eq(0).text());
			$.ajax({
				url : '${conPath}/groupBoard/detail.do?',
				datatype : 'html',
				data : "group_bid="+group_bid+"&gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
		$('#groupBoard_writeBtn').click(function(){
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/groupBoard/write.do?',
				datatype : 'html',
				data : "gid="+${groupDetail.gid}+"&pageNum="+${param.pageNum },
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
		$('#groupBoard_searchBtn').click(function(){
			let searchGroupBoard_Word = $('#searchGroupBoard_Word').val();
			let searchGroupBoard = $('#searchGroupBoard').val();
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/groupBoard/list.do?',
				datatype : 'html',
				data : "gid="+${groupDetail.gid }+"&pageNum="+${param.pageNum }+"&searchGroupBoard="+searchGroupBoard+"&searchGroupBoard_Word="+searchGroupBoard_Word,
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="groupBoardList">
		<h2>${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판 </h2>
		<table id="boardTable">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>좋아요</td>
				<td>조회수</td>
			</tr>
			<c:if test="${empty groupBoard }">
				<tr>
					<td colspan="5">작성된 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty groupBoard }">
				<c:forEach var="groupBoard" items="${groupBoard }">
					<tr>
						<td>${groupBoard.group_bid }</td>
						<td class="boardTitle">
							${groupBoard.group_board_title }
							<c:if test="${groupBoard.rep_cnt != 0 }">
							&nbsp; ( <b>${groupBoard.rep_cnt }</b> )
							</c:if>
						</td>
						<td>${groupBoard.mid }</td>
						<td>${groupBoard.group_board_like }</td>
						<td>${groupBoard.group_board_hit }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>		
		<div id="div_search">
			<select name="searchGroupBoard" id="searchGroupBoard" class="inputBox">
						<option value=""
							<c:if test="${param.searchGroupBoard eq '' }">selected="selected"</c:if>
						>검색 조건</option>
						<option value="mid" 
							<c:if test="${param.searchGroupBoard eq 'mid' }">selected="selected"</c:if>
						>아이디</option>
						<option value="title" 
							<c:if test="${param.searchGroupBoard eq 'title' }">selected="selected"</c:if>
						>제목</option>
						<option value="content" 
							<c:if test="${param.searchGroupBoard eq 'content' }">selected="selected"</c:if>
						>내용</option>
						<option value="hit" 
							<c:if test="${param.searchGroupBoard eq 'hit' }">selected="selected"</c:if>
						>조회수 높은 순</option>
						<option value="like" 
							<c:if test="${param.searchGroupBoard eq 'like' }">selected="selected"</c:if>
						>좋아요 높은 순</option>
						<option value="SearchAll" 
							<c:if test="${param.searchGroupBoard eq 'SearchAll' }">selected="selected"</c:if>
						>전체 검색</option>
			</select>
			<input type="text" name="searchGroupBoard_Word" id="searchGroupBoard_Word" class="inputBox">
			<input type="submit" value="검색" id="groupBoard_searchBtn">
			<button id="groupBoard_writeBtn">글쓰기</button>
		</div>
		<div id="div_paging">
			<c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/fboard/list.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/fboard/list.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/fboard/list.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
			</c:if>
		</div>
	</div>
</body>
</html>