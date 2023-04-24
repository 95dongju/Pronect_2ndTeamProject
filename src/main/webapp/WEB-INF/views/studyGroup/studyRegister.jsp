<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		$("input[type='number']").on("change",function(){
			let number = $(this).val();
			if(number<2){
				alert("인원수를 확인해주세요");
				$(this).val('2');
			}
		})
	});
	
</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"></c:set>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/study/register.do" method="post">
			<input type="hidden" name="method" value="register">
			<table>
				<tr><th>제목</th>
					<td><input type="text" name="stitle" required="required"></td>
				</tr>
				<tr><th>내용</th>
					<td><textarea rows="30" cols="30" name="scontent" required="required"></textarea> </td>
				</tr>
				<tr><th>모집 인원</th>
					<td><input type="number" name="speople" required="required">명</td>
				</tr>
				<tr><th rowspan="4">사용 언어</th>
				<tr>
					<td>
						<input type="checkbox" name="slanguage" value="Python">Python
						<input type="checkbox" name="slanguage" value="Java">Java
						<input type="checkbox" name="slanguage" value="JavaScript">JavaScript
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="slanguage" value="C++">C++
						<input type="checkbox" name="slanguage" value="PHP">PHP
						<input type="checkbox" name="slanguage" value="TypeScript">TypeScript
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="slanguage" value="C">C
						<input type="checkbox" name="slanguage" value="Go">Go
						<input type="checkbox" name="slanguage" value="Shell">Shell
						<input type="checkbox" name="slanguage" value="Ruby">Ruby
					</td>
				</tr>
				<tr><th>스터디 시작일</th>
					<td><input type="text" id="sdate" class="sdate" name="ssdate" required="required"></td>
				</tr>
				<tr><th>스터디 완료일</th>
					<td><input type="text" id="edate" class="edate" name="sfdate" required="required"></td>
				</tr>
				<tr><th>지역</th>
					<td><input type="text" name="sloc"></td>
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