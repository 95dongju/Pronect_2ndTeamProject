<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
	<link href="${conPath}/css/boardDetail.css" rel="stylesheet" />
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
	<script>
		$(document).ready(function(){
			$('tr:not(:first-child)').click(function(){
				var group_bid = Number($(this).children().eq(0).text());
				$.ajax({
					url : '${conPath}/groupBoard/detail.do?',
					datatype : 'html',
					data : "group_bid="+group_bid+"&gid="+${groupDetail.gid},
					success : function(data, status){
						$('.groupDetail').html(data);
					}
				});
			});
			$('#groupBoard_writeBtn').click(function(){
				document.getElementById('calendar').style.display = 'none';
				$('.groupDetail').html('');
				$.ajax({
					url : '${conPath}/groupBoard/write.do?',
					datatype : 'html',
					data : "gid="+${groupDetail.gid}+"&pageNum="+${param.pageNum },
					success : function(data, status){
						$('.groupDetail').html(data);
					}
				});
			});
			$('#groupBoard_searchBtn').click(function(){
				let searchGroupBoard_Word = $('#searchGroupBoard_Word').val();
				let searchGroupBoard = $('#searchGroupBoard').val();
				document.getElementById('calendar').style.display = 'none';
				$('.groupDetail').html('');
				$.ajax({
					url : '${conPath}/groupBoard/list.do?',
					datatype : 'html',
					data : "gid="+${groupDetail.gid }+"&pageNum="+${param.pageNum }+"&searchGroupBoard="+searchGroupBoard+"&searchGroupBoard_Word="+searchGroupBoard_Word,
					success : function(data, status){
						$('.groupDetail').html(data);
					}
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
				<div id='calendar'></div>
			</nav>
		</div>
		<div id="groupBoardList">
			<h2>${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판 </h2>
			<table id="boardTable">
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>좋아요</td>
					<td>조회수</td>
				</tr>
				<c:if test="${empty groupBoard }">
					<tr>
						<td colspan="5">작성된 글이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty groupBoard }">
					<c:forEach var="groupBoard" items="${groupBoard }">
						<tr>
							<td>${groupBoard.group_bid }</td>
							<td class="boardTitle">
								${groupBoard.group_board_title }
								<c:if test="${groupBoard.rep_cnt != 0 }">
								&nbsp; ( <b>${groupBoard.rep_cnt }</b> )
								</c:if>
							</td>
							<td>${groupBoard.mid }</td>
							<td>${groupBoard.group_board_like }</td>
							<td>${groupBoard.group_board_hit }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>		
			<div id="div_search">
				<select name="searchGroupBoard" id="searchGroupBoard" class="inputBox">
							<option value=""
								<c:if test="${param.searchGroupBoard eq '' }">selected="selected"</c:if>
							>검색 조건</option>
							<option value="mid" 
								<c:if test="${param.searchGroupBoard eq 'mid' }">selected="selected"</c:if>
							>아이디</option>
							<option value="title" 
								<c:if test="${param.searchGroupBoard eq 'title' }">selected="selected"</c:if>
							>제목</option>
							<option value="content" 
								<c:if test="${param.searchGroupBoard eq 'content' }">selected="selected"</c:if>
							>내용</option>
							<option value="hit" 
								<c:if test="${param.searchGroupBoard eq 'hit' }">selected="selected"</c:if>
							>조회수 높은 순</option>
							<option value="like" 
								<c:if test="${param.searchGroupBoard eq 'like' }">selected="selected"</c:if>
							>좋아요 높은 순</option>
							<option value="SearchAll" 
								<c:if test="${param.searchGroupBoard eq 'SearchAll' }">selected="selected"</c:if>
							>전체 검색</option>
				</select>
				<input type="text" name="searchGroupBoard_Word" id="searchGroupBoard_Word" class="inputBox">
				<input type="submit" value="검색" id="groupBoard_searchBtn">
				<button id="groupBoard_writeBtn">글쓰기</button>
			</div>
			<div id="div_paging">
				<c:if test="${paging.startPage>paging.blockSize}">
					[ <a href="${conPath }/fboard/list.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
				</c:if>	
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }"> 
						<b>[ ${i } ]</b> 
					</c:if>
					<c:if test="${paging.currentPage != i }">
						[ <a href="${conPath }/fboard/list.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					[ <a href="${conPath }/fboard/list.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../../main/footer.jsp"/>
</body>
</html>