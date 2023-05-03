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
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<style>
		#content {width: 1000px; height:1200px;margin: 50px auto; }
		img{width: 100px;}
		a {text-decoration: none; color:black;}
		b {color:red;}
 		.back{width : 30px; text-align: left;}
 		#center {text-align: center;}
 		#schArea{
 			background-color:gray;
 			border-radius: 30px;
 			width:200px;
 		}
 		#schArea input[type=submit]{
	 		background-image: url('${conPath}/logos/Search.png');
	    background-position:  0px 0px;
	    background-repeat: no-repeat;
	    width: 15%;
	    height: 20px;
	    border: 0px;
			cursor:pointer;
			outline: 0;
			display:inline;
		}
 		#schArea input[name=schWord]{
 			width:80%;
			display:inline;
 		}
 		form select[name=schItem]{
 			width:70px;
 		}
 		
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('tr:not(:first-child)').click(function(){
				var nid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
				if(!isNaN(nid)){
					location.href = '${conPath}/nboard/content.do?nid='+nid+'&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';					
				}
			});
		});
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${writeResult eq SUCCESS }">
		<script>alert('글 작성을 완료했습니다');</script>
	</c:if>
	<c:if test="${writeResult eq FAIL }">
		<script>alert('글 작성에 실패했습니다');</script>
	</c:if>
	<c:if test="${deleteResult eq SUCCESS }">
		<script>alert('${param.nid}번 글을 삭제하였습니다');</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>alert('${param.nid}번 글 삭제에 실패했습니다');</script>
	</c:if>
	<c:if test="${replyResult eq SUCCESS }">
		<script>alert('답글을 작성하셨습니다');</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>alert('답변 작성에 실패했습니다');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<div id="content">
					<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
					<div>
						<form action="${conPath }/nboard/list.do">
							<select name="schItem">
								<option value=""
									<c:if test="${param.schItem eq '' }">selected="selected"</c:if>
								>검색조건</option>
								<option value="ntitle" 
									<c:if test="${param.schItem eq 'qtitle' }">selected="selected"</c:if>
								>제목</option>
								<option value="ncontent" 
									<c:if test="${param.schItem eq 'qcontent' }">selected="selected"</c:if>
								>내용</option>
								<option value="all" 
									<c:if test="${param.schItem eq 'all' }">selected="selected"</c:if>
								>제목+내용</option>
							</select>
							<div id="schArea">
								<input type="text" name="schWord" value="${param.schWord }">
								<input type="submit" value="">
							</div>
						</form>
						<button type="button" onclick="location.href='${conPath}/nboard/write.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">글쓰기</button>
					</div>
					<table>
						<caption style="font-size:1.5em; margin-bottom:20px">문의게시판</caption>
						<tr>
							<th id="center">글번호</th><th id="center" >글쓴이</th><th id="center" >제목</th><th id="center" >작성일</th>
						</tr>
						<c:if test="${empty nboardList }">
							<tr><th id="center" colspan="4">검색하신 조건의 글이 없습니다.</th></tr>
						</c:if>
						<c:forEach var="nboard" items="${nboardList }">
							<tr>					
								<td id="center" >${nboard.nid }</td>
								<td id="center" >${nboard.mid }</td>
								<td class="left">
									${nboard.ntitle }
									<c:if test="${not empty nboard.nfile }">
										<img src="https://cdn-icons-png.flaticon.com/512/5088/5088374.png" style="width:15px;">
									</c:if>
								</td>
								<td id="center"><fmt:formatDate value="${nboard.nrdate }" type="date" dateStyle="short"/></td>
							</tr>
						</c:forEach>
					</table><br>
					<div id="div_paging">
						<c:if test="${paging.startPage>paging.blockSize}">
							[ <a href="${conPath }/nboard/list.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
						</c:if>	
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }"> 
								<b>[ ${i } ]</b> 
							</c:if>
							<c:if test="${paging.currentPage != i }">
								[ <a href="${conPath }/nboard/list.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							[ <a href="${conPath }/nboard/list.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>