<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${conPath }/css/boardDetail.css" />
	<style>
		#content {width: 1000px; height:1200px;margin: 50px auto; }
		img{width: 100px;}
		a {text-decoration: none; color:black;}
		b {color:red;}
 		.back{width : 30px; text-align: left; margin-bottom:20px;}
 		#center {text-align: center;}
 		#titleBack{height:236px; background-color:#75348C; }
 		#listTitle{font-size:1.6em; text-align: center; color:white; box-shadow: black 1px;}
 		#listForm {text-align: right; width: 440px; float:right;}
 		#sch,#writeBtn {display:inline;}
 		#writeBtn{margin-left: 30px;}
 		#schArea form{
 			margin-bottom:40px;
 			width: 500px;
 			float: right;
 		}
 		#sch[name=schItem]{width:150px; text-align: center;}
 		#sch[name=schWord]{width:200px;}
 		#searchBtn {
 			display: inline-block;
 		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
			$('tr:not(:first-child)').click(function(){
				var fid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
				if(!isNaN(fid)){
					location.href = '${conPath}/fboard/content.do?fid='+fid+'&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';					
				}
			});
		});
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${writeResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '글 작성을 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${writeResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '글 작성에 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${deleteResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '글 삭제를 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '글 삭제에 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${replyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '답변 작성을 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '답변 작성에 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="boardTable">
		<div id="wrapper">
			<div id="main">
				<div id="inner">
					<div id="titleBack">
						<h2 id="listTitle" style="text-transform: none;">
							<i class="fa-solid fa-comment fa-beat" style="margin-top: 50px;"></i> 자유게시판<br><br>
							ProNect에서 자유롭게 ConNect
						</h2>
					</div>
					<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a><br>
					<div id="schArea">
						<form id="listForm" action="${conPath }/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}">
							<input type="hidden" name="pageNum" value="${param.pageNum }">
							<select id="sch" name="schItem">
								<option value=""
									<c:if test="${param.schItem eq '' }">selected="selected"</c:if>
								>검색조건</option>
								<option value="mid" 
									<c:if test="${param.schItem eq 'mid' }">selected="selected"</c:if>
								>아이디</option>
								<option value="ftitle" 
									<c:if test="${param.schItem eq 'ftitle' }">selected="selected"</c:if>
								>제목</option>
								<option value="fcontent" 
									<c:if test="${param.schItem eq 'fcontent' }">selected="selected"</c:if>
								>내용</option>
								<option value="ftitle+fcontent" 
									<c:if test="${param.schItem eq 'ftitle+fcontent' }">selected="selected"</c:if>
								>제목+내용</option>
								<option value="all" 
									<c:if test="${param.schItem eq 'all' }">selected="selected"</c:if>
								>제목+내용+글쓴이</option>
							</select>
							<input id="sch" type="text" name="schWord" value="${param.schWord }">
							<button type="submit" id="searchBtn"><i class="fa-solid fa-magnifying-glass fa-beat"></i> 검색</button>							
						</form>
						<button id="writeBtn" type="button" onclick="location.href='${conPath}/fboard/write.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'"><i class="fa-solid fa-pen"></i> 글쓰기</button>
					</div>
					<table id="boardTable" class="boardDetail">
						<caption>자유게시판</caption>
						<tr style="text-align: center;">
							<th>글번호</th><th>글쓴이</th><th>제목</th><th>작성일</th>
							<th>조회수</th><th>좋아요</th>
						</tr>
						<c:if test="${empty fboardList }">
							<tr><th style="text-align:center;" colspan="6">검색하신 조건의 글이 없습니다.</th></tr>
						</c:if>
						<c:forEach var="fboard" items="${fboardList }">
							<tr>					
								<td>${fboard.fid }</td>
								<td>${fboard.mid }</td>
								<td style="text-align: left;">
									<c:forEach var="i" begin="1" end="${fboard.findent }">
									 	<c:if test="${i == fboard.findent }">
									 		└─
									 	</c:if>
									 	<c:if test="${i != fboard.findent }">
									 		&nbsp; &nbsp; &nbsp; 
									 	</c:if>
									</c:forEach>
									${fboard.ftitle }
									<c:if test="${not empty fboard.ffile }">
										<img src="https://cdn-icons-png.flaticon.com/512/5088/5088374.png" style="width:15px;">
									</c:if>
									<c:if test="${fboard.commentCnt != 0 }"> <!-- 댓글이 있을 경우 title과 함께 댓글 갯수 출력 -->
										[${fboard.commentCnt }]
									</c:if>
								</td>
								<td><fmt:formatDate value="${fboard.frdate }" type="date" dateStyle="short"/></td>
								<td>${fboard.fhit }</td>
								<td>${fboard.likeCnt }</td>
							</tr>
						</c:forEach>
					</table><br>
					<div id="div_paging">
						<c:if test="${paging.startPage>paging.blockSize}">
							[ <a href="${conPath }/fboard/list.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
						</c:if>	
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }"> 
								<b>[ ${i } ]</b> 
							</c:if>
							<c:if test="${paging.currentPage != i }">
								[ <a href="${conPath }/fboard/list.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							[ <a href="${conPath }/fboard/list.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>