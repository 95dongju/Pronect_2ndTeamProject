<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){       
    $( "#sdate,#edate" ).datepicker({
         changeMonth: true,
         changeYear: true,
         showMonthAfterYear: true,
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
         dateFormat:'yy-mm-dd',
     });
    
    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
    $('#sdate').datepicker("option", "onClose", function (selectedDate){
        $("#edate").datepicker( "option", "minDate", selectedDate );
        });
    
    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val());
    $('#edate').datepicker("option", "onClose", function (selectedDate){
        $("#sdate").datepicker( "option", "maxDate", selectedDate );
       });
	});
</script>
<script>
	$(document).ready(function(){
		$("input[type='checkbox']").on("click",function(){
			let count = $("input:checked[type='checkbox']").length;
			if(count>3){
				$(this).prop("checked",false);
				alert("3개까지만 선택 할 수 있습니다.");
			}
		})
	});
</script>
</head>
<body>
	<%-- <c:if test="${empty member }">
		<script>
			location.href = '${conPath}/member.do?method=login&after=member/modify.do';
		</script>
	</c:if> --%>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/study/modify.do" method="post">
		<input type="hidden" name="method" value="modify">
		<input type="hidden" name="sid" value="${studyDetail.sid }">
		<input type="hidden" name="mid" value="${studyDetail.mid }">
			<table>
				<tr><th>제목</th>
					<td><input type="text" name="stitle" required="required" value="${studyDetail.stitle}"></td>
				</tr>
				<tr><th>내용</th>
					<td><textarea rows="30" cols="30" name="scontent" required="required">${studyDetail.scontent}</textarea></td>
				</tr>
				<tr><th>모집 인원</th>
					<td><input type="number" name="speople" required="required" value="${studyDetail.speople}">명</td>
				</tr>
				<tr><th rowspan="4">사용 언어</th>
				<tr>
					<td>
						<input type="checkbox" name="slanguage" value="Python"
							<c:if test="${studyDetail.slanguage1 eq 'Python' or
														studyDetail.slanguage2 eq 'Python' or 
														studyDetail.slanguage3 eq 'Python'}"> checked="checked"</c:if>>Python
						<input type="checkbox" name="slanguage" value="Java"
							<c:if test="${studyDetail.slanguage1 eq 'Java' or
														studyDetail.slanguage2 eq 'Java' or 
														studyDetail.slanguage3 eq 'Java'}"> checked="checked"</c:if>>Java
						<input type="checkbox" name="slanguage" value="JavaScript"
							<c:if test="${studyDetail.slanguage1 eq 'JavaScript' or
														studyDetail.slanguage2 eq 'JavaScript' or 
														studyDetail.slanguage3 eq 'JavaScript'}"> checked="checked"</c:if>>JavaScript
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="slanguage" value="C++"
							<c:if test="${studyDetail.slanguage1 eq 'C++' or
														studyDetail.slanguage2 eq 'C++' or 
														studyDetail.slanguage3 eq 'C++'}"> checked="checked"</c:if>>C++
						<input type="checkbox" name="slanguage" value="PHP"
							<c:if test="${studyDetail.slanguage1 eq 'PHP' or
														studyDetail.slanguage2 eq 'PHP' or 
														studyDetail.slanguage3 eq 'PHP'}"> checked="checked"</c:if>>PHP
						<input type="checkbox" name="slanguage" value="TypeScript"
							<c:if test="${studyDetail.slanguage1 eq 'TypeScript' or
														studyDetail.slanguage2 eq 'TypeScript' or 
														studyDetail.slanguage3 eq 'TypeScript'}"> checked="checked"</c:if>>TypeScript
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="slanguage" value="C"
							<c:if test="${studyDetail.slanguage1 eq 'C' or
														studyDetail.slanguage2 eq 'C' or 
														studyDetail.slanguage3 eq 'C'}"> checked="checked"</c:if>>C
						<input type="checkbox" name="slanguage" value="Go"
							<c:if test="${studyDetail.slanguage1 eq 'Go' or
														studyDetail.slanguage2 eq 'Go' or 
														studyDetail.slanguage3 eq 'Go'}"> checked="checked"</c:if>>Go
						<input type="checkbox" name="slanguage" value="Shell"
							<c:if test="${studyDetail.slanguage1 eq 'Shell' or
														studyDetail.slanguage2 eq 'Shell' or 
														studyDetail.slanguage3 eq 'Shell'}"> checked="checked"</c:if>>Shell
						<input type="checkbox" name="slanguage" value="Ruby"
							<c:if test="${studyDetail.slanguage1 eq 'Ruby' or
														studyDetail.slanguage2 eq 'Ruby' or 
														studyDetail.slanguage3 eq 'Ruby'}"> checked="checked"</c:if>>Ruby
					</td>
				</tr>
				<tr><th>스터디 시작일</th>
					<td><input type="text" id="sdate" class="sdate" name="ssdate" value="${studyDetail.ssdate}"></td>
				</tr>
				<tr><th>스터디 완료일</th>
					<td><input type="text" id="edate" class="edate" name="sfdate" value="${studyDetail.sfdate}"></td>
				</tr>
				<tr><th>지역</th>
					<td><input type="text" name="sloc" value="${studyDetail.sloc}"></td>
				</tr>
				<tr><td colspan="2">
					<input type="submit" value="등록">
					<button onclick="location='list.do?pageNum=${param.pageNum}'">목록</button>
				</td></tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>