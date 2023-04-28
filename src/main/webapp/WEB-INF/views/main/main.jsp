<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Pronect</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="${conPath }/css/main.css" />
	<script>
		$(function(){
			$('#searchBtn').click(function(){
				var searchtxt = $('#searchtxt').val();
				location.href= '${conPath}/searchGroup.do?cgName='+searchtxt;
			});
		});
	</script>
</head>
<body class="is-preload">
<c:if test="${member.mstate eq 'N'}">
	<script>
		alert('탈퇴했거나 없는 회원입니다.');
		location.href="${conPath}/member/logout.do";
	</script>
</c:if>
<jsp:include page="header.jsp"/>
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div id="banner">
				<a href="#"><img src="${conPath}/images/pronect_banner.png" class="banner"></a>
			</div>
			<nav id="nav">
				<ul>
					<c:if test="${not empty member }">
						<li><a href="${conPath}/group/groupList.do?mid=${member.mid}&pageNum=1">전체</a></li>
						<li><a href="${conPath}/group/studyList.do?mid=${member.mid}&pageNum=1">스터디</a></li>
						<li><a href="${conPath}/group/projectList.do?mid=${member.mid}&pageNum=1">프로젝트</a></li>
						<li style="float:right; margin-right:70px;"><a href="${conPath}/group/register.do">새 글 쓰기</a></li>
					</c:if>
					<c:if test="${empty member }">
						<li><a href="${conPath}/group/groupList.do?pageNum=1">전체</a></li>
						<li><a href="${conPath}/group/studyList.do?pageNum=1">스터디</a></li>
						<li><a href="${conPath}/group/projectList.do?pageNum=1">프로젝트</a></li>
					</c:if>
				</ul>
				<div class="search_div">
					<input type="text" placeholder="스터디/프로젝트를 검색하세요" class="searchtxt"><img src="${conPath }/images/searchIcon.png" id="searchBtn">
				</div>
			</nav>
			<br>
			<div class="inner">
				<section class="tiles">
					<c:if test="${not empty list}">
						<c:forEach var="dto" items="${list }">
							<article class="style">
								<div>
									<a href="${conPath}/group/detail.do?name=${name }&gid=${dto.gid}&pageNum=${paging.currentPage}">
										<div class="content">
											<h2 class="gtitle">${dto.gtitle } </h2>
											<p class="ghit">조회수 : ${dto.ghit }</p>
											<p class="gcontent">${dto.gcontent }</p>
										</div>
									</a>
								</div>
							</article>
						</c:forEach>
					</c:if>
					<c:if test="${not empty studyList}">
						<c:forEach var="dto" items="${studyList }">
							<article class="style">
								<div>
									<a href="${conPath}/group/detail.do?gid=${dto.gid}&pageNum=${paging.currentPage}">
										<div class="content">
											<h2 class="gtitle">${dto.gtitle } </h2>
											<p class="ghit">조회수 : ${dto.ghit }</p>
											<p class="gcontent">${dto.gcontent }</p>
										</div>
									</a>
								</div>
							</article>
						</c:forEach>
					</c:if>
					<c:if test="${not empty projectList}">
						<c:forEach var="dto" items="${projectList }">
							<article class="style">
								<div>
									<a href="${conPath}/group/detail.do?gid=${dto.gid}&pageNum=${paging.currentPage}">
										<div class="content">
											<h2 class="gtitle">${dto.gtitle } </h2>
											<p class="ghit">조회수 : ${dto.ghit }</p>
											<p class="gcontent">${dto.gcontent }</p>
										</div>
									</a>
								</div>
							</article>
						</c:forEach>
					</c:if>
<%-- 					<c:if test="${not empty projectList}">
						<c:forEach var="dto" items="${projectList }">
							<article class="style">
								<div>
									<a href="#">
										<div class="pcontent">
											<h2>${dto.ptitle } </h2>
											<p>${dto.pcontent }</p>
										</div>
									</a>
								</div>
							</article>
						</c:forEach>
					</c:if> --%>
				</section>
				<div id="div_paging">
					<c:if test="${paging.startPage>paging.blockSize}">
						[ <a href="${conPath }/group/${name}List.do?pageNum=${paging.startPage-1 }">이전</a> ]
					</c:if>	
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						<c:if test="${paging.currentPage==i }"> 
							<b>[ ${i } ]</b> 
						</c:if>
						<c:if test="${paging.currentPage != i }">
							[ <a href="${conPath }/group/${name}List.do?pageNum=${i }">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage<paging.pageCnt }">
						[ <a href="${conPath }/group/${name}List.do?pageNum=${paging.endPage+1 }">다음</a> ]
					</c:if>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>