<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
    $(document).ready(function() {
        $('#summernote').summernote({
        	height: 300
        });
    });
  </script>
  <script>
  	$(function(){
  		$('#groupBoardListBtn').click(function(){
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/groupBoard/list.do?',
				datatype : 'html',
				data : "gid="+${gid}+"&pageNum="+${param.pageNum },
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
  	});
  </script>
</head>
<body>
	<div id="writeGroupBoard">
	<h2>그룹게시판 글쓰기</h2>
		<form action="${conPath }">
			<textarea id="summernote" name="editordata" class="inputBox"></textarea>
			<div id="div_writeBtn">
			<input type="submit" value="작성"><input type="button" value="목록" id="groupBoardListBtn">
			</div>
		</form>
	</div>
</body>
</html>