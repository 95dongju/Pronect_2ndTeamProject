<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
		<!-------------------------------------------------참가 신청자 정보--------------------------------------------------------------->				
			<!-- <div class="groupJoin_info">
				<c:if test="${groupDetail.mid eq member.mid }">
					<c:forEach var="dto" items="${joinList }">
						<div class="groupJoin_memberInfo">
							<div class="groupJoin_memberInfo_img">${dto.mimage }</div>
							<div class="groupJoin_memberInfo_nickname">${dto.mnickname }</div>
						</div>
						<div class="groupJoin_acceptBtn">
							<button onclick="location.href='${conPath}/group/accept.do?mid=${dto.mid }&gid=${dto.gid }'">수락</button>
						</div>
					</c:forEach>
				</c:if>
			</div>
<!---------------------------------------------------그룹원 정보----------------------------------------------------------------->				
			<div class="groupMember_inf">
					<c:forEach var="dto" items="${groupMember }">
						<div class="groupJoin_memberInfo">
							<div class="groupJoin_memberInfo_img">${dto.mimage }</div>
							<div class="groupJoin_memberInfo_nickname">${dto.mnickname }</div>
						</div>
						<div class="groupJoin_acceptBtn">
							<button onclick="location.href='${conPath}/group/memberOut.do?mid=${dto.mid }&gid=${dto.gid }'">퇴출</button>
						</div>
					</c:forEach>
			</div>

</body>
</html>