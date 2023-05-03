<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<style>
		#img{width:40px; height:40px; border-radius: 30px; margin-right: 10px;}
		.commentItem_writer{display:flex; align-items: center;}
		.commentItem_title {display:flext; flex-direction: column;}
	</style>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
	  		$('#deleteBtn').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/group/commentDelete.do?gid=${param.gid }&pageNum=${param.pageNum}';
			        }
			    });
			    return false;
	  		});
	  	});
	  	
		function modifyComment(gcid, pageNum, gid){
			$.ajax({
				url : '${conPath}/group/commentModify.do',
				data : {'gcid':gcid, 'pageNum':pageNum, 'gid':gid},
				type : 'get',
				dataType : 'html',
				success : function(data, status){
					$('.reply'+gcid).html(data);
				}
			});
		}
		
		function confirmSubmit(){
		    Swal.fire({
		        title: '댓글 작성을 완료하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm').submit();
		        }
		    });
		    return false;
		}
	</script>
</head>
<body>
	<div class="groupContent_detailContentWrapper">
				<h2 class="groupContent_detailInfo">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 소개</h2>
				<pre>${groupDetail.gcontent }</pre>
	</div>
	<div class="groupContent_btns">
		<c:if test="${not empty member}">
			<c:if test="${groupDetail.mid ne member.mid and joincheck eq 9}">
				<p>그룹장에 의해 퇴출되어 재가입 불가능합니다</p>
			</c:if>
			<c:if test="${groupDetail.mid ne member.mid and joincheck eq 0}">
				<button onclick="location='${conPath }/group/join.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
			</c:if>
			<c:if test="${groupDetail.mid ne member.mid and joincheck eq 1}">
				<button onclick="location='${conPath }/group/unJoin.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
			</c:if>
			<c:if test="${groupDetail.mid ne member.mid and joincheck eq 2}">
				<button onclick="location='${conPath }/group/memberOut.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">그룹 탈퇴</button>
			</c:if>
			<c:if test="${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
				<button onclick="location='${conPath }/group/modify.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">수정</button>
				<button id="deleteBtn" onclick="location='${conPath }/group/delete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">삭제</button>
				<button onclick="location='${conPath }/group/complete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">그룹 종료</button>
			</c:if>
		</c:if>
		<c:if test="${empty member}">
			<button onclick="location='${conPath}/member/login.do'">참가 신청</button>
		</c:if>
		<P>${member }////${groupDetail }///${joincheck }
	</div>
	<div class="studyContent_detailComment">
		<div class="commentInput_commentText">
			<hr>
			<h2>${groupDetail.comment_count}개의 댓글이 있습니다.</h2>
			<c:if test="${not empty member }">
				<form id="frm" action="${conPath}/group/comment.do" method="get">
					<input type="hidden" name="gid" value="${param.gid }">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
					<input type="hidden" name="mid" value="${member.mid }">
					<textarea class="commentInput_commentText_textarea" name="gccontent" placeholder="댓글을 입력하세요."></textarea>
					<div class="contentInput_buttonWrapper">
							<button class="comentInput_buttonSubmit">댓글 등록</button>
					</div>
				</form>
			</c:if>
		</div>
		<c:if test="${not empty groupComment }">
			<hr>
			<ul class="commentList">
				<c:forEach var="dto" items="${groupComment }">
					<li class="reply${dto.gcid }" class="commentItem_commentContainer">
						<div class="commentItem_commentHeader">
							<form action="${conPath}/group/comment.do" method="get">
								<input type="hidden" name="gid" value=${dto.gid }>
								<input type="hidden" name="gcid" value=${dto.gcid }>
								<input type="hidden" name="pageNum" value=${param.pageNum }>
								<div class="commentItem_writer"><img src="${conPath }/memberFile/${dto.mimage}" id="img" class="commentItem_userImg" alt="사용자 이미지">
									<div class="commentItem_commentInfo">
										<div class="commentItem_title">
											<div class="commentItem_userNickname">${dto.mnickname } 님</div>
											<div class="commentItem_registerDate">${dto.gcrdate }</div>
										</div>
									</div>
								</div>
								<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
									<%-- <span><a class="comment_modify" style="color : black; text-decoration:none; cursor:pointer">수정 </a></span> --%>
									<span class="comment_modify" class="btn" onclick="modifyComment(${dto.gcid}, ${param.pageNum}, ${groupDetail.gid})">수정 </span>
									<%-- <span><a href="${conPath}/GCommentDelete.do?gid=${dto.gid}&gcid=${dto.gcid}" >삭제</a></span><br> --%>
									<span style="color : black; text-decoration:none;" onclick="Swal.fire({
									  title: '삭제하시겠습니까?',
									  text: '삭제된 댓글은 복구할 수 없습니다.',
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonText: '삭제',
									  cancelButtonText: '취소'
									}).then((result) => {
									  if (result.isConfirmed) {
									    location='${conPath}/group/commentDelete.do?gid=${dto.gid}&gcid=${dto.gcid}&pageNum=${param.pageNum }';
									  }
									})" class="btn">삭제 </span><br>
								</c:if>
							</form>
						</div>
						<div class="commentItem_commentContent">
							<p class="commentItem_commentContent">${dto.gccontent }</p>
						</div>
					</li>
					<hr>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</body>
</html>