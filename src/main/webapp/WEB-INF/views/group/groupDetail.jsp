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
<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
	#back {
		width: 1000px;
		margin: 0 auto;
	}
	#groupDetail{
		width: 1000px;
		margin: 0 auto;
	}
	.back{
		width : 30px;
		text-align: left;
	}
	button{
		text-align: center;
	}
	
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="main">
		<div id="back">
			<a href="list.do?pageNum=${param.pageNum}"><img class = "back" src="${conPath}/images/back.png"></a>
		</div>
		<table id="groupDetail">
			<tr><td colspan="6"><h1>${groupDetail.gtitle }</h1></td></tr>
			<tr><td colspan="6">${groupDetail.mimage} ${groupDetail.mid} | ${groupDetail.grdate}</td></tr>
			<tr><td colspan="6"><hr></td></tr>
			<tr><th>모집 구분</th><th colspan="2">프로젝트 / 스터디 </th>
					<th>모집 인원</th><th colspan="2">${groupDetail.gpeople }</th></tr>
			<tr><th>시작 예정</th><th colspan="2">${groupDetail.gsdate } </th>
					<th>지역</th><th colspan="2">${groupDetail.gloc }</th></tr>
			<tr><th>완료 예정</th><th colspan="2">${groupDetail.gsdate }</th>
					<th>모집 인원</th><th colspan="2">${groupDetail.gpeople }</th></tr>
				<tr><th>사용 언어</th>
					<td colspan="4">
						<c:if test="${empty groupDetail.glanguage1 and empty groupDetail.glanguage2 and empty groupDetail.glanguage3}">
							-
						</c:if>
						<c:if test="${not empty groupDetail.glanguage1 }">
								${groupDetail.glanguage1 }
						</c:if>
						<c:if test="${not empty groupDetail.glanguage2 }">
								/ ${groupDetail.glanguage2 }
						</c:if>
						<c:if test="${not empty groupDetail.glanguage3 }">
								/ ${groupDetail.glanguage3 }
						</c:if>
					</td>
				</tr>
			<tr><th>내용</th><td colspan="2"><pre>${groupDetail.scontent }</pre></td></tr>
			<tr>
				<td colspan="4">
 					<c:if test="${not empty member}">
						<c:if test="${groupDetail.mid ne member.mid and empty joincheck}">
							<button onclick="location='join.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
						</c:if>
						<c:if test="${groupDetail.mid ne member.mid and not empty joincheck}">
							<button onclick="location='unJoin.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
						</c:if>
						<c:if test="${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
							<button onclick="location='modify.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">수정</button>
							<button onclick="location='delete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">삭제</button>
						</c:if>
					</c:if>
					<c:if test="${empty member}">
						<button onclick="location='${conPath}/member/login.do'">참가 신청</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<!----------------------------------------------------- 댓글 ------------------------------------------------------->
	<div class="comment">
				<c:forEach var="dto" items="${studyComment }">
					<form action="${conPath}/group/comment.do" method="post">
						<input type="hidden" name="gid" value=${dto.gid }>
						<input type="hidden" name="scid" value=${dto.scid }>
						<input type="hidden" name="pageNum" value=${param.pageNum }>
						<hr>
						${dto.mid }님 | <fmt:formatDate value="${dto.scrdate }" pattern="yy-MM-dd hh:mm"/><br>
						<pre>${dto.sccontent }</pre>
						<br>
						<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
							<span><a class="comment_modify" style="color : black; text-decoration:none; cursor:pointer">수정 </a></span>
							<span><a href="${conPath}/SCommentDelete.do?gid=${dto.gid}&scid=${dto.gcid}" style="color : black; text-decoration:none;">삭제</a></span><br>
						</c:if>
					</form>
				</c:forEach>
			</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>