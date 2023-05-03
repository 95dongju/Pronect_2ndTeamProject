<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<html>
<head>
</head>
<body>
 	<c:if test="${groupDetail.mid eq member.mid and empty groupSchedule}">
		<div class="InsertSchedule">
			<h2>등록된 일정이 없습니다. 새로운 일정을 추가하세요. </h2>
			<form action="${conPath }/group/schedule/insertGroupSchedule.do">
				<input type="hidden" name="gid" value="${groupDetail.gid }">
				<input type="hidden" name="mid" value="${groupDetail.mid }">
				<input type="hidden" name="gsdate" value="${groupDetail.gsdate }">
				<input type="hidden" name="gfdate" value="${groupDetail.gfdate }">
				<h2>일정 추가</h2>
				<select name="selected_date" class="inputBox">
					<option value="1">매주 일요일</option>
					<option value="2">매주 월요일</option>
					<option value="3">매주 화요일</option>
					<option value="4">매주 수요일</option>
					<option value="5">매주 목요일</option>
					<option value="6">매주 금요일</option>
					<option value="7">매주 토요일</option>
				</select>
				<h3>일정명</h3><input type="text" name="scd_title" class="inputBox">
				<h3>메모</h3><input type="text" name="scd_memo" class="inputBox">
				<input type="submit" id="insertSchedule" value="일정 등록하기">
			</form>
		</div>
	</c:if>
	<c:if test="${groupDetail.mid eq member.mid and not empty groupSchedule}">
		<div class="InsertSchedule">
			<form action="${conPath }/group/schedule/insertSchedule.do">
				<input type="hidden" name="gid" value="${groupDetail.gid }">
				<input type="hidden" name="mid" value="${groupDetail.mid }">
			 	<h2>일정 추가</h2>
			 	<h3>시작일</h3> <input type="date" name="scd_start"> <h3>종료일</h3> <input type="date" name="scd_end">
			 	<h3>일정명</h3> <input type="text" name="scd_title" class="inputBox" style="width: 40%;">
			 	<h3>메모</h3> <input type="text" name="scd_memo" class="inputBox" style="width: 40%;">
			 	<input type="submit" id="insertSchedule" value="일정 등록하기">
			</form>
		</div>
	</c:if>
 </body>
</html>