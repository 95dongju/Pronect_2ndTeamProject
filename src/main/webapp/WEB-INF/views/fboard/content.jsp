<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  	$(document).ready(function(){
  		
  	});
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${modifyResult eq SUCCESS }">
		<script>alert('글 수정에 성공하였습니다');</script>
	</c:if>
	<c:if test="${modifyResult eq 0 }">
		<script>alert('글 수정을 실패했습니다'); history.back();</script>
	</c:if>
	<!-- ${bDto } ${param.fid } ${param.pageNum } 들어옴 -->
	<table>
		<caption>글 내용</caption>
		<tr><th>글번호</th><td>${fDto.fid}</td></tr>
		<tr><th>글쓴이</th><td>${fDto.mid}</td></tr>
		<tr><th>제목</th><td>${fDto.ftitle}</td></tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${fDto.frdate }" type="both" dateStyle="short"/></td>
		</tr>
		<tr><th>본문</th><td><pre>${fDto.fcontent }</pre></td></tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${not empty fDto.ffile }">
					<a href="${conPath }/fboardFile/${fDto.ffile}">${fDto.ffile}</a>
				</c:if>
				<c:if test="${empty fDto.ffile }">
					첨부파일없음
				</c:if>
			</td>
		</tr>
		<tr><th>IP</th><td>${fDto.fip }</td></tr>
		<tr><th>조회수</th><td>${fDto.fhit }</td></tr>
		<tr><th>좋아요</th><td>${fDto.flike }</td></tr>
		<tr>
			<td colspan="2">
				<c:if test="${member.mid eq fDto.mid}">
					<button onclick="location='${conPath}/fboard/modify.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
				</c:if>
				<c:if test="${member.mid eq fDto.mid or member.manager eq 'Y'}">
					<button onclick="location='${conPath}/fboard/delete.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">삭제</button>				
				</c:if>
				<button onclick="location='${conPath}/fboard/reply.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">답변</button>
				<button onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button>
			</td>
		</tr>
	</table>
</body>
</html>
















