<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<script src="${conPath }/js/summernote/summernote-lite.js"></script>
	<script src="${conPath }/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${conPath }/css/summernote/summernote-lite.css">
	<style>
		#writeGroupBoard h2 {
			text-align: center;
		}
		#div_writeBtn {
			text-align: center;
		}
		#div_writeBtn input {
			margin: 10px;
		}
	</style>
	<!-- GroupDetailNav (네비게이션바 Script) -->
	<script>
		$(document).ready(function(){
			var pageNum = ${param.pageNum};
			if(pageNum == null || pageNum == ''){
				pageNum = 1;
			}
			$('#groupBoardListBtn').click(function(){
				location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum="+pageNum;
			});
			$('#groupDetail_info').click(function(){
				location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
			});
			$('#groupDetail_schedule').click(function(){
				if(${empty member}){
					Swal.fire({
				        title: '로그인 후 이용 가능합니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href="${conPath}/member/login.do";
				        }
				    });
				    return false;
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						Swal.fire({
					        title: '그룹 가입 후 이용 가능합니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						Swal.fire({
					        title: '그룹 승인 대기 중입니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}
				}
			});
		$('#groupDetail_board').click(function(){
			if(${empty member}){
				Swal.fire({
			        title: '로그인 후 이용 가능합니다',
			        confirmButtonText: '확인',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href="${conPath}/member/login.do";
			        }
			    });
			    return false;
				}else if(${not empty member}){
					if(${groupDetail.mid ne member.mid and joincheck eq 0}){
						Swal.fire({
					        title: '그룹 가입 후 이용 가능합니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
						Swal.fire({
					        title: '그룹 승인 대기 중입니다',
					        confirmButtonText: '확인',
					        icon: 'warning',
					    }).then((result) => {
					        if (result.isConfirmed) {
					        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					        }
					    });
					    return false;
					}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
						location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
						location.href = "${conPath}/groupBoard/list.do?gid=${groupDetail.gid}&pageNum="+pageNum;
					}
				}
			});
		$('#groupDetail_memberInfo').click(function(){
			if(${empty member}){
				Swal.fire({
			        title: '로그인 후 이용 가능합니다',
			        confirmButtonText: '확인',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href="${conPath}/member/login.do";
			        }
			    });
			    return false;
			}else if(${not empty member}){
				if(${groupDetail.mid ne member.mid and joincheck eq 0}){
					Swal.fire({
				        title: '그룹장만 확인할 수 있습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 1}){
					Swal.fire({
				        title: '그룹장만 확인할 수 있습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				        }
				    });
				    return false;
				}else if(${groupDetail.mid ne member.mid and joincheck eq 2}){
					Swal.fire({
				        title: '그룹장만 확인할 수 있습니다',
				        confirmButtonText: '확인',
				        icon: 'warning',
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	location.href = "${conPath}/group/detail.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				        }
				    });
				    return false;
				}else if(${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}){
					location.href = "${conPath}/group/memberInfo.do?gid=${groupDetail.gid}&pageNum="+pageNum;
				}
			}
		});
	});
	</script>
	 <script>
	 	$.getScript('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js', function(){
	 		var setting = {
	 	            height : 300,
	 	            minHeight : null,
	 	            maxHeight : null,
	 	            focus : true,
	 	            lang : 'ko-KR',
	 	           toolbar: [
	 				    ['fontname', ['fontname']],
	 				    ['fontsize', ['fontsize']],
	 				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	 				    ['color', ['forecolor','color']],
	 				    ['para', ['paragraph']],
	 				    ['height', ['height']],
	 				    ['insert',['picture']],
	 				  ],
	 				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	 				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	 	            callbacks : { 
	 	            	onImageUpload : function(files, editor, welEditable) {
	 	            for (var i = files.length - 1; i >= 0; i--) {
	 	            uploadSummernoteImageFile(files[i],
	 	            this);
	 	            		}
	 	            	}
	 	            }
	 	         };
	 	        $('#summernote').summernote(setting);
		});
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
	 </script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
	<!-----------------------------------------------------그룹 본문------------------------------------------------------------------->
	<div id="main">
		<div class="groupContent_detailHeader">
			<div id="back">
				<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
			</div>
				<div class="groupDetail_title">${groupDetail.gtitle }</div>
<!-----------------------------------------------그룹리더 정보------------------------------------------------------------------->
				<div class="groupDetail_writer">
					<div class="mimage"><img src="${conPath}/memberFile/${groupDetail.mimage}" alt="사용자 이미지"></div><div class="mid">${groupDetail.mnickname } |</div>
					<div class="grdate">작성일: ${groupDetail.grdate }</div>
					<c:if test=" ${empty groupDetail.mimage}">
						이미지 비어있음
					</c:if>
				</div>
				<p style=clear:both;></p>
<!-------------------------------------------------그룹 정보--------------------------------------------------------------------->
				<div class="groupContent_detail">
					<ul class="groupInfo_groupGrid">
						<li>
							<span class="groupInfo_title">모집 구분&nbsp;&nbsp; </span>
							<span class="groupInfo_content">
								<c:if test="${groupDetail.gcharacter eq 'P' }">
									<b>프로젝트</b>
								</c:if>
								<c:if test="${groupDetail.gcharacter eq 'S'}">
									<b>스터디</b>
								</c:if>
							</span>
						</li>
						<li>
							<span class="groupInfo_title">모집 인원&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gpeople }명 </span>
						</li>
						<li>
							<span class="groupInfo_title">시작 예정&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gsdate }  </span>
						</li>
						<li>
							<span class="groupInfo_title">지역&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gloc } </span>
						</li>
						<li>
							<span class="groupInfo_title">완료 예정&nbsp;&nbsp;</span>
							<span class="groupInfo_content">${groupDetail.gfdate } </span>
						</li>
						<li>
							<span class="groupInfo_title">사용 언어&nbsp;&nbsp;</span>
							<span class="groupInfo_content_lang">
								<c:if test="${empty groupDetail.glanguage1 and empty groupDetail.glanguage2 and empty groupDetail.glanguage3}">
									-
								</c:if>
								<c:if test="${not empty groupDetail.glanguage1 }">
										${groupDetail.glanguage1 }
								</c:if>
								<c:if test="${not empty groupDetail.glanguage2 }">
										 / ${groupDetail.glanguage2 }
								</c:if>
								<c:if test="${not empty groupDetail.glanguage3 }">
										 / ${groupDetail.glanguage3 }
								</c:if>
							</span>
						</li>
					</ul>
				<p style=clear:both;></p>
			</div>
			<nav id="mygroup_nav">
				<ul>
					<li>
					<p id="groupDetail_info">
							${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 정보</p>
					</li>
					<li>
						<p id="groupDetail_schedule"> ${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 일정</p>
					</li>
					<li><p id="groupDetail_board">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판</p></li>
					<c:if test="${groupDetail.mid eq member.mid }">
						<li><p id="groupDetail_memberInfo">멤버 정보</p></li>
					</c:if>
				</ul>
				<p style=clear:both;></p>
			</nav>
		</div>
		<div id="writeGroupBoard">
		<h2>그룹게시판 글쓰기</h2>
			<form action="${conPath }/groupBoard/write.do">
				<input type="hidden" name="gid" value="${groupDetail.gid }">
				<input type="hidden" name="mid" value="${member.mid }">
				<input type="text" name="group_board_title" placeholder="제목을 입력하세요" required="required">
				<textarea id="summernote" name="group_board_content" class="inputBox" required="required"></textarea>
				<div id="div_writeBtn">
				<input type="submit" value="작성"><input type="button" value="목록" id="groupBoardListBtn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>