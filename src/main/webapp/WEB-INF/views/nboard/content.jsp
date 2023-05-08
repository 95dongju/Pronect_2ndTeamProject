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
  <style>
  	.back{width : 30px; text-align: left;}
		#content{max-width: 1000px;	margin:0 auto;}
  	table tr #qnaInfo {
			width:100px;
			font-size: 0.9em;
			font-weight: 900;
			display: inline-block;
			padding: 0 0.75em 0.75em 0.75em;
			text-align: center;
			vertical-align: middle;
		}
		#btnContainer{text-align:center;}
		#btn{ margin:0 10px 0 10px;}
		#title{font-size: 2em; margin: 15px auto;}
		#mimage, #grdate, #mid{diplay:	inline}
		.mimage{width:30px; margin-right:20px;}
		.groupDetail_writer{display:flex; align-items: center;}
		.groupDetail_title {display:flext; flex-direction: column;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div>
			<c:set var="SUCCESS" value="1"/>
			<c:set var="FAIL" value="0"/>
			<c:if test="${modifyResult eq SUCCESS }">
				<script>alert('글 수정에 성공하였습니다');</script>
			</c:if>
			<c:if test="${modifyResult eq 0 }">
				<script>alert('글 수정을 실패했습니다'); history.back();</script>
			</c:if>
			<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
			<h2 id="title">${nDto.ntitle}</h2>
				<div class="groupDetail_writer"><img class="mimage" style="width:60px; display:inline-block; border-radius: 30px;" src="${conPath}/memberFile/${nDto.mimage}" alt="사용자 이미지">
					<div class="groupDetail_title">
						<div class="groupDetail_userNickname">${nDto.mnickname } 님</div>
						<div class="groupDetail_registerDate">작성일: ${nDto.nrdate }</div>
					</div>
				</div>
				<p style=clear:both;></p>
			<table>
				<tr><th id="qnaInfo">본문</th><td><pre>${nDto.ncontent }</pre></td></tr>
				<tr>
					<th id="qnaInfo">첨부파일</th>
					<td>
						<c:if test="${not empty nDto.nfile }">
							<a href="${conPath }/nboardFile/${nDto.nfile}">${nDto.nfile}</a>
						</c:if>
						<c:if test="${empty nDto.nfile }">
							첨부파일없음
						</c:if>
					</td>
				</tr>
				<tr>
					<td id="btnContainer" colspan="2">
						<c:if test="${member.mid eq nDto.mid}">
							<button id="btn" onclick="location='${conPath}/nboard/modify.do?nid=${param.nid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
						</c:if>
						<c:if test="${member.mid eq nDto.mid or member.manager eq 'Y'}">
							<button id="btn" onclick="location='${conPath}/nboard/delete.do?nid=${param.nid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">삭제</button>				
							<c:if test="${member.manager eq 'Y'}">
								<button id="btn" onclick="location='${conPath}/nboard/reply.do?nid=${param.nid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">답변</button>
							</c:if>
						</c:if>
						<button id="btn" onclick="location='${conPath}/nboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
















