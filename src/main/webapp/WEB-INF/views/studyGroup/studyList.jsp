<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.4.js"></Script>
  <script>
	  const trClicked = function(sid){
		  location.href='${conPath}/study/detail.do?sid='+sid+'&pageNum=${paging.currentPage}';
	  };
  </script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id=wrapper>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${writeResult eq SUCCESS }">
		<script>alert('글쓰기 성공');</script>
	</c:if>
	<c:if test="${writeResult eq FAIL }">
		<script>alert('글쓰기 실패');</script>
	</c:if>
	<c:if test="${not empty deleteResult }">
		<script>
			alert('${param.sid}번 글삭제 성공');
		</script>
	</c:if>
	<table>
		<caption>게시판</caption>
		<c:if test="${studyGroupLeader eq 0}">
			<tr><td><a href="${conPath}/study/register.do?pageNum=${paging.currentPage}">글쓰기</a></td></tr>
		</c:if>
	</table>
	<table>
		<tr>
			<th>글번호</th><th>글쓴이</th><th>글제목</th><th>내용</th><th>모집 인원</th>
			<th>사용 언어</th><th>작성일</th><th>스터디 기간</th><th>조회수</th><th>지역</th>
		</tr>
		<c:if test="${totCnt eq 0 }">
			<tr>
				<td colspan="10">해당 페이지의 글이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${totCnt != 0 }">
			<c:forEach var="dto" items="${studyList }">
				<tr onclick="trClicked(${dto.sid})">
					<td>${dto.sid }</td>
					<td>${dto.mid }</td>
					<td>${dto.stitle}</td>
					<td>${dto.scontent }</td>
					<td>${dto.speople }</td>
					<td>
						<c:if test="${empty dto.slanguage1 and empty dto.slanguage2 and empty dto.slanguage3}">
							-
						</c:if>
						<c:if test="${not empty dto.slanguage1 }">
								${dto.slanguage1 }
						</c:if>
						<c:if test="${not empty dto.slanguage2 }">
								/ ${dto.slanguage2 }
						</c:if>
						<c:if test="${not empty dto.slanguage3 }">
								/ ${dto.slanguage3 }
						</c:if>
					</td>
					<td><fmt:formatDate value="${dto.srdate }" pattern="yy/MM/dd(E) HH:mm"/></td>
					<td>
						<fmt:formatDate value="${dto.ssdate }" pattern="yy/MM/dd(E)"/> - <fmt:formatDate value="${dto.sfdate }" pattern="yy/MM/dd(E)"/>
					</td>
					<td>${dto.shit }</td>
					<td>${dto.sloc }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize}">
			[ <a href="${conPath }/study/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage}">
			<c:if test="${i eq pageNum }">
				[ <b>${i }</b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath}/study/list.do?pageNum=${i }">${i}</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/study/list.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>