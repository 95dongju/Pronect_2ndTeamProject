<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
	<link href="${conPath}/css/boardDetail.css" rel="stylesheet" />
	<!-- GroupDetailNav (네비게이션바 Script) -->
	<script>
		$(document).ready(function(){
			$('#groupDetail_info').click(function(){
				location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
			});
			$('#groupDetail_schedule').click(function(){
				if(${empty member}){
					alert('로그인 후 이용 가능합니다');
					location.href="${conPath}/member/login.do";
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						alert('그룹 가입 후 이용 가능합니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						alert('그룹 승인 대기 중입니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
					}
				}
			});
			$('#groupDetail_board').click(function(){
				if(${empty member}){
					alert('로그인 후 이용 가능합니다');
					location.href="${conPath}/member/login.do";
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						alert('그룹 가입 후 이용 가능합니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						alert('그룹 승인 대기 중입니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
					}
				}
			});
			$('#groupDetail_memberInfo').click(function(){
				if(${empty member}){
					alert('로그인 후 이용 가능합니다');
					location.href="${conPath}/member/login.do";
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						alert('그룹 가입 후 이용 가능합니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						alert('그룹 승인 대기 중입니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}";
					}
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
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
				<div id='calendar'></div>
			</nav>
		</div>
		<!-------------------------------------------------참가 신청자 정보--------------------------------------------------------------->				
			<c:if test="${groupDetail.mid eq member.mid }">
				<h2>참가 신청자 정보</h2>
					<div class="groupJoin_info">
						<c:if test="${empty joinList }">
							<p>신청자가 없습니다</p>
						</c:if>
						<c:if test="${not empty joinList }">
							<c:forEach var="dto" items="${joinList }">
								<div class="groupJoin_memberInfo">
									<div class="groupJoin_memberInfo_img">${dto.mimage }</div>
									<div class="groupJoin_memberInfo_nickname">${dto.mnickname }</div>
								</div>
								<div class="groupJoin_acceptBtn">
									<c:if test="${groupDetail.mid ne dto.mid }">
										<button onclick="location.href='${conPath}/group/accept.do?mid=${dto.mid }&gid=${dto.gid }&pageNum=${param.pageNum }'">수락</button>
									</c:if>
								</div>
							</c:forEach>
						</c:if>
					</div>

<!---------------------------------------------------그룹원 정보(그룹장 자신 퇴출 가능하게 보이는것 고쳐야함)----------------------------------------------------------------->				
			<h2>그룹원 정보</h2>
			<div class="groupMember_inf">
				<c:if test="${empty groupMember }">
					<p>그룹원이 없습니다</p>
				</c:if>
				<c:if test="${not empty groupMember }">
					<c:forEach var="dto" items="${groupMember }">
						<div class="groupJoin_memberInfo">
							<div class="groupJoin_memberInfo_img">${dto.mimage }</div>
							<div class="groupJoin_memberInfo_nickname">${dto.mnickname }</div>
						</div>
						<div class="groupJoin_acceptBtn">
							<c:if test="${groupDetail.mid eq dto.mid }">
								<p><b>★그룹장</b></p>
							</c:if>
							<c:if test="${groupDetail.mid ne dto.mid }">
								<button onclick="location.href='${conPath}/group/memberOut.do?mid=${dto.mid }&gid=${dto.gid }&pageNum=${param.pageNum }'">퇴출</button>
							</c:if>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>