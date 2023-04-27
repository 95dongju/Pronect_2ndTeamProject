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
</head>
<body>
	<form action="${conPath }/fboard/modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="fid" value="${fDto.fid }">
		<input type="hidden" name="fip" value="${fDto.fip }">
		<input type="hidden" name="schItem" value="${param.schItem }">
		<input type="hidden" name="schWord" value="${param.schWord }">
		<table>
			<caption>${fDto.fid }번 글 수정</caption>
			<tr><th>제목</th><td><input type="text" name="ftitle" required="required" value="${fDto.ftitle }"></td></tr>
			<tr><th>본문</th><td><textarea rows="5" cols="20" name="fcontent">${fDto.fcontent }</textarea></td></tr>
			<tr><th>첨부파일</th><td><input type="file" name="tempFfile">${fDto.ffile }</td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
















