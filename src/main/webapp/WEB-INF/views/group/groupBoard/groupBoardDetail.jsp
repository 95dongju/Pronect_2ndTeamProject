<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
				location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
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
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						Swal.fire({
					        title: '그룹 가입 후 이용 가능합니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
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
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum="+pageNum;
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
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						Swal.fire({
					        title: '그룹 가입 후 이용 가능합니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
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
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
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
				if(${groupDetail.mid ne member.mid and joincheck eq 0}){
					Swal.fire({
				        title: '그룹장만 확인할 수 있습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
					Swal.fire({
				        title: '그룹장만 확인할 수 있습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
					Swal.fire({
				        title: '그룹장만 확인할 수 있습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				        }
				    });
				    return false;
				}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
					location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				}
			}
		});
	});
	</script>
	<script>
		$(document).ready(function(){
			var pageNum = ${param.pageNum};
			if(pageNum == null || pageNum == ''){
				pageNum = 1;
			}
			$('tr:not(:first-child)').click(function(){
				if(${not empty groupBoard}){
					var group_bid = Number($(this).children().eq(0).text());
					location.href='${conPath}/groupBoard/detail.do?group_bid='+group_bid+'&gid='+${groupDetail.gid}+'&pageNum='+pageNum;
				}
			});
			$('#groupBoard_writeBtn').click(function(){
				location.href='${conPath}/groupBoard/write.do?gid='+${groupDetail.gid}+'&pageNum='+pageNum;
			});
			$('#groupBoard_searchBtn').click(function(){
				let searchGroupBoard_Word = $('#searchGroupBoard_Word').val();
				let searchGroupBoard = $('#searchGroupBoard').val();
				document.getElementById('calendar').style.display = 'none';
				$('.groupDetail').html('');
				$.ajax({
					url : '${conPath}/groupBoard/list.do?',
					datatype : 'html',
					data : "gid="+${groupDetail.gid }+"&pageNum="+pageNum+"&searchGroupBoard="+searchGroupBoard+"&searchGroupBoard_Word="+searchGroupBoard_Word,
					success : function(data, status){
						$('.groupDetail').html(data);
					}
				});
			});
			$('#editGroupBoardContent').click(function(){
				location.href = '${conPath}/groupBoard/modify.do?group_bid=${param.group_bid}&gid=${param.gid }&pageNum='+pageNum;
			});
	  		$('#deleteGroupBoardContent').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning'
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/groupBoard/delete.do?group_bid=${param.group_bid}&gid=${param.gid }&pageNum='+pageNum;
			        }
			    });
			    return false;
	  		});
		});
	</script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
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
		<div class="back">
			<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
		</div>
	 	<div class="boardDetail">
			<c:if test="${not empty groupBoardDetail }">
				<h2 id="boardTitle">${groupBoardDetail.group_board_title }</h2>
				<h5 id="boardWriter">작성자: ${groupBoardDetail.mid } <span id="boardRdate">작성일: ${groupBoardDetail.group_board_rdate }</span> </h5>
				<c:if test="${groupBoardDetail.mid eq member.mid}">
					<pre id="deleteGroupBoardContent"> 삭제 </pre> <pre id="editGroupBoardContent"> 수정 </pre>
				</c:if>
				<p id="boardContent">${groupBoardDetail.group_board_content }</p>
				<div id="div_comment">
					<h4 id="boardComment">댓글</h4>
					<c:if test="${empty groupBoardComment }">
						<p id="boardCommentContent">등록된 댓글이 없습니다.</p>
					</c:if>
					<c:if test="${not empty groupBoardComment }">
						<c:forEach var="gbComment" items="${groupBoardComment }">
							<p id="boardCommentWriter">${gbComment.mid } <span id="boardCommentRdate">${gbComment.group_board_rep_rdate }</span> </p>
							<c:if test="${gbComment.mid eq member.mid}">
								<pre> 삭제 </pre> <pre> 수정 </pre>
							</c:if>
							<p id="boardCommentContent">${gbComment.group_board_rep_content }</p>
						</c:forEach>
					</c:if>
				</div>
				<textarea class="inputBox"></textarea><input type="submit" value="등록">	
				<div id="div_paging">
					<c:if test="${commentPaging.startPage > commentPaging.blockSize }">
						[ <a href="${conPath }/groupBoard/detail.do?gid=${param.gid}&boardPageNum=${param.boardPageNum }&commentPageNum=${commentPaging.startPage-1}">이전</a> ]
					</c:if>
					<c:forEach var="i" begin="${commentPaging.startPage }" end="${commentPaging.endPage }">
						<c:if test="${i eq commentPaging.currentPage }">
							[ <b> ${i } </b> ]
						</c:if>
						<c:if test="${i != commentPaging.currentPage }">
							[ <a href="${conPath }/groupBoard/detail.do?gid=${param.gid}&boardPageNum=${param.boardPageNum }&commentPageNum=${i}">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.pageCnt }">
						[ <a href="${conPath }/groupBoard/detail.do?gid=${param.gid}&boardPageNum=${param.boardPageNum }&commentPageNum=${commentPaging.endPage+1}">다음</a> ]
					</c:if>
				</div>
			</c:if>		
		</div>
	</div>
	<jsp:include page="../../main/footer.jsp"/>
</body>
</html>