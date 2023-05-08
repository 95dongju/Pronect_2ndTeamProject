<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
	  		$('.replyView').click(function(){
	  			var fcid = $(this).attr('id');
	  			$.ajax({
	  				url : '${conPath}/fcomment/replyView.do',
						data : {'fcid':fcid, 'pageNum':${param.pageNum}, 'commentPageNum':${commentPaging.currentPage}},
						type : 'get',
						dataType : 'html',
						success : function(data, status){
							$('.replySpace'+fcid).html(data);
						}
	  			});
	  		});
	  		
	  		$('#deleteBtn').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/fboard/delete.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}';
			        }
			    });
			    return false;
	  		});
	  		
	  		$('.liked').click(function(){
  				/* location.href = '${conPath}/fboard/likeDown.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'; */
  				Swal.fire({
  				  position: 'top-end',
  				  icon: 'success',
  				  title: '좋아요 취소하셨습니다',
  				  showConfirmButton: false,
  				  timer: 1000
  				}).then((result) => {
			        location.href = '${conPath}/fboard/likeDown.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}';
			    });
			});
			$('.unliked').click(function(){
				/* location.href = '${conPath}/fboard/likeUp.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'; */
				Swal.fire({
	  				  position: 'top-end',
	  				  icon: 'success',
	  				  title: '좋아요 하셨습니다!',
	  				  showConfirmButton: false,
	  				  timer: 1000
	  				}).then((result) => {
				        location.href = '${conPath}/fboard/likeUp.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}';
				    });
			});
	  	});
	  	
		function modifyComment(fcid, pageNum, fid, commentPageNum){
			$.ajax({
				url : '${conPath}/fcomment/modifyView.do',
				data : {'fcid':fcid, 'pageNum':pageNum, 'commentPageNum':commentPageNum},
				type : 'get',
				dataType : 'html',
				success : function(data, status){
					$('.reply'+fcid).html(data);
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
	<link href="${conPath }/css/boardContent.css" rel="stylesheet">
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${modifyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '글 수정을 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${modifyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '글 수정을 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentReplyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '대댓글 작성을 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentReplyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '대댓글 작성을 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentModifyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '댓글 수정을 완료하였습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentModifyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '댓글 수정을 실패하였습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentWriteResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '댓글 작성을 완료하였습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentWriteResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '댓글 작성을 실패하였습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentDeleteResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '댓글을 삭제하였습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentDeleteResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '댓글 삭제를 실패하였습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<!-- ${bDto } ${param.fid } ${param.pageNum } 들어옴 -->
	<jsp:include page="../main/header.jsp"/>
	<div class="board_wrap">
        <div class="board_title">
            <strong>자유게시판</strong>
            <p>ProNect에서 자유롭게 ConNect</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                	${fDto.ftitle}
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${fDto.fid}</dd>
                    </dl>
                    <dl>
                        <dt>작성자</dt>
                        <dd>${fDto.mid}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><fmt:formatDate value="${fDto.frdate }" type="both" dateStyle="short"/></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${fDto.fhit }</dd>
                    </dl>
                    <dl>
                        <dt>첨부파일</dt>
                        <dd>
                        	<c:if test="${not empty fDto.ffile }">
								<a href="${conPath }/fboardFile/${fDto.ffile}">${fDto.ffile}</a>
							</c:if>
							<c:if test="${empty fDto.ffile }">
								첨부파일없음
							</c:if>
                        </dd>
                    </dl>
                    <dl>
                        <dt>좋아요</dt>
                        <dd>${getLike }</dd>
                    </dl>
                    <dl>
                        <dt>IP</dt>
                        <dd>${fDto.fip }</dd>
                    </dl>
                </div>
                <div class="cont">
                	<pre>${fDto.fcontent }</pre>
                </div>
            </div>
            <div class="bt_wrap">
                <c:if test="${member.mid eq fDto.mid}">
					<button onclick="location='${conPath}/fboard/modify.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
				</c:if>
				<c:if test="${member.mid eq fDto.mid or member.manager eq 'Y'}">
					<button type="button" id="deleteBtn">삭제</button>
				</c:if>
				<button onclick="location='${conPath}/fboard/reply.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">답변</button>
				<button onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button><br>
				<c:if test="${like != 0}"><button  class="liked"><i class="fa-solid fa-thumbs-up fa-2xl"></i> 취소${getLike }</button></c:if>
				<c:if test="${like eq 0}"><button  class="unliked"><i class="fa-regular fa-thumbs-up fa-2xl"></i> 좋아요${getLike }</button></c:if>
            </div>
        </div>
        <br><br><br><br><br>
		<h3>댓글</h3>
		<form id="frm" action="${conPath }/fcomment/write.do" onsubmit="return confirmSubmit();">
			<input type="hidden" name="fid" value="${param.fid }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="mid" value="${member.mid }">
			<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
			<input type="submit" value="댓글 등록" class="btn" style="height:50px; float:left; margin: 5px;">
		</form>
		<p style="clear:both;"></p>
		<c:if test="${empty fcommentList }">등록된 댓글이 없습니다</c:if>
		<c:if test="${not empty fcommentList }">
			<c:forEach items="${fcommentList }" var="comment">
				<div class="reply${comment.fcid }" style="margin-left: 30px;">
					<div>
						<c:forEach var="i" begin="1" end="${comment.fcindent }">
							<c:if test="${i==comment.fcindent }">
					  			&nbsp; &nbsp; &nbsp; └
					  		</c:if>
							<c:if test="${i!=comment.fcindent }">
					  			&nbsp; &nbsp; &nbsp; 
					  		</c:if>
						</c:forEach>
						<span style="font-weight: blod; font-size: 1.3em; margin-right: 50px;">${comment.fccontent }</span> 
						<i>작성자: ${comment.mid} - 작성일시: ${comment.fcrdate }</i>&nbsp; &nbsp; 
						<i onclick="modifyComment(${comment.fcid}, ${param.pageNum}, ${fDto.fid}, ${commentPaging.currentPage})" class="fa-solid fa-eraser"></i>
						<%-- <span onclick="location='${conPath}/fcomment/delete.do?fcid=${comment.fcid }&fid=${param.fid }&pageNum=${param.pageNum }&commentPageNum=${commentPaging.currentPage }'" class="btn">[ 삭제 ]</span> --%>
						<i onclick="Swal.fire({
							  title: '삭제하시겠습니까?',
							  text: '삭제된 댓글은 복구할 수 없습니다.',
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonText: '삭제',
							  cancelButtonText: '취소'
							}).then((result) => {
							  if (result.isConfirmed) {
							    location='${conPath}/fcomment/delete.do?fcid=${comment.fcid}&fid=${param.fid}&pageNum=${param.pageNum}&commentPageNum=${commentPaging.currentPage}';
							  }
							})" class="fa-solid fa-trash-can"></i>
						<i id="${comment.fcid }" class="replyView fa-solid fa-reply fa-flip-vertical"></i>
					</div>
					<div class="replySpace${comment.fcid }"></div>
				</div>
				<br>
			</c:forEach>
		</c:if>
		<div class="paging">
			<c:if test="${commentPaging.startPage > commentPaging.blockSize }">
				[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${commentPaging.startPage-1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${commentPaging.startPage }" end="${commentPaging.endPage }">
				<c:if test="${i eq commentPaging.currentPage }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != commentPaging.currentPage }">
					[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${i}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
				[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${commentPaging.endPage+1}">다음</a> ]
			</c:if>
		</div>
    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>