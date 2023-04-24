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
					<li><a href="#">스터디</a></li>
				</ul>
				<div class="search_div">
					<input type="text" placeholder="스터디/프로젝트를 검색하세요" class="search">
				</div>
			</nav>
			<br>
			<div class="inner">
				<section class="tiles">
					<article class="style">
						<div>
							<a href="#">
								<div class="content">
									<h2>스터디(Pronect) 프로젝트 </h2>
									<p>디자이너 1명 구합니다</p>
								</div>
							</a>
						</div>
					</article>
					<article class="style">
						<div>
							<a href="#">
								<div class="content">
									<h2>일렉트로닉 팝 레이블 Wave Orbit 프로젝트</h2>
									<p>저희는 네 명으로 구성된 일렉트로닉 팝 레이블 Wave Orbit입니다.</p>
								</div>
							</a>
						</div>
					</article>
					<article class="style">
						<div>
							<a href="#">
								<div class="content">
									<h2>독서 플랫폼 프로젝트</h2>
									<p>프론트엔드 개발 팀원을 구합니다</p>
								</div>
							</a>
						</div>
					</article>
					<article class="style">
						<div>
							<a href="#">
								<div class="content">
									<h2>제목</h2>
									<p>내용</p>
								</div>
							</a>
						</div>
					</article>
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