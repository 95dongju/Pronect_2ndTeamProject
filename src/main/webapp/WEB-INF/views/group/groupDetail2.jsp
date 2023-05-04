<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<!-- SweetAlert -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
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
					if(${groupDetail.mid ne member.mid and joincheckCnt eq 0}){
						alert('그룹 가입 후 이용 가능합니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						alert('퇴출/탈퇴 멤버는 이용 불가합니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						alert('그룹 승인 대기 중입니다');
						location.href="history.back()";
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}&mid=${member.mid}";
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}&mid=${member.mid}";
					}
				}
			});
		});
	</script>
	<script>
		$(document).ready(function(){
	  		$('#deleteBtn').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/group/delete.do?gid=${param.gid }&pageNum=${param.pageNum}';
			        }
			    });
			    return false;
	  		});
	  	});
	  	
		function modifyComment(gcid, pageNum, gid){
			$.ajax({
				url : '${conPath}/group/commentModify.do',
				data : {'gcid':gcid, 'pageNum':pageNum, 'gid':gid},
				type : 'get',
				dataType : 'html',
				success : function(data, status){
					$('.reply'+gcid).html(data);
				}
			});
		}
		
		function confirmSubmit(){
		    Swal.fire({
		        title: '댓글 작성을 완료하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm').submit();
		        }
		    });
		    return false;
		}
	</script>
	<style>
		.image{
			width:30px;
			height:30px;
		}
		#groupInfo_groupGrid li{margin-top:10px;}
	</style>
</head>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
		return false;
	</script>
</c:if>
<body>
<c:if test="${not empty acceptResult }">
	<script>
		alert('${acceptResult}');
	</script>
</c:if>
	<jsp:include page="../main/header.jsp"/>
<!-- ---------------------------------------------------추천글(사이드배너)-------------------------------------------------------------------- -->
	<div id="sideBanner">
		인기 그룹
		<fieldset class="sideBanner_hitGroup_border">
			<ol type="1">
				<c:set var="rank" value="1"/>
				<c:forEach var="dto" items="${hitGroup}">
					<c:set var="rank" value="${rank }"/>
					<li id="sideBanner_hitGroup"><a href="${conPath}/group/detail.do?name=${name }&gid=${dto.gid}&pageNum=${paging.currentPage}"><span id="rank"><c:out value="${rank }"/>.</span> ${dto.gtitle }</a></li>
					<c:set var="rank" value="${rank+1 }"/>
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
						<P>acceptResult${acceptResult }${acceptResult }${acceptResult }
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
										<img class="language" src="${conPath }/logos/${groupDetail.glanguage1}.png" title="${groupDetail.glanguage1}" alt="${groupDetail.glanguage1}">
								</c:if>
								<c:if test="${not empty groupDetail.glanguage2 }">
										/ <img class="language" src="${conPath }/logos/${groupDetail.glanguage2}.png" title="${groupDetail.glanguage2}" alt="${groupDetail.glanguage2}">
								</c:if>
								<c:if test="${not empty groupDetail.glanguage3 }">
										/ <img class="language" src="${conPath }/logos/${groupDetail.glanguage3}.png" title="${groupDetail.glanguage3}" alt="${groupDetail.glanguage3}">
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
	<!----------------------------------------------------- 댓글 ------------------------------------------------------->
		<div class="groupContent_detailContentWrapper">
					<h2 class="groupContent_detailInfo">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 소개</h2>
					<pre>${groupDetail.gcontent }</pre>
		</div>
		<p>joincheck${joincheck }///////joincheckCnt${joincheckCnt }
		<div class="groupContent_btns">
			<c:if test="${not empty member}">
				<c:if test="${groupDetail.mid ne member.mid and joincheck eq 0}">
					<p>퇴출/탈퇴 그룹원은 재참가 불가능합니다</p>
				</c:if>
				<c:if test="${groupDetail.mid ne member.mid and joincheckCnt eq 0}">
					<button onclick="location='${conPath }/group/join.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
				</c:if>
				<c:if test="${groupDetail.mid ne member.mid and joincheck eq 1}">
					<button onclick="location='${conPath }/group/unJoin.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
				</c:if>
				<c:if test="${groupDetail.mid ne member.mid and joincheck eq 2}">
					<button onclick="location='${conPath }/group/memberOut.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">그룹 탈퇴</button>
				</c:if>
				<c:if test="${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
					<button onclick="location='${conPath }/group/modify.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">수정</button>
					<button id="deleteBtn">삭제</button>
					<button onclick="location='${conPath }/group/complete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">그룹 종료</button>
				</c:if>
			</c:if>
			<c:if test="${empty member}">
				<button onclick="location='${conPath}/member/login.do'">참가 신청</button>
			</c:if>
		</div>
		<div class="studyContent_detailComment">
			<div class="commentInput_commentText">
				<hr>
				<h2>${groupDetail.comment_count}개의 댓글이 있습니다.</h2>
				<c:if test="${not empty member }">
					<form id="frm" action="${conPath}/group/comment.do" method="get">
						<input type="hidden" name="gid" value="${param.gid }">
						<input type="hidden" name="pageNum" value="${param.pageNum }">
						<input type="hidden" name="mid" value="${member.mid }">
						<textarea class="commentInput_commentText_textarea" name="gccontent" placeholder="댓글을 입력하세요."></textarea>
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
						<li class="reply${dto.gcid }" class="commentItem_commentContainer">
							<div class="commentItem_commentHeader">
								<form action="${conPath}/group/comment.do" method="get">
									<input type="hidden" name="gid" value=${dto.gid }>
									<input type="hidden" name="gcid" value=${dto.gcid }>
									<input type="hidden" name="pageNum" value=${param.pageNum }>
									<div class="commentItem_writer"><img src="${conPath }/memberFile/${dto.mimage}" id="img" class="commentItem_userImg" alt="사용자 이미지">
										<div class="commentItem_commentInfo">
											<div class="commentItem_title">
												<div class="commentItem_userNickname">${dto.mnickname } 님</div>
												<div class="commentItem_registerDate">${dto.gcrdate }</div>
											</div>
										</div>
									</div>
									<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
										<span class="comment_modify" class="btn" style="cursor:pointer;" onclick="modifyComment(${dto.gcid}, ${param.pageNum}, ${groupDetail.gid})">수정 </span>
										<span style="color : black; text-decoration:none;" onclick="Swal.fire({
										  title: '삭제하시겠습니까?',
										  text: '삭제된 댓글은 복구할 수 없습니다.',
										  icon: 'warning',
										  showCancelButton: true,
										  confirmButtonText: '삭제',
										  cancelButtonText: '취소'
										}).then((result) => {
										  if (result.isConfirmed) {
										    location='${conPath}/group/commentDelete.do?gid=${dto.gid}&gcid=${dto.gcid}&pageNum=${param.pageNum }&mid=${member.mid }';
										  }
										})" class="btn">삭제 </span><br>
									</c:if>
								</form>
							</div>
							<div class="commentItem_commentContent">
								<p class="commentItem_commentContent">${dto.gccontent }</p>
							</div>
						</li>
						<hr>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>