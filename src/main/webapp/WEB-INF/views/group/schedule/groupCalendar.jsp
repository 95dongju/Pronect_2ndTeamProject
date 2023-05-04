<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/main.js"></script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>
	<link href="${conPath}/js/fullcalendar-5.0.1/lib/main.css" rel="stylesheet" />
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
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
							        	location.href = '${conPath}/group/schedule/achive.do?';	
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
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
	<!-----------------------------------------------------그룹 본문------------------------------------------------------------------->
	<div id="main">
		<div class="groupContent_detailHeader">
			<div id="back">
				<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
			</div>
				<div class="groupDetail_title">${groupDetail.gtitle }</div>
<!-----------------------------------------------그룹리더 정보------------------------------------------------------------------->
				<div class="groupDetail_writer">
					<div class="mimage"><img src="${conPath}/memberFile/${groupDetail.mimage}" alt="사용자 이미지"></div><div class="mid">${groupDetail.mnickname } |</div>
					<div class="grdate">작성일: ${groupDetail.grdate }</div>
					<c:if test=" ${empty groupDetail.mimage}">
						이미지 비어있음
					</c:if>
				</div>
				<p style=clear:both;></p>
<!-------------------------------------------------그룹 정보--------------------------------------------------------------------->
				<div class="groupContent_detail">
					<ul class="groupInfo_groupGrid">
						<li>
							<span class="groupInfo_title">모집 구분&nbsp;&nbsp; </span>
							<span class="groupInfo_content">
								<c:if test="${groupDetail.gcharacter eq 'P' }">
									<b>프로젝트</b>
								</c:if>
								<c:if test="${groupDetail.gcharacter eq 'S'}">
									<b>스터디</b>
								</c:if>
							</span>
						</li>
						<li>
							<span class="groupInfo_title">모집 인원&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gpeople }명 </span>
						</li>
						<li>
							<span class="groupInfo_title">시작 예정&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gsdate }  </span>
						</li>
						<li>
							<span class="groupInfo_title">지역&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gloc } </span>
						</li>
						<li>
							<span class="groupInfo_title">완료 예정&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gfdate } </span>
						</li>
						<li>
							<span class="groupInfo_title">사용 언어&nbsp;&nbsp;</span>
							<span class="groupInfo_content_lang">
								<c:if test="${empty groupDetail.glanguage1 and empty groupDetail.glanguage2 and empty groupDetail.glanguage3}">
									-
								</c:if>
								<c:if test="${not empty groupDetail.glanguage1 }">
										${groupDetail.glanguage1 }
								</c:if>
								<c:if test="${not empty groupDetail.glanguage2 }">
										 / ${groupDetail.glanguage2 }
								</c:if>
								<c:if test="${not empty groupDetail.glanguage3 }">
										 / ${groupDetail.glanguage3 }
								</c:if>
							</span>
						</li>
					</ul>
				<p style=clear:both;></p>
			</div>
			<nav id="mygroup_nav">
				<ul>
					<li>
					<p id="groupDetail_info">
							${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 정보</p>
					</li>
					<li>
						<p id="groupDetail_schedule"> ${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 일정</p>
					</li>
					<li><p id="groupDetail_board">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판</p></li>
					<c:if test="${groupDetail.mid eq member.mid }">
						<li><p id="groupDetail_memberInfo">멤버 정보</p></li>
					</c:if>
				</ul>
				<p style=clear:both;></p>
			</nav>
		</div>
	</div>
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
	<jsp:include page="../../main/footer.jsp"/>
 </body>
</html>