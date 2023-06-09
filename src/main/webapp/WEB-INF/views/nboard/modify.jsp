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
  <style>
		#content{width:700px;	margin:40px auto;}
  	#qnaModifyInfo {
			width:150px;
			font-size: 0.9em;
			font-weight: 900;
			padding: 0 0.75em 0.75em 0.75em;
			text-align: center;
			vertical-align: middle;
		}
		#btnContainer{text-align:center;}
		#btn{ margin:0 10px 0 10px;}
		textarea{resize : none;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div>
			<form action="${conPath }/nboard/modify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mid" value="${member.mid }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="nid" value="${nDto.nid }">
				<input type="hidden" name="schItem" value="${param.schItem }">
				<input type="hidden" name="schWord" value="${param.schWord }">
				<h1>${qDto.qid }번 글 수정</h1>
				<table>
					<tr><th id="qnaModifyInfo">제목</th><td><input type="text" name="ntitle" required="required" value="${nDto.ntitle }"></td></tr>
					<tr><th id="qnaModifyInfo">본문</th><td><textarea rows="5" cols="20" name="ncontent">${nDto.ncontent }</textarea></td></tr>
					<tr><th id="qnaModifyInfo">첨부파일</th><td><input type="file" name="tempNfile">${nDto.nfile }</td></tr>
					<tr>
						<td id="btnContainer" colspan="2">
							<input type="submit" value="수정" id="btn">
							<input type="reset" value="초기화" id="btn">
							<input type="button" value="목록" onclick="location='${conPath}/nboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'" id="btn">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>

















