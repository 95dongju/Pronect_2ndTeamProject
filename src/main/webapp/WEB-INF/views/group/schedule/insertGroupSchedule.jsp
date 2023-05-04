<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		* {
			font-family: 'NanumSquareNeo-Variable';
		}
		.insertScheduleForm {
			width: 600px;
			margin: auto;
			margin-top: 20px;
		}
		.insertScheduleForm{
			min-width: 600px;
			margin: auto;
		}
		.insertScheduleForm #insertSchedule {
			text-align: center;
			margin: 30px auto;
			-moz-appearance: none;
			-ms-appearance: none;
			-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
			-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
			-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
			transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
			background-color: transparent;
			border-radius: 4px;
			border: 0;
			box-shadow: inset 0 0 0 2px #585858;
			color: #585858 !important;
			cursor: pointer;
			display: block;
			font-size: 0.8em;
			font-weight: 900;
			height: 3.5em;
			letter-spacing: 0.35em;
			line-height: 3.45em;
			overflow: hidden;
			padding: 0 1.25em 0 1.6em;
			text-align: center;
			text-decoration: none;
			text-overflow: ellipsis;
			text-transform: uppercase;
			white-space: nowrap;
		}
		.insertScheduleForm fieldset {
			display: block;
			border: 3px solid #eeeeee;
			padding: 20px;
			margin: 10px;
		}
		.insertScheduleForm fieldset div {
			width: 50%;
			margin: 20px auto;
		}
		.insertScheduleForm fieldset div span {
			display: inline-block;
			width: 50px;
		}
		.insertScheduleForm fieldset legend {
		    border: none;
		    text-align: center;
		    font-size: 1.5em;
		    font-weight: 900;
		    padding: 10px;
		}
	</style>
	<script>
		function setScheduleInfo(){
			let selected_date = $('#selected_date').val();
		  	let scd_title = $('#scd_title').val();
			let scd_memo = $('#scd_memo').val();
			location.href = '${conPath}/group/schedule/insertGroupSchedule.do?'
					+'gid=${groupDetail.gid}&selected_date='+selected_date
					+'&scd_title='+scd_title
					+'&scd_memo='+scd_memo
					+'&mid=${groupDetail.mid}'
					+'&gsdate=${groupDetail.gsdate}'
					+'&gfdate=${groupDetail.gfdate}'
					+'&pageNum=${param.pageNum}';
			window.opener.location = '${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}';
			window.close();
		};
	</script>
</head>
<body>
	<div class="insertScheduleForm">
		<fieldset>
			<legend>일정 추가</legend>
			<div>
			<span>주기</span>
			<select id="selected_date" class="inputBox">
				<option value="1">매주 일요일</option>
				<option value="2">매주 월요일</option>
				<option value="3">매주 화요일</option>
				<option value="4">매주 수요일</option>
				<option value="5">매주 목요일</option>
				<option value="6">매주 금요일</option>
				<option value="7">매주 토요일</option>
			</select>
			</div>
			<div>
			<span>일정명</span><input type="text" id="scd_title" class="inputBox" required="required">
			</div>
			<div>
			<span>메모</span><input type="text" id="scd_memo" class="inputBox" required="required">
			</div>
		</fieldset>
		<input type="submit" id="insertSchedule" value="일정 등록하기" onclick="setScheduleInfo()">
	</div>
</body>
</html>