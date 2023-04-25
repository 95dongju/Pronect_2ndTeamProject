<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<table>
			<caption>${studyDetail.stitle }</caption>
			<tr><td>작성일</td><td colspan="2">${studyDetail.srdate }</td></tr>
			<tr><th>그룹장</th><td colspan="2">${studyDetail.mid }</td></tr>
			<tr><th>모집 인원</th><td colspan="2">${studyDetail.speople }</td></tr>
			<tr><th>내용</th><td colspan="2"><pre>${studyDetail.scontent }</pre></td></tr>
				<tr><th>사용 언어</th>
					<td>
						<c:if test="${empty studyDetail.slanguage1 and empty studyDetail.slanguage2 and empty studyDetail.slanguage3}">
							-
						</c:if>
						<c:if test="${not empty studyDetail.slanguage1 }">
								${studyDetail.slanguage1 }
						</c:if>
						<c:if test="${not empty studyDetail.slanguage2 }">
								/ ${studyDetail.slanguage2 }
						</c:if>
						<c:if test="${not empty studyDetail.slanguage3 }">
								/ ${studyDetail.slanguage3 }
						</c:if>
					</td>
				</tr>
			<tr><th>스터디 기간</th><td colspan="2">${studyDetail.ssdate } - ${studyDetail.sfdate}</td></tr>
			<tr><th>지역</th><td colspan="2">${studyDetail.sloc }</td></tr>
			<tr>
				<td colspan="3">
					<%-- <c:if test="${(not empty member and studyDetail.mid eq member.mid) or (not empty member and member.manager eq 'Y')}"> --%>
						<button onclick="location='modify.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">수정</button>
						<button onclick="location='list.do?pageNum=${param.pageNum}'">목록</button>
						<button onclick="location='delete.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">삭제</button>
					<%-- </c:if> --%>
					<c:if test="${empty member}">
						<button onclick="location='list.do?pageNum=${param.pageNum}'">목록</button>
					</c:if>
					<c:if test="${studyDetail.mid ne member.mid and empty joincheck}">
						<button onclick="location='list.do?pageNum=${param.pageNum}'">목록</button>
						<button onclick="location='join.do?sid=${studyDetail.sid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<!----------------------------------------------------- 댓글 ------------------------------------------------------->
	<div class="comment">
				<c:forEach var="dto" items="${studyComment }">
					<form action="${conPath}/study/comment.do" method="post">
						<input type="hidden" name="sid" value=${dto.sid }>
						<input type="hidden" name="scid" value=${dto.scid }>
						<input type="hidden" name="pageNum" value=${param.pageNum }>
						<hr>
						${dto.mid }님 | <fmt:formatDate value="${dto.scrdate }" pattern="yy-MM-dd hh:mm"/><br>
						<pre>${dto.sccontent }</pre>
						<br>
						<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
							<span><a class="comment_modify" style="color : black; text-decoration:none; cursor:pointer">수정 </a></span>
							<span><a href="${conPath}/SCommentDelete.do?sid=${dto.sid}&scid=${dto.scid}" style="color : black; text-decoration:none;">삭제</a></span><br>
						</c:if>
					</form>
				</c:forEach>
			</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>