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
						<li><a href="${conPath}/study/list.do?mid=${member.mid}&pageNum=1">스터디</a></li>
					</c:if>
					<c:if test="${empty member }">
						<li><a href="${conPath}/study/list.do?pageNum=1">스터디</a></li>
					</c:if>
				</ul>
				<div class="search_div">
					<input type="text" placeholder="스터디/프로젝트를 검색하세요" class="search">
				</div>
			</nav>
			<br>
			<div class="inner">
				<section class="tiles">
					<c:if test="${not empty studyList}">
						<c:forEach var="dto" items="${studyList }">
							<article class="style">
								<div>
									<a href="${conPath}/study/detail.do?sid=${dto.sid}&pageNum=${paging.currentPage}">
										<div class="content">
											<h2 id="title">${dto.stitle } </h2>
											<p id="hit">조회수 : ${dto.shit }</p>
											<p>${dto.scontent }</p>
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
		<script src="${conPath }/js/jquery.min.js"></script>
		<script src="${conPath }/js/browser.min.js"></script>
		<script src="${conPath }/js/breakpoints.min.js"></script>
		<script src="${conPath }/js/util.js"></script>
		<script src="${conPath }/js/main.js"></script>	

</body>
</html>