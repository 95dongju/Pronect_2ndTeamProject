<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
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
</style>
</head>
<body>
	<c:if test="${joinResult eq 1 }">
		<script>alert('${mDto} 회원가입 감사합니다');</script>
	</c:if>
	<c:if test="${not empty loginResult}">
		<script>alert('${loginResult}');</script>
	</c:if>
	<c:if test="${not empty searchIdResult}">
		<script>alert('${searchIdResult}');</script>
	</c:if>
	<c:if test="${not empty searchPwResult}">
		<script>alert('${searchPwResult}');</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			location.href='${conPath}/main/main.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member/login.do" method="post">
		<table>
			<caption>로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" required="required" value="${mid }"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" required="required" value="${mpw }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
	<button type="button" onclick="location.href='${conPath}/member/searchId.do'" >아이디를 잊으셨나요?</button>
	<button type="button" onclick="location.href='${conPath}/member/searchPw.do'" >비밀번호를 잊으셨나요?</button>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
