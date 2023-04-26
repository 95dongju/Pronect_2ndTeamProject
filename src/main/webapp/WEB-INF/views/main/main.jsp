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
	<link rel="stylesheet" href="${conPath }/css/main.css" />
	<style>
		.style {
			border: 1px solid gray;
			padding: 10px;
			border-radius: 20px 20px 20px 20px;
		}
		#title {
    	text-overflow: ellipsis;
      white-space: nowrap;
      display : block; 
      margin-top: 10px;
      margin-bottom: 15px;
		}
	 	#hit {
		 text-align:right;
		 font:italic; size:0.2em;
		 height: 20px;
		 margin-bottom: 30px;
		 color:gray;
		}
	</style>
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
				<img src="${conPath}/images/pronect_banner.png" class="banner">
			</div>
			<nav id="nav">
				<ul>
					<li><a href="#">전체</a></li>
					<li><a href="#">프로젝트</a></li>
					<c:if test="${not empty member }">
						<li><a href="${conPath}/group/list.do?mid=${member.mid}&pageNum=1">스터디</a></li>
					</c:if>
					<c:if test="${empty member }">
						<li><a href="${conPath}/group/list.do?pageNum=1">스터디</a></li>
					</c:if>
				</ul>
				<div class="search_div">
					<input type="text" placeholder="스터디/프로젝트를 검색하세요" class="search">
				</div>
			</nav>
			<br>
			<div class="inner">
				<section class="tiles">
					<c:if test="${not empty groupList}">
						<c:forEach var="dto" items="${groupList }">
							<article class="style">
								<div>
									<a href="${conPath}/group/detail.do?gid=${dto.gid}&pageNum=${paging.currentPage}">
										<div class="content">
											<h2 id="title">${dto.gtitle } </h2>
											<p id="hit">조회수 : ${dto.ghit }</p>
											<p>${dto.gcontent }</p>
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
			</div>
		</div>

	<!-- Footer -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- Scripts -->
</body>
</html>