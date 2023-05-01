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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		function confirmSubmit(){
		    Swal.fire({
		        title: '답변을 작성하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm').submit();
		        }
		    });
		    return false;
		}
	</script>
</head>
<body>
	<form id="frm" action="${conPath }/fboard/reply.do" method="post" enctype="multipart/form-data" onsubmit="return confirmSubmit();">		
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="schItem" value="${param.schItem }">
		<input type="hidden" name="schWord" value="${param.schWord }">
		<input type="hidden" name="fgroup" value="${fDto.fgroup }">
		<input type="hidden" name="fstep" value="${fDto.fstep }">
		<input type="hidden" name="findent" value="${fDto.findent }">
		<table>
			<caption>글 작성</caption>
			<tr><th>제목</th><td><input type="text" name="ftitle" required="required" value="[답]${fDto.ftitle }"></td></tr>
			<tr><th>본문</th><td><textarea rows="5" cols="20" name="fcontent"></textarea></td></tr>
			<tr><th>첨부파일</th><td><input type="file" name="tempFfile"></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

















