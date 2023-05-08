<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<script src="${conPath }/js/summernote/summernote-lite.js"></script>
	<script src="${conPath }/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${conPath }/css/summernote/summernote-lite.css">
	<style>
		#writeGroupBoard h2 {
			text-align: center;
		}
		#div_writeBtn {
			text-align: center;
		}
		#div_writeBtn input {
			margin: 10px;
		}
	</style>
	 <script>
	 	$.getScript('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js', function(){
	 		var setting = {
	 	            height : 300,
	 	            minHeight : null,
	 	            maxHeight : null,
	 	            focus : true,
	 	            lang : 'ko-KR',
	 	           disableResizeEditor: true,
	 	           toolbar: [
	 				    ['fontname', ['fontname']],
	 				    ['fontsize', ['fontsize']],
	 				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	 				    ['color', ['forecolor','color']],
	 				    ['para', ['paragraph']],
	 				    ['height', ['height']],
	 				    ['insert',['picture']],
	 				  ],
	 				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	 				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	 	            /* callbacks : { 
	 	            	onImageUpload : function(files, editor, welEditable) {
	 	            		if(files[0].size > 1024*1024*5){
	 	            			alert("5MB 이상의 파일은 업로드 불가능합니다.");
	 	            			return false;
	 	            		}else { 	            			
				 	            uploadSummernoteImageFile(files[0], this);
	 	            		}
 	            		}
 	            	} */
         	};
        	$('#summernote').summernote(setting);
		});
		/* function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "groupBoard/write.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(editor).summernote('insertImage', data.url);
				}
			});
		}*/
	 </script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
	<jsp:include page="../groupDetailHeader.jsp"/>
	<!-----------------------------------------------------그룹 본문------------------------------------------------------------------->
	<div id="main">
		<div id="writeGroupBoard">
		<h2>그룹게시판 글쓰기</h2>
			<form action="${conPath }/groupBoard/write.do?pageNum=${param.pageNum}" method="post" enctype="multipart/form-data">
				<input type="hidden" name="gid" value="${groupDetail.gid }">
				<input type="hidden" name="mid" value="${member.mid }">
				<input type="text" name="group_board_title" placeholder="제목을 입력하세요" required="required">
				<textarea id="summernote" name="group_board_content" class="inputBox" required="required"></textarea>
				<div id="div_writeBtn">
				<input type="submit" value="작성"><input type="button" value="목록" id="groupBoardListBtn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>