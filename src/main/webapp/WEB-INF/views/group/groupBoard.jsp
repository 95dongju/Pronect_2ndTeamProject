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
<script>
	$(document).ready(function(){
		$('tr:not(:first-child)').click(function(){
			let group_bid = Number($(this).children().eq(0).text());
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/groupBoard/detail.do?',
				datatype : 'html',
				data : "group_bid="+group_bid,
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판 </h2>
	<form action="${conPath }/groupBoard/list.do?pageNum=${param.pageNum }&searchGroupBoard=${param.searchGroupBoard}&searchGroupBoard_Word=${param.searchGroupBoard_Word}">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
	<input type="hidden" name="gid" value="${groupDetail.gid }">
		<table id="boardTable">
			<c:if test="${not empty groupBoard }">
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>좋아요</td>
					<td>조회수</td>
				</tr>
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
		<select name="searchGroupBoard" class="inputBox">
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
		<input type="text" name="searchGroupBoard_Word" class="inputBox">
		<input type="submit" value="검색">
	</form>
</body>
</html>