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
	<link href="${conPath }/css/boardContent.css" rel="stylesheet">
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
		        title: '글 수정을 완료하시겠습니까?',
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
	<jsp:include page="../main/header.jsp"/>
	<form id="frm" action="${conPath }/fboard/modify.do" method="post" enctype="multipart/form-data" onsubmit="return confirmSubmit();">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="fid" value="${fDto.fid }">
		<input type="hidden" name="fip" value="${fDto.fip }">
		<input type="hidden" name="schItem" value="${param.schItem }">
		<input type="hidden" name="schWord" value="${param.schWord }">
		<div class="board_wrap">
	        <div class="board_title">
	            <strong>자유게시판</strong>
	            <p>ProNect에서 자유롭게 ConNect</p>
	        </div>
	        <p>${fDto.fid }번 글 수정</p>
	        <div class="board_write_wrap">
	            <div class="board_write">
	                <div class="title">
	                    <dl>
	                        <dt>제목</dt><dd><input type="text" name="ftitle" required="required" value="${fDto.ftitle }"></dd>
	                    </dl>
	                </div>
	                <div class="info">
	                    <dl>
	                        <dt>첨부파일</dt><dd><input type="file" name="tempFfile">${fDto.ffile }</dd>
	                    </dl>
	                </div>
	                <div class="cont">
	                	<textarea rows="5" cols="20" name="fcontent">${fDto.fcontent }</textarea>
	                </div>
	            </div>
	            <div class="bt_wrap">
	                <button type="submit">수정</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'" >목록</button>
	            </div>
	        </div>
	    </div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>

















