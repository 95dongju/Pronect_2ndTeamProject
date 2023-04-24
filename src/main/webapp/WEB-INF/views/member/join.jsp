<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
	#content {width: 800px; height:350px;margin: 50px auto;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		$('.idconfirm').click(function(){
			$.ajax({
				url : '${conPath}/member/idConfirm.do',
				datatype : 'html',
				data : "mid="+$('#mid').val(),
				success : function(data, status){
					$('#idConfirmMsg').html(data);
				}
			});
		});
		
		$('.nicknameconfirm').click(function(){
			$.ajax({
				url : '${conPath}/member/nicknameConfirm.do',
				datatype : 'html',
				data : "mnickname="+$('#mnickname').val(),
				success : function(data, status){
					$('#nicknameConfirmMsg').html(data);
				}
			});
		});
		
		$('#mid').click(function(){
			var mid = $(this).val();
			var patternMid = /^[a-zA-Z0-9_]+$/; // macth함수 사용
			if(mid.length<2){
				$('#idConfirmMsg').text('아이디는 2글자 이상');
			}else if(!mid.match(patternMid)){
				$('#idConfirmMsg').text('아이디는 영문자와 숫자 만 들어갈 수 있음');
			}else {
				$.ajax({
					url : '${conPath}/member/idConfirm.do',
					datatype : 'html',
					data : "mid="+$('#mid').val(),
					success : function(data, status){
						$('#idConfirmMsg').html(data);
					}
				});
			}
		});

		$('input[name="mpw"], input[name="mpwChk"]').keyup(function(){
  			var pw = $('input[name="mpw"]').val();
  			var pwChk = $('input[name="mpwChk"]').val();
  			if(pw == pwChk){
  				$('#mpwChkResult').text('비밀번호 일치');
  			}else{
  				$('#mpwChkResult').text('비밀번호 불일치');
  			}
  		});
		
		$('form').submit(function(){
			var idConfirmResult = $('#idConfirmMsg').text().trim();
			var nicknameConfirmResult = $('#nicknameConfirmMsg').text().trim();
			var mpwChkResult = $('#mpwChkResult').text().trim();
			var mmail = $('input[name="mmail"]');
			var patternMmail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
			if(idConfirmResult!='사용 가능한 ID입니다'){
				alert('ID 중복확인을 해주세요');
				$('input[name="mid"]').focus();
				return false;
			}else if(nicknameConfirmResult!='사용 가능한 닉네임입니다'){
				alert('닉네임 중복확인을 해주세요');
				$('input[name="mnickname"]').focus();
				return false;
			}else if(!mmail.val().match(patternMmail)){
				alert('메일 형식이 맞지 않습니다');
				mmail.focus();
				return false;
			}else if(mpwChkResult != '비밀번호 일치'){
  				alert('비밀번호를 확인하세요');
  				$('input[name="mpw"]').focus();
  				return false;
  			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/member/join.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mid" id="mid">
					<input type="button" class="idconfirm" value="중복확인"><br>
					<span id="idConfirmMsg"></span>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="mnickname" id="mnickname">
					<input type="button" class="nicknameconfirm" value="중복확인"><br>
					<span id="nicknameConfirmMsg"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="mpwChk"><br>
					<span id="mpwChkResult"> &nbsp; </span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="mmail"></td>
			</tr>
			<tr>
				<th>직업군</th>
				<td><input type="text" name="mrole"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="tempMimage"></td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
		</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
