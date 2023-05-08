<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		var popupWidth = 630;
		var popupHeight = 370;
	
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		function popupGroup(){
	  		window.open('${conPath}/group/schedule/insertGroupSchedulePopup.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}','그룹 스케쥴 등록','status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);                 
	    };
	    function popupDay(){
   	  		window.open('${conPath}/group/schedule/insertSchedulePopup.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}','스케쥴 등록','status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);                 
   	    };
	</script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/main.js"></script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>
	<link href="${conPath}/js/fullcalendar-5.0.1/lib/main.css" rel="stylesheet" />
	<!-- FullCalendar -->
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			$(function () {
				var request = $.ajax({
					url: "${conPath}/group/schedule/list.do?gid="+${groupDetail.gid},
					method: "GET",
					dataType: "json",
				});
			
				request.done(function (data) {
					console.log(data);
					
					var calendarEl = document.getElementById('calendar');
					
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView: 'dayGridMonth',
						headerToolbar: {
							left: 'prev,next',
							center: 'title',
							right: 'today',
						},
						titleFormat : function(date) {
						  return date.date.year +"년 "+(date.date.month +1)+"월"; 
						}, 
						droppable: true,
						drop: function (arg) {
						if (document.getElementById('drop-remove').checked) {
							arg.draggedEl.parentNode.removeChild(arg.draggedEl);
							}
						},
						events: data,
						eventClick: function(info) {
				    	let today = new Date();   
				    	let year = today.getFullYear();
				    	let month = ('0' + (today.getMonth() + 1)).slice(-2);
				    	let day = ('0' + today.getDate()).slice(-2);
				    	let todayStr = year + '-' + month + '-' + day;
					    	Swal.fire({
						        title: info.event.startStr+' 일정 ('+info.event.title+')에 참여하셨습니까?',
						        showDenyButton: true,
						        confirmButtonText: '네',
						        denyButtonText: '아니요',
						        icon: 'warning'
						    }).then((result) => {
						    	if (result.isConfirmed) {
						    		if(todayStr != info.event.startStr){
						    			alert('출석은 당일에만 가능합니다.');
						    		}else if(todayStr === info.event.startStr) {
						    			Swal.fire({
									        title: '출석되었습니다.',
									        confirmButtonText: '확인',
									        icon: 'success',
									    }).then((result) => {
									        if (result.isConfirmed) {
									        	location.href = '${conPath}/group/schedule/achive.do?scd_id='+info.event.id+'&mid=${member.mid}&gid=${groupDetail.gid}&pageNum=${param.pageNum}';
									        }
									    });
						    		}
						        }
						    });
						    return false;
						}
					});
				calendar.render();
			});
		});
	});
	</script>
	<style>
		#rate {
			margin: auto;
			text-align: center;
		}
		#joinRate {
			width: 85%;
			height: 30px;
			margin: auto;
			display: inline-box;
		}
		#joinRate div {
			width: 4.5%;
			margin: 1px;
			display: inline-box;
			height: 30px;
			border: 1px solid grey;
			float: left;
		}
		#groupAvgRate {
			width: 85%;
			height: 30px;
			margin: auto;
			display: inline-box;
		}
		#groupAvgRate div {
			width: 4.5%;
			margin: 1px;
			display: inline-box;
			height: 30px;
			border: 1px solid grey;
			float: left;
		}
	</style>
	<script>
		window.onload = function(){
			var joinRate = ${joinRate};
			console.log(joinRate);
			var groupAvgRate = ${groupAvgRate};
			console.log(groupAvgRate);
			var joinRateDiv = document.getElementsByClassName("joinRate");
			var groupAvgRateDiv = document.getElementsByClassName("groupAvgRate");
			for(let i=1; i<=20; i++){
				if(Math.floor(joinRate/5) == i){
					for(let j=0; j<i; j++){
						joinRateDiv[j].style.backgroundColor = 'lightblue';
					}
				}if(Math.floor(groupAvgRate/5) == i){
					for(let j=0; j<i; j++){
						groupAvgRateDiv[j].style.backgroundColor = 'lightblue';
					}
				}
			}
		};
	</script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
	<jsp:include page="../groupDetailHeader.jsp"/>
	<!-----------------------------------------------------그룹 본문------------------------------------------------------------------->
	<div id="main">
	 	<c:if test="${groupDetail.mid eq member.mid and empty groupSchedule}">
			<div class="InsertScheduleDiv">
				<div class="emptySchedule">
					<h2>등록된 일정이 없습니다. 새로운 일정을 추가하세요. </h2>
					<div class="insertScheduleDiv">
						<button onclick="popupGroup();">매주 일정 추가하기</button><button onclick="popupDay();">하루 일정 추가하기</button>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${groupDetail.mid ne member.mid and empty groupSchedule}">
			<div class="InsertScheduleDiv">
				<div class="emptySchedule">
					<h2>등록된 일정이 없습니다. </h2>
				</div>
			</div>
		</c:if>
		<c:if test="${groupDetail.mid eq member.mid and not empty groupSchedule}">
			<div class="InsertScheduleDiv">
				<div class="emptySchedule">
					<div class="insertScheduleDiv">
						<button onclick="popupGroup();">매주 일정 추가하기</button><button onclick="popupDay();">하루 일정 추가하기</button>
					</div>
				</div>
			</div>
		</c:if>
		<div id='calendar'></div>
		<c:if test="${not empty joinRate }">
			<div id="rate">
				<p>나의 참여율: ${joinRate }% / 100%</p>
				<div id="joinRate">
					<div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div>
					<div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div>
					<div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div>
					<div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div>
					<div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div><div class="joinRate"></div>
				</div>
				<p style=clear:both;></p>
				<c:if test="${not empty groupAvgRate }">
					<p>그룹원 평균 참여율 : ${groupAvgRate }% / 100%</p>
					<div id="groupAvgRate">
						<div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div>
						<div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div>
						<div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div>
						<div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div>
						<div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div><div class="groupAvgRate"></div>
					</div>
				</c:if>
			</div>
		</c:if>
	</div>
	<jsp:include page="../../main/footer.jsp"/>
 </body>
</html>