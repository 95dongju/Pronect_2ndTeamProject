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
	<!-- GroupDetailNav (네비게이션바 Script) -->
	<script>
		$(document).ready(function(){
			var pageNum = ${param.pageNum};
			if(pageNum == null || pageNum == ''){
				pageNum = 1;
			}
			$('#groupDetail_info').click(function(){
				location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
			});
			$('#groupDetail_schedule').click(function(){
				if(${empty member}){
					Swal.fire({
				        title: '로그인 후 이용 가능합니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href="${conPath}/member/login.do";
				        }
				    });
				    return false;
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheckCnt eq 0}){
						Swal.fire({
					        title: '그룹 가입 후 이용 가능합니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						Swal.fire({
					        title: '그룹 승인 대기 중입니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum="+pageNum;
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum="+pageNum;
					}
				}
			});
		$('#groupDetail_board').click(function(){
			if(${empty member}){
				Swal.fire({
			        title: '로그인 후 이용 가능합니다',
			        confirmButtonText: '확인',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href="${conPath}/member/login.do";
			        }
			    });
			    return false;
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheckCnt eq 0}){
						Swal.fire({
					        title: '그룹 가입 후 이용 가능합니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						Swal.fire({
					        title: '그룹 승인 대기 중입니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}
				}
			});
		$('#groupDetail_memberInfo').click(function(){
			if(${empty member}){
				Swal.fire({
			        title: '로그인 후 이용 가능합니다',
			        confirmButtonText: '확인',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href="${conPath}/member/login.do";
			        }
			    });
			    return false;
			}else if(${not empty member}){
				if(${groupDetail.mid ne member.mid and joincheckCnt eq 0}){
					Swal.fire({
				        title: '그룹 가입 후 이용 가능합니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 0}){
					Swal.fire({
				        title: '퇴출/탈퇴 멤버는 이용할 수 없습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
					Swal.fire({
				        title: '그룹 승인 대기 중입니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?name=${param.name }&gid=${param.gid}&pageNum="+pageNum+"&mid=${member.mid}";
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
					location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
					location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum="+pageNum;
				}
			}
		});
	});
	</script>
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
		<c:if test="${not empty joinRate }">
			<div>
				<p>나의 참여율: ${joinRate }% / 100%</p>
				<c:if test="${not empty groupAvgRate }">
					<p>그룹원 평균 참여율 : ${groupAvgRate }% / 100%</p>
				</c:if>
			</div>
		</c:if>
		<div id='calendar'></div>
	</div>
	<jsp:include page="../../main/footer.jsp"/>
 </body>
</html>