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
<style>
	#content{
		width:1000px;
		margin:0 auto;
	}
 	#checkbox{
		margin-right:30px;
	}
	#registerInfo {
		width:150px;
		font-size: 0.9em;
		font-weight: 900;
		padding: 0 0.75em 0.75em 0.75em;
		text-align: center;
	}
	.exception{
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font-family: 'NanumSquareNeo-Variable';
		vertical-align: middle;
	}
	textarea{
		resize : none;
	}
</style>
</head>
<body>
	<c:set var="SUCCESS" value="1"></c:set>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/group/register.do" method="post">
			<input type="hidden" name="method" value="register">
			<table>
				<tr><th id="registerInfo">제목</th>
					<td><input type="text" autocomplete="off" name="gtitle" required="required" maxlength="80"></td>
				</tr>
				<tr><th id="registerInfo">내용</th>
					<td><textarea rows="10" autocomplete="off" cols="10" name="gcontent" required="required"></textarea> </td>
				</tr>
				<tr><th id="registerInfo">모집 인원</th>
					<td><input type="number" autocomplete="off" name="gpeople" required="required">명</td>
				</tr>
				<tr>
					<th id="registerInfo" class="exception" rowspan="2">사용 언어</th>
					<td>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Python">Python</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Java">Java</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="JavaScript">JavaScript</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="C++">C++</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="PHP">PHP</label>
					</td>
				</tr>
				<tr>
					<td>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="TypeScript">TypeScript</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="C">C</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Go">Go</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Shell">Shell</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Ruby">Ruby</label>
					</td>
				</tr>
				<tr><th id="registerInfo">스터디 시작일</th>
					<td><input type="text" id="sdate" autocomplete="off" class="sdate" name="gsdate" required="required"></td>
				</tr>
				<tr><th id="registerInfo">스터디 완료일</th>
					<td><input type="text" id="edate" autocomplete="off" class="edate" name="gfdate" required="required"></td>
				</tr>
				<tr><th id="registerInfo">지역</th>
					<td><input type="text" autocomplete="off" name="gloc"></td>
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
         monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
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
</html>