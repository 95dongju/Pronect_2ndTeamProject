<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pronect</title>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/main.js"></script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath}/js/fullcalendar-5.0.1/lib/main.css" rel="stylesheet" />
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<script>
	$(document).ready(function(){
		$('#groupDetail_memberInfo').click(function(){
			$.ajax({
				url : '${conPath}/group/memberInfo.do',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupMemberInfo').html(data);
				}
			});
		});
		$('#groupDetail_memberInfo').click(function(){
			$.ajax({
				url : '${conPath}/group/memberInfo.do',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupMemberInfo').html(data);
				}
			});
		});
	});
	</script>
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			$(function () {
				var request = $.ajax({
					url: "${conPath}/group/schedule/list.do?gid="+${groupDetail.gid},
					method: "GET",
					dataType: "json"
				});
			
				request.done(function (data) {
					console.log(data);
					
					var calendarEl = document.getElementById('calendar');
					
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView: 'dayGridMonth',
						headerToolbar: {
							left: 'prev,next',
							center: 'title',
						},
						editable: true,
						droppable: true,
						drop: function (arg) {
						if (document.getElementById('drop-remove').checked) {
							arg.draggedEl.parentNode.removeChild(arg.draggedEl);
							}
						},
						events: data
					});
				
					calendar.render();
				});
				
				request.fail(function( jqXHR, textStatus ) {
						alert( "Request failed: " + textStatus );
					});
			});
		
		});
	</script>
<style>
	#main{
		width:1000px;
		margin:0 auto;
	}
	#back {
		width: 1000px;
		margin: 0 auto;
	}
	#groupDetail{
		width: 1000px;
		margin: 0 auto;
	}
	#sideBanner{
		width:200px;
		position:fixed;
		top:200px;
		right:200px;
	}
	#sideBanner_hitGroup{
		display: block;
		white-space:nowrap;
		overflow:hidden;
	}
	#sideBanner_hitGroup li::marker{
		color : blue;
		
	}
	#sideBanner_hitGroup_border{
		border-radius: 10px;
		border:solid gray 2px;
	}
	.back{
		width : 30px;
		text-align: left;
	}
	button{
		text-align: center;
	}
	#commentContent{
		border-radius: 10px;
	}
	#submitBtn{
		border-radius: 20px;
		background-color:black;
		color:white;
	}
</style>
</head>
<c:if test="${not empty acceptResult }">
	<script>
		alert('${acceptResult}');
	</script>
</c:if>
<body>
	<jsp:include page="../main/header.jsp"/>
<!-- ---------------------------------------------------추천글-------------------------------------------------------------------- -->
	<div id="sideBanner">
		오늘의 추천글
		<fieldset class="sideBanner_hitGroup_border">
			<ol type="1">
				<c:forEach var="dto" items="${hitGroup}">
					<li id="sideBanner_hitGroup"><a href="${conPath}/group/detail.do?name=${name }&gid=${dto.gid}&pageNum=${paging.currentPage}">${dto.gtitle }</a></li>
				</c:forEach>
			</ol>
		</fieldset>
	</div>
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
							<span class="groupInfo_title">모집 구분 </span>
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
							<span class="groupInfo_title">모집 인원</span>
							<span class="groupInfo_content">${groupDetail.gpeople }명 </span>
						</li>
						<li>
							<span class="groupInfo_title">시작 예정</span>
							<span class="groupInfo_content">${groupDetail.gsdate }  </span>
						</li>
						<li>
							<span class="groupInfo_title">지역</span>
							<span class="groupInfo_content">${groupDetail.gloc } </span>
						</li>
						<li>
							<span class="groupInfo_title">완료 예정</span>
							<span class="groupInfo_content">${groupDetail.gfdate } </span>
						</li>
						<li>
							<span class="groupInfo_title">사용 언어</span>
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
							<!-- <a href="${conPath }/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid }">test</a> -->
						</li>
						<c:if test="${groupDetail.gcharacter eq 'P' }">
						<li><p id="groupDetail_gantt">Gantt 계획표</p></li>
						</c:if>
						<li><p id="groupDetail_board">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판</p></li>
						<c:if test="${groupDetail.mid eq member.mid }">
							<li><p id="groupDetail_memberInfo">멤버 정보</p></li>
						</c:if>
					</ul>
					<p style=clear:both;></p>
				</nav>
			</div>
			<div class="groupJoin">
			</div>
			<div class="groupMemberInfo">
			</div>
			<div class="groupContent_detailContentWrapper">
				<h2 class="groupContent_detailInfo">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 소개</h2>
				<pre>${groupDetail.gcontent }</pre>
			</div>
			<div class="groupContent_btns">
				<c:if test="${not empty member}">
					<c:if test="${groupDetail.mid ne member.mid and joincheck eq 0}">
						<button onclick="location='join.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
					</c:if>
					<c:if test="${groupDetail.mid ne member.mid and joincheck eq 1}">
						<button onclick="location='unJoin.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
					</c:if>
					
					<c:if test="${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
						<button onclick="location='modify.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">수정</button>
						<button onclick="location='delete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">삭제</button>
						<button onclick="location='complete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">삭제</button>
					</c:if>
				</c:if>
				<c:if test="${empty member}">
					<button onclick="location='${conPath}/member/login.do'">참가 신청</button>
				</c:if>
			</div>
	<!----------------------------------------------------- 댓글 ------------------------------------------------------->
		<div class="studyContent_detailComment">
			<div class="commentInput_commentText">
				<hr>
				<h2>${commentCnt }개의 댓글이 있습니다.</h2>
				<c:if test="${not empty member }">
					<form action="${conPath}/group/comment.do" method="post">
						<textarea class="commentInput_commentText_textarea" placeholder="댓글을 입력하세요."></textarea>
						<div class="contentInput_buttonWrapper">
								<button class="comentInput_buttonSubmit">댓글 등록</button>
						</div>
					</form>
				</c:if>
			</div>
			<c:if test="${not empty groupComment }">
				<hr>
				<ul class="commentList">
					<c:forEach var="dto" items="${groupComment }">
						<li class="commentItem_commentContainer">
							<div class="commentItem_commentHeader">
								<form action="${conPath}/group/commentModify.do" method="post">
									<input type="hidden" name="gid" value=${dto.gid }>
									<input type="hidden" name="gcid" value=${dto.gcid }>
									<input type="hidden" name="pageNum" value=${param.pageNum }>
									<div class="commentItem_writer"><img src="" class="commentItem_userImg" alt="사용자 이미지">
										<div class="commentItem_commentInfo">
											<div class="commentItem_title">
												<div class="commentItem_userNickname">${dto.mnickname }</div>
												<div class="commentItem_registerDate">${dto.gcrdate }</div>
											</div>
										</div>
									</div>
									<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
										<span><a class="comment_modify" style="color : black; text-decoration:none; cursor:pointer">수정 </a></span>
										<span><a href="${conPath}/GCommentDelete.do?gid=${dto.gid}&gcid=${dto.gcid}" style="color : black; text-decoration:none;">삭제</a></span><br>
									</c:if>
								</form>
							</div>
							<div class="commentItem_commentContent">
								<p class="commentItem_commentContent">${dto.gccontent }</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
	<div id='calendar'></div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>