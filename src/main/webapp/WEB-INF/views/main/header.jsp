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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://kit.fontawesome.com/4626b7e71c.js" crossorigin="anonymous"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
		function logout(){
		    Swal.fire({
		        title: "로그아웃 하시겠습니까?",
		        icon: "question",
		        showCancelButton: true,
		        confirmButtonText: "로그아웃",
		        cancelButtonText: "취소"
		    }).then((result) => {
		        if (result.isConfirmed) {
		            Swal.fire({
		                title: "로그아웃되었습니다.",
		                text: "다음에 다시 만나요~",
		                footer: "3초 뒤에 자동으로 사라집니다",
		                imageUrl: '${conPath}/images/pexels-leeloo-thefirst-5238584.jpg',
		                imageHeight: 400,
		                timer: 3000
		            }).then(() => {
		                location.href = "${conPath}/member/logout.do";
		            });
		        }
		    });
		    return false;
		}
	</script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
					<li><a href="${conPath }/member/join.do"><i class="fa-solid fa-pen-nib fa-bounce" style="--fa-animation-duration: 2s;"></i> 회원가입</a></li>
					<li><a href="${conPath }/member/login.do"><i class="fa-solid fa-user fa-bounce" style="--fa-animation-duration: 2s;"></i> 로그인</a></li>
					<li><a href="#menu">메뉴</a></li>
				</ul>
			</c:if>
			<c:if test="${not empty member}">
				<ul>
					<li><a href="${conPath }/group/register.do"><i class="fa-solid fa-square-plus fa-shake" style="--fa-animation-duration: 2s;"></i> 스터디/프로젝트  등록</a></li>
					<li><a href="${conPath }/member/logout.do"  onclick="return logout()"><i class="fa-solid fa-right-from-bracket fa-fade" style="--fa-animation-duration: 3s;"></i> 로그아웃</a></li>
					<li><a href="${conPath}/member/mypage.do"><i class="fa-solid fa-user-tie fa-beat"></i> ${member.mnickname }님</a></li>
					<li><a href="#menu">메뉴</a></li>
				</ul>
			</c:if>
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<h2>Menu</h2>
		<ul>
			<li><a href="${conPath}/main.do"><i class="fa-solid fa-house-chimney fa-beat" style="--fa-animation-duration: 2s;"></i> Home</a></li>
			<li><a href="${conPath }/fboard/list.do?pageNum=1"><i class="fa-solid fa-comment fa-beat-fade" style="--fa-beat-fade-opacity: 0.5; --fa-animation-duration: 2s;"></i> 자유게시판</a></li>
			<li><a href="${conPath }/qboard/list.do?pageNum=1"><i class="fa-regular fa-circle-question fa-flip" style="--fa-animation-duration: 3s;"></i> 문의게시판</a></li>
			<li><a href="${conPath }/nboard/list.do?pageNum=1"><i class="fa-solid fa-bullhorn fa-shake" style="--fa-animation-duration: 3s;"></i> 공지게시판</a></li>
			<c:if test="${member.manager eq 'Y' }">
				<li><a href="${conPath }/member/list.do?pageNum=1"><i class="fa-solid fa-users"></i> 회원목록(관리자 전용)</a></li>
			</c:if>
		</ul>
	</nav>
	<script src="${conPath }/js/util.js"></script>
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/browser.min.js"></script>
	<script src="${conPath }/js/breakpoints.min.js"></script>
	<script src="${conPath }/js/main.js"></script>	
</body>
</html>