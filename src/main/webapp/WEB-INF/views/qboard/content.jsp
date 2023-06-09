<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
  <style>
  	.back{width : 30px; text-align: left;}
		#content{width:1000px;	margin:0 auto;}
  	table tr #qnaInfo {
			width:150px;
			font-size: 0.9em;
			font-weight: 900;
			padding: 0 0.75em 0.75em 0.75em;
			text-align: center;
			vertical-align: middle;
		}
		#btnContainer{text-align:center;}
		#btn{ margin:0 10px 0 10px;}
		#title{font-size: 2em; margin: 15px auto;}
		#mimage, #grdate, #mid{diplay:	inline}
		.mimage{width:30px; margin-right:20px;}
		.qboardDetail_writer{display:flex; align-items: center;}
		.qboardDetail_title {display:flext; flex-direction: column;}
		#content_pre {white-space: pre-wrap; word-break:break-all; overflow: auto;}
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
			<h2 id="title">${qDto.qtitle}</h2>
				<div class="qboardDetail_writer"><img class="mimage" style="width:60px; display:inline-block; border-radius: 30px;" src="${conPath}/memberFile/${qDto.mimage}" alt="사용자 이미지">
					<div class="qboardDetail_title">
						<div class="qboardDetail_userNickname">${qDto.mnickname }</div>
						<div class="qboardDetail_registerDate" class="grdate">작성일: ${qDto.qrdate }</div>
					</div>
				</div>
				<p style=clear:both;></p>
			<table>
				<tr><th id="qnaInfo">본문</th><td><pre id="content_pre">${qDto.qcontent }</pre></td></tr>
				<tr>
					<th id="qnaInfo">첨부파일</th>
					<td>
						<c:if test="${not empty qDto.qfile }">
							<c:if test="${member.manager eq 'Y' }">
								<a href="${conPath }/qboardFile/${qDto.qfile}">${qDto.qfile}</a>
							</c:if>
							<c:if test="${member.manager eq 'N'}">
								${qDto.qfile}
							</c:if>
						</c:if>
						<c:if test="${empty qDto.qfile }">
							첨부파일없음
						</c:if>
					</td>
				</tr>
				<tr>
					<td id="btnContainer" colspan="2">
						<c:if test="${member.mid eq qDto.mid}">
							<button id="btn" onclick="location='${conPath}/qboard/modify.do?qid=${param.qid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
						</c:if>
						<c:if test="${member.mid eq qDto.mid or member.manager eq 'Y'}">
							<button id="btn" onclick="location='${conPath}/qboard/delete.do?qid=${param.qid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">삭제</button>				
							<c:if test="${member.manager eq 'Y'}">
								<button id="btn" onclick="location='${conPath}/qboard/reply.do?qid=${param.qid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">답변</button>
							</c:if>
						</c:if>
						<button id="btn" onclick="location='${conPath}/qboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
















