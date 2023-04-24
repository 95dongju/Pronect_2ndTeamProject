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
	#content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
	img{width: 100px;}
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
			<tr><td colspan="3">
				<button onclick="location='modify.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">수정</button>
				<button onclick="location='list.do?pageNum=${param.pageNum}'">목록</button>
				<button onclick="location='delete.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">삭제</button>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>