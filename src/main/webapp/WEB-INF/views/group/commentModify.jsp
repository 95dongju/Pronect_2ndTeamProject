<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		        title: '댓글 수정을 완료하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm2').submit();
		        }
		    });
		    return false;
		}
	</script>
	<style>
		.commentItem_writer img{
			width: 40px;
			height: 40px;
			border-radius: 100%;
			margin-right: 20px;
		}
		.commentItem_writer{display:flex; align-items: center; margin-bottom:20px;}
		.commentItem_title {display:flext; flex-direction: column;}
	</style>
</head>
<body>
	<br>
	<div>
		<form id="frm2" action="${conPath}/group/commentModify.do" method="post" onsubmit="return confirmSubmit();">
			<input type="hidden" name="gcid" value="${gcomment.gcid }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="gid" value="${gcomment.gid}">
			<div class="commentItem_writer"><img src="${conPath }/memberFile/${gcomment.mimage}" id="img" class="commentItem_userImg" alt="사용자 이미지">
				<div class="commentItem_userNickname">${gcomment.mnickname } 님</div>
			</div>
			<textarea rows="2" cols="5" name="gccontent" spellcheck="false" style="width:50%; height:30px; float:left; margin: 5px;">${gcomment.gccontent }</textarea>
			<input type="submit" value="수정" class="btn" style="line-height:30px; height:30px; float:left; margin: 5px;">
		</form>
	</div>
	<p style="clear:both;"></p>
	<br>
</body>
</html>