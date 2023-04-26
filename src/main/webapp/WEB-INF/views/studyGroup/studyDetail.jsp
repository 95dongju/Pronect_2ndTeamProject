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
	#studyDetail{
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
	#commentContent{
		border-radius: 10px;
	}
	#submitBtn{
		border-radius: 20px;
		background-color:black;
		color:white;
	}
	
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="main">
		<div id="back">
			<a href="list.do?pageNum=${param.pageNum}"><img class = "back" src="${conPath}/images/back.png"></a>
		</div>
		<table id="studyDetail">
			<tr><td colspan="6"><h1>${studyDetail.gtitle }</h1></td></tr>
			<tr><td colspan="6">${member.mimage} ${member.mid} | ${studyDetail.grdate}</td></tr>
			<tr><td colspan="6"><hr></td></tr>
			<tr><th>모집 구분</th><th colspan="2">프로젝트 / 스터디 </th>
					<th>모집 인원</th><th colspan="2">${studyDetail.gpeople }</th></tr>
			<tr><th>시작 예정</th><th colspan="2">${studyDetail.gsdate } </th>
					<th>지역</th><th colspan="2">${studyDetail.gloc }</th></tr>
			<tr><th>완료 예정</th><th colspan="2">${studyDetail.gsdate }</th></tr>
				<tr><th>사용 언어</th>
					<td colspan="4">
						<c:if test="${empty studyDetail.glanguage1 and empty studyDetail.glanguage2 and empty studyDetail.glanguage3}">
							-
						</c:if>
						<c:if test="${not empty studyDetail.glanguage1 }">
								${studyDetail.glanguage1 }
						</c:if>
						<c:if test="${not empty studyDetail.glanguage2 }">
								/ ${studyDetail.glanguage2 }
						</c:if>
						<c:if test="${not empty studyDetail.glanguage3 }">
								/ ${studyDetail.glanguage3 }
						</c:if>
					</td>
				</tr>
			<tr><td><h1>프로젝트 소개</h1></td></tr>
			<tr><td><hr></td></tr>
			<tr><td colspan="6"><pre>${studyDetail.gcontent }</pre></td></tr>
			<tr>
				<td colspan="4">
 					<c:if test="${not empty member}">
						<c:if test="${studyDetail.mid ne member.mid and empty joincheck}">
							<button onclick="location='join.do?sid=${studyDetail.sid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
						</c:if>
						<c:if test="${studyDetail.mid ne member.mid and not empty joincheck}">
							<button onclick="location='unJoin.do?sid=${studyDetail.sid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
						</c:if>
						<c:if test="${studyDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
							<button onclick="location='modify.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">수정</button>
							<button onclick="location='delete.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">삭제</button>
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
	<hr>
		<h2>0개의 댓글이 있습니다.</h2>
		<form action="#">
			<fieldset id="commentContent">
				<textarea placeholder="댓글을 입력하세요." rows="5" cols="30" ></textarea>
			</fieldset>
			<input id="submitBtn" type="submit" value="댓글 등록">
		</form>
	<hr>
	<div class="comment">
		<c:forEach var="dto" items="${studyComment }">
			<form action="${conPath}/study/comment.do" method="post">
				<input type="hidden" name="sid" value=${dto.gid }>
				<input type="hidden" name="scid" value=${dto.gcid }>
				<input type="hidden" name="pageNum" value=${param.pageNum }>
				<hr>
				${dto.mimage } <b>${dto.mid }</b><br>
				<fmt:formatDate value="${dto.scrdate }" pattern="yy-MM-dd hh:mm"/><br>
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