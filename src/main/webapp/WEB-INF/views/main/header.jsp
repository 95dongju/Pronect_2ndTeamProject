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
		
		
	</style>
</head>
<body class="is-preload">
	<header id="header">
		<div class="logo">	
			<a href="${conPath }/main.do">
				<img src="${conPath }/images/pronect_logo.png" alt="로고" />
			</a>
		</div>
		<nav>
			<c:if test="${empty member}">
				<ul>
					<li><a href="${conPath }/member/join.do">회원가입</a></li>
					<li><a href="${conPath }/member/login.do">로그인</a></li>
					<li><a href="#menu">메뉴</a></li>
				</ul>
			</c:if>
			<c:if test="${not empty member}">
				<ul>
					<li><a href="${conPath }/member/modify.do">정보수정</a></li>
					<li><a href="${conPath }/member/logout.do">로그아웃</a></li>
					<li><a>${member.mname }님</a></li>
					<c:if test="${member.manager eq 'Y' }">
					<li><a href="${conPath }/member/list.do?pageNum=1">회원목록(관리자 전용)</a></li>
					</c:if>
					<li><a href="#menu">메뉴</a></li>
				</ul>
			</c:if>
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<h2>Menu</h2>
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="generic.html">MyStudy</a></li>
			<li><a href="generic.html">MyProject</a></li>
		</ul>
	</nav>
	<script src="${conPath }/js/util.js"></script>
</body>
</html>