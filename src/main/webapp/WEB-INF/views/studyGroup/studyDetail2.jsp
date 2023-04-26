<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
	#back {
		width: 1000px;
		margin: 0 auto;
	}
	#studyDetail{
		width: 1000px;
		margin: 0 auto;
	}
	.back{
		width : 30px;
		text-align: left;
	}
	button{
		text-align: center;
	}
	#commentContent{
		border-radius: 10px;
	}
	#submitBtn{
		border-radius: 20px;
		background-color:black;
		color:white;
	}
	
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="main">
		<section class="groupContent_detailHeader">
			<div id="back">
				<a href="list.do?pageNum=${param.pageNum}"><img class = "back" src="${conPath}/images/back.png"></a>
			</div>
				<div class="groupDetail_title">${groupDetail.gtitle }</div>
				<div class="groupDetail_writer">
					<div class="mimage">${groupDetail.mimage } </div><div class="mid">${studyDetail.mid } |</div>
				</div>
				<div class="srdate">${groupDetail.srdate }</div>
				<ul class="groupInfo_groupGrid">
					<li>
						<span class="groupInfo_title">모집 구분</span>
						<span class="groupInfo_content">프로젝트 / 스터디 </span>
					</li>
					<li>
						<span class="groupInfo_title">모집 인원</span>
						<span class="groupInfo_content">${studyDetail.gpeople } </span>
					</li>
					<li>
						<span class="groupInfo_title">시작 예정</span>
						<span class="groupInfo_content">${studyDetail.gsdate }  </span>
					</li>
					<li>
						<span class="groupInfo_title">지역</span>
						<span class="groupInfo_content">${studyDetail.gloc } </span>
					</li>
					<li>
						<span class="groupInfo_title">완료 예정</span>
						<span class="groupInfo_content">${studyDetail.gfdate } </span>
					</li>
					<li>
						<span class="groupInfo_title">사용 언어</span>
						<span class="groupInfo_content">
							<c:if test="${empty studyDetail.glanguage1 and empty studyDetail.glanguage2 and empty studyDetail.glanguage3}">
								-
							</c:if>
							<c:if test="${not empty studyDetail.glanguage1 }">
									${studyDetail.glanguage1 }
							</c:if>
							<c:if test="${not empty studyDetail.glanguage2 }">
									/ ${studyDetail.glanguage2 }
							</c:if>
							<c:if test="${not empty studyDetail.glanguage3 }">
									/ ${studyDetail.glanguage3 }
							</c:if>
						</span>
					</li>
				</ul>
			</section>
			<div class="groupContent_detailContentWrapper">
				<h2 class="groupContent_detailInfo">프로젝트 소개</h2>
				<hr>
				<pre>${studyDetail.gcontent }</pre>
			</div>
			<div class="groupContent_btns">
				<c:if test="${not empty member}">
					<c:if test="${studyDetail.mid ne member.mid and empty joincheck}">
						<button onclick="location='join.do?sid=${studyDetail.sid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
					</c:if>
					<c:if test="${studyDetail.mid ne member.mid and not empty joincheck}">
						<button onclick="location='unJoin.do?sid=${studyDetail.sid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
					</c:if>
					<c:if test="${studyDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
						<button onclick="location='modify.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">수정</button>
						<button onclick="location='delete.do?sid=${studyDetail.sid}&pageNum=${param.pageNum}'">삭제</button>
					</c:if>
				</c:if>
				<c:if test="${empty member}">
					<button onclick="location='${conPath}/member/login.do'">참가 신청</button>
				</c:if>
			</div>
	<!----------------------------------------------------- 댓글 ------------------------------------------------------->
		<div class="studyContent_detailComment">
			<div class="commentInput_commentText">
				<hr>
				<h2>0개의 댓글이 있습니다.</h2>
				<form action="#">
					<textarea class="commentInput_commentText_textarea" placeholder="댓글을 입력하세요."></textarea>
					<div class="contentInput_buttonWrapper">
						<button class="comentInput_buttonSubmit">댓글 등록</button>
					</div>
				</form>
				<hr>
			</div>
			<c:if test="${not empty studyComment }">
				<ul class="commentList">
					<c:forEach var="dto" items="${studyComment }">
						<li class="commentItem_commentContainer">
							<section class="commentItem_commentHeader">
								<form action="${conPath}/study/comment.do" method="post">
									<input type="hidden" name="sid" value=${dto.gid }>
									<input type="hidden" name="scid" value=${dto.gcid }>
									<input type="hidden" name="pageNum" value=${param.pageNum }>
									<div class="commentItem_writer"><img src="" class="commentItem_userImg" alt="사용자 이미지">
										<div class="commentItem_commentInfo">
											<div class="commentItem_title">
												<div class="commentItem_userNickname">${dto.mnickname }</div>
												<div class="commentItem_registerDate">${dto.gcrdate }</div>
											</div>
										</div>
									</div>
									<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
										<span><a class="comment_modify" style="color : black; text-decoration:none; cursor:pointer">수정 </a></span>
										<span><a href="${conPath}/SCommentDelete.do?sid=${dto.sid}&scid=${dto.scid}" style="color : black; text-decoration:none;">삭제</a></span><br>
									</c:if>
								</form>
							</section>
							<section class="commentItem_commentContent">
								<p class="commentItem_commentContent">${dto.sccontent }</p>
							</section>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>