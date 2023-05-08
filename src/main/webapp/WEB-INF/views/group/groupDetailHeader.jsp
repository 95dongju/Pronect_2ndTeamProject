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
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<!-- SweetAlert -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
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
		var pageNum = ${param.pageNum}
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
			        	location.href = '${conPath}/group/delete.do?gid=${param.gid }&pageNum='+pageNum;
			        }
			    });
			    return false;
	  		});
	  	});
		$(document).ready(function(){
	  		$('#completeBtn').click(function(){
	  			Swal.fire({
			        title: '그룹을 종료하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '종료',
			        denyButtonText: '취소',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/group/delete.do?gid=${param.gid }&pageNum='+pageNum;
			        	location.href = '${conPath}/group/complete.do?gid=${param.gid}&pageNum='+pageNum;
			        }
			    });
			    return false;
	  		});
	  	});
		function change_btn(e) {
			var btns = document.getElementsByClassName("mygroup_nav_p");
			  btns.forEach(function (btn, i) {
			    if (e.currentTarget == btn) {
			      btn.classList.add("active");
			    } else {
			      btn.classList.remove("active");
			    }
			  });
			  console.log(e.currentTarget);
			}
		
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
										<img class="language" src="${conPath }/logos/${groupDetail.glanguage1}.png" title="${groupDetail.glanguage1}" alt="${groupDetail.glanguage1}">
								</c:if>
								<c:if test="${not empty groupDetail.glanguage2 }">
										<img class="language" src="${conPath }/logos/${groupDetail.glanguage2}.png" title="${groupDetail.glanguage2}" alt="${groupDetail.glanguage2}">
								</c:if>
								<c:if test="${not empty groupDetail.glanguage3 }">
										<img class="language" src="${conPath }/logos/${groupDetail.glanguage3}.png" title="${groupDetail.glanguage3}" alt="${groupDetail.glanguage3}">
								</c:if>
							</span>
						</li>
					</ul>
				<p style=clear:both;></p>
				</div>
				<nav id="mygroup_nav">
					<ul>
						<li>
						<p class="mygroup_nav_p" id="groupDetail_info">
								${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 정보</p>
						</li>
						<li>
							<p class="mygroup_nav_p" id="groupDetail_schedule"> ${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 일정</p>
						</li>
						<li><p class="mygroup_nav_p" id="groupDetail_board">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판</p></li>
						<li><p class="mygroup_nav_p" id="groupDetail_memberInfo">멤버 정보</p></li>
					</ul>
					<p style=clear:both;></p>
				</nav>
			</div>
	</div>
</body>
</html>