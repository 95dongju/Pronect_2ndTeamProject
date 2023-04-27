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
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
	  		$('.commentReplyView').click(function(){
	  			var fcid = $(this).attr('id');
	  			$.ajax({
	  				url : '${conPath}/fcomment/reply.do',
						data : {'fcid':fcid, 'pageNum':pageNum, 'commentPageNum':commentPageNum},
						type : 'get',
						dateType : 'html',
						success : function(data, status){
							$('.commentReply'+fcid).html(data);
						}
	  			});
	  		});
	  	});
		
		function modifyComment(fcid, pageNum, fid, commentPageNum){
			$.ajax({
				url : '${conPath}/fcomment/modify.do',
				data : {'fcid':fcid, 'pageNum':pageNum, 'commentPageNum':commentPageNum},
				type : 'get',
				dateType : 'html',
				success : function(data, status){
					$('.commentReplySpace'+fcid).html(data);
				}
			});
		}
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${modifyResult eq SUCCESS }">
		<script>alert('글 수정에 성공하였습니다');</script>
	</c:if>
	<c:if test="${modifyResult eq 0 }">
		<script>alert('글 수정을 실패했습니다'); history.back();</script>
	</c:if>
	<!-- ${bDto } ${param.fid } ${param.pageNum } 들어옴 -->
	<table>
		<caption>글 내용</caption>
		<tr><th>글번호</th><td>${fDto.fid}</td></tr>
		<tr><th>글쓴이</th><td>${fDto.mid}</td></tr>
		<tr><th>제목</th><td>${fDto.ftitle}</td></tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${fDto.frdate }" type="both" dateStyle="short"/></td>
		</tr>
		<tr><th>본문</th><td><pre>${fDto.fcontent }</pre></td></tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${not empty fDto.ffile }">
					<a href="${conPath }/fboardFile/${fDto.ffile}">${fDto.ffile}</a>
				</c:if>
				<c:if test="${empty fDto.ffile }">
					첨부파일없음
				</c:if>
			</td>
		</tr>
		<tr><th>IP</th><td>${fDto.fip }</td></tr>
		<tr><th>조회수</th><td>${fDto.fhit }</td></tr>
		<tr><th>좋아요</th><td>${fDto.flike }</td></tr>
		<tr>
			<td colspan="2">
				<c:if test="${member.mid eq fDto.mid}">
					<button onclick="location='${conPath}/fboard/modify.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
				</c:if>
				<c:if test="${member.mid eq fDto.mid or member.manager eq 'Y'}">
					<button onclick="location='${conPath}/fboard/delete.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">삭제</button>				
				</c:if>
				<button onclick="location='${conPath}/fboard/reply.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">답변</button>
				<button onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button>
			</td>
		</tr>
	</table>
	
	<h3>댓글</h3>
	<form action="${conPath }/fcomment/write.do" method="post">
		<input type="hidden" name="fid" value="${fDto.fid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="mid" value="${member.mid }">
		<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
		<input type="submit" value="등록" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
	<p style="clear:both;"></p>
	<c:if test="${empty fcommentList }">등록된 댓글이 없습니다</c:if>
	<c:if test="${not empty fcommentList }">
		<c:forEach items="${fcommentList }" var="fcomment">
			<div class="commentReply${fcomment.fcid }">
				<div class="toggle${fcomment.fcid }">
					<c:forEach var="i" begin="1" end="${fcomment.fcindent }">
						<c:if test="${i==fcomment.fcindent }">
				  			&nbsp; &nbsp; &nbsp; └
				  		</c:if>
						<c:if test="${i!=fcomment.fcindent }">
				  			&nbsp; &nbsp; &nbsp; 
				  		</c:if>
					</c:forEach>
					${fcomment.fcid }.
					<span style="font-weight: blod; font-size: 1.3em;">${fcomment.fccontent }</span> 
					<i>from ${fcomment.mid} - at ${fcomment.fcrdate }</i>
					<c:if test="${member.mid eq fcomment.mid or member.manager eq 'Y' }">
						<span onclick="location='${conPath}/fcomment/delete.do?fcid=${fcomment.fcid }&fid=${fDto.fid }&pageNum=${param.pageNum }&commentPageNum=${commentPaging.currentPage }'" class="btn">[ 삭제 ]</span>
						<span class="btn" onclick="modifyComment(${fcomment.fcid}, ${param.pageNum}, ${fDto.fid}, ${commentPaging.currentPage})">[ 수정 ]</span>					
					</c:if>
					<span class="modifyBtn${fcomment.fcid }" class="commentReplyView" class="btn">[ 답변 ]</span>
				</div>
				<div class="commentReplySpace${fcomment.fcid }"></div>
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
</body>
</html>
















