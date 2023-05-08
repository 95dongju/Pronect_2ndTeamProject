<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PRONECT</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath }/css/mypage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${empty member}">
		<script>
			alert('로그인 후 이용 가능합니다.');
			location.href='${conPath}/member/login.do';
		</script>
	</c:if>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<section class="tiles">
					<c:if test="${not empty StudyList}">
						<c:forEach var="dto" items="${StudyList }">
							<article class="style">
								<div>
									<a href="${conPath}/group/detail.do?gid=${dto.gid}&pageNum=${studyPaging.currentPage}&mid=${member.mid}" title="${dto.gtitle }">
										<div class="content">
											<div class="titleContent">
												<h2 class="gtitle">${dto.gtitle }</h2>
											</div>
											<p style="height:40px;">
												<c:if test="${not empty dto.glanguage1}">
													<img class="language" style="border-radius: 50px;" src="${conPath }/logos/${dto.glanguage1}.png" alt="${dto.glanguage1}">
												</c:if>
												<c:if test="${not empty dto.glanguage2}">
													<img class="language" style="border-radius: 50px;" src="${conPath }/logos/${dto.glanguage2}.png" alt="${dto.glanguage2}">
												</c:if>
												<c:if test="${not empty dto.glanguage3}">
													<img class="language" style="border-radius: 50px;" src="${conPath }/logos/${dto.glanguage3}.png" alt="${dto.glanguage3}">
												</c:if>
											<hr>
											<div>
												<p class="writer">
													<img class="image" style="border-radius: 50px;" src="${conPath }/memberFile/${dto.mimage}" alt="사용자 이미지"><span class="mnickname"> ${dto.mnickname}</span>
													<span id="hitCnt"><img class="hit" src="${conPath }/logos/hit.png" alt="조회수">${dto.ghit }<img class="commentCnt" src="${conPath }/logos/comment.png" alt="댓글수">${dto.comment_count}</span>
												</p>
											</div>
										</div>
									</a>
								</div>
							</article>
						</c:forEach>
					</c:if>
				</section>
				<div id="div_paging">
					<c:if test="${studyPaging.startPage>studyPaging.blockSize}">
						[ <a href="${conPath }/group/myGroupList.do?pageNum=${studyPaging.startPage-1 }">이전</a> ]
					</c:if>	
					<c:forEach var="i" begin="${studyPaging.startPage}" end="${studyPaging.endPage }">
						<c:if test="${studyPaging.currentPage==i }"> 
							<b>[ ${i } ]</b> 
						</c:if>
						<c:if test="${studyPaging.currentPage != i }">
							[ <a href="${conPath }/group/myGroupList.do?pageNum=${i }">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${studyPaging.endPage<paging.pageCnt }">
						[ <a href="${conPath }/group/myGroupList.do?pageNum=${studyPaging.endPage+1 }">다음</a> ]
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>