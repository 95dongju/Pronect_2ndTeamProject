<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="${conPath}/css/groupDetail.css" rel="stylesheet" />
	<link href="${conPath}/css/boardDetail.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<jsp:include page="groupDetailHeader.jsp"/>
	<!-----------------------------------------------------그룹 본문------------------------------------------------------------------->
	<div id="main">
		<!-------------------------------------------------참가 신청자 정보--------------------------------------------------------------->				
			<c:if test="${groupDetail.mid eq member.mid }">
				<h2>참가 신청자 정보</h2>
					<div class="groupJoin_info">
						<c:if test="${empty joinList }">
							<p>신청자가 없습니다</p>
						</c:if>
						<c:if test="${not empty joinList }">
							<c:forEach var="dto" items="${joinList }">
								<div class="groupJoin_memberInfo">
									<div class="groupJoin_memberInfo_img">${dto.mimage }</div>
									<div class="groupJoin_memberInfo_nickname">${dto.mnickname }</div>
								</div>
								<div class="groupJoin_acceptBtn">
									<c:if test="${groupDetail.mid ne dto.mid }">
										<button onclick="location.href='${conPath}/group/accept.do?mid=${dto.mid }&gid=${dto.gid }&pageNum=${param.pageNum }'">수락</button>
									</c:if>
								</div>
							</c:forEach>
						</c:if>
					</div>

<!---------------------------------------------------그룹원 정보(그룹장 자신 퇴출 가능하게 보이는것 고쳐야함)----------------------------------------------------------------->				
			<h2>그룹원 정보</h2>
			<div class="groupMember_inf">
				<c:if test="${empty groupMember }">
					<p>그룹원이 없습니다</p>
				</c:if>
				<c:if test="${not empty groupMember }">
					<c:forEach var="dto" items="${groupMember }">
						<div class="groupJoin_memberInfo">
							<div class="groupJoin_memberInfo_img">${dto.mimage }</div>
							<div class="groupJoin_memberInfo_nickname">${dto.mnickname }</div>
						</div>
						<div class="groupJoin_acceptBtn">
							<c:if test="${groupDetail.mid eq dto.mid }">
								<p><b>★그룹장</b></p>
							</c:if>
							<c:if test="${groupDetail.mid ne dto.mid }">
								<button onclick="location.href='${conPath}/group/memberOut.do?mid=${dto.mid }&gid=${dto.gid }&pageNum=${param.pageNum }'">퇴출</button>
							</c:if>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>