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
	<form action="${conPath }/group/modify.do" method="post">
		<input type="hidden" name="method" value="modify">
		<input type="hidden" name="gid" value="${groupDetail.gid }">
		<input type="hidden" name="mid" value="${groupDetail.mid }">
			<table>
				<tr><th>제목</th>
					<td><input type="text" name="gtitle" required="required" value="${groupDetail.gtitle}"></td>
				</tr>
				<tr><th>내용</th>
					<td><textarea rows="30" cols="30" name="gcontent" required="required">${groupDetail.gcontent}</textarea></td>
				</tr>
				<tr><th>모집 인원</th>
					<td><input type="number" name="gpeople" required="required" value="${groupDetail.gpeople}">명</td>
				</tr>
				<tr><th rowspan="4">사용 언어</th>
				<tr>
					<td>
						<input type="checkbox" name="glanguage" value="Python"
							<c:if test="${groupDetail.glanguage1 eq 'Python' or
														groupDetail.glanguage2 eq 'Python' or 
														groupDetail.glanguage3 eq 'Python'}"> checked="checked"</c:if>>Python
						<input type="checkbox" name="glanguage" value="Java"
							<c:if test="${groupDetail.glanguage1 eq 'Java' or
														groupDetail.glanguage2 eq 'Java' or 
														groupDetail.glanguage3 eq 'Java'}"> checked="checked"</c:if>>Java
						<input type="checkbox" name="glanguage" value="JavaScript"
							<c:if test="${groupDetail.glanguage1 eq 'JavaScript' or
														groupDetail.glanguage2 eq 'JavaScript' or 
														groupDetail.glanguage3 eq 'JavaScript'}"> checked="checked"</c:if>>JavaScript
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="glanguage" value="C++"
							<c:if test="${groupDetail.glanguage1 eq 'C++' or
														groupDetail.glanguage2 eq 'C++' or 
														groupDetail.glanguage3 eq 'C++'}"> checked="checked"</c:if>>C++
						<input type="checkbox" name="glanguage" value="PHP"
							<c:if test="${groupDetail.glanguage1 eq 'PHP' or
														groupDetail.glanguage2 eq 'PHP' or 
														groupDetail.glanguage3 eq 'PHP'}"> checked="checked"</c:if>>PHP
						<input type="checkbox" name="glanguage" value="TypeScript"
							<c:if test="${groupDetail.glanguage1 eq 'TypeScript' or
														groupDetail.glanguage2 eq 'TypeScript' or 
														groupDetail.glanguage3 eq 'TypeScript'}"> checked="checked"</c:if>>TypeScript
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="glanguage" value="C"
							<c:if test="${groupDetail.glanguage1 eq 'C' or
														groupDetail.glanguage2 eq 'C' or 
														groupDetail.glanguage3 eq 'C'}"> checked="checked"</c:if>>C
						<input type="checkbox" name="glanguage" value="Go"
							<c:if test="${groupDetail.glanguage1 eq 'Go' or
														groupDetail.glanguage2 eq 'Go' or 
														groupDetail.glanguage3 eq 'Go'}"> checked="checked"</c:if>>Go
						<input type="checkbox" name="glanguage" value="Shell"
							<c:if test="${groupDetail.glanguage1 eq 'Shell' or
														groupDetail.glanguage2 eq 'Shell' or 
														groupDetail.glanguage3 eq 'Shell'}"> checked="checked"</c:if>>Shell
						<input type="checkbox" name="glanguage" value="Ruby"
							<c:if test="${groupDetail.glanguage1 eq 'Ruby' or
														groupDetail.glanguage2 eq 'Ruby' or 
														groupDetail.glanguage3 eq 'Ruby'}"> checked="checked"</c:if>>Ruby
					</td>
				</tr>
				<tr><th>스터디 시작일</th>
					<td><input type="text" id="sdate" class="sdate" name="gsdate" value="${groupDetail.gsdate}"></td>
				</tr>
				<tr><th>스터디 완료일</th>
					<td><input type="text" id="edate" class="edate" name="gfdate" value="${groupDetail.gfdate}"></td>
				</tr>
				<tr><th>지역</th>
					<td><input type="text" name="gloc" value="${groupDetail.gloc}"></td>
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