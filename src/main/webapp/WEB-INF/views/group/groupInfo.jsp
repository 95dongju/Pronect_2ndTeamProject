<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<style>
		#img{width:40px; height:40px; border-radius: 30px; margin-right: 10px;}
		.commentItem_writer{display:flex; align-items: center;}
		.commentItem_title {display:flext; flex-direction: column;}
	</style>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
	  		$('#deleteBtn').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/group/commentDelete.do?gid=${param.gid }&pageNum=${param.pageNum}';
			        }
			    });
			    return false;
	  		});
	  	});
	  	
		function modifyComment(gcid, pageNum, gid){
			$.ajax({
				url : '${conPath}/group/commentModify.do',
				data : {'gcid':gcid, 'pageNum':pageNum, 'gid':gid},
				type : 'get',
				dataType : 'html',
				success : function(data, status){
					$('.reply'+gcid).html(data);
				}
			});
		}
		
		function confirmSubmit(){
		    Swal.fire({
		        title: '댓글 작성을 완료하시겠습니까?',
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

</body>
</html>