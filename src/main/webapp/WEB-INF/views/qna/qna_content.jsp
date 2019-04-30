<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/qna_content.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document)
			.ready(
					function() {
						$('.goContent')
								.click(
										function() {
											var qnaNo = Number($(this).find(
													'#Num').val());
											var idCK = String($(this).find(
													'#idCk').val());
											var pwCk = String($(this).find(
													'#pwCk').val());

											if (pwCk != '') {
												if ('' != '${member.memberId}'
														&& idCK == '${member.memberId}') {
													location.href = "${conPath}/qna.do?method=content&qnaNo="
															+ qnaNo
															+ "&pageNum=${paging.currentPage}";
												} else if (pwCk == 'undefined') {
													alert('글이 없습니다');
												} else {
													alert('비밀글은 본인만 확인 가능합니다');
												}
											} else {
												location.href = "${conPath}/qna.do?method=content&qnaNo="
														+ qnaNo
														+ "&pageNum=${paging.currentPage}";
											}
										});

					});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="content_wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='qna.do?method=list'">Q n A |</li>
					<li>${content.qnaNo }.&nbsp;${content.qnaTitle }</li>
				</ul>
			</div>
		</div>
		<div class="content_back">
			<form action="${conPath }/qna.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="method" value="reWrite">

				<div class="content">
					<table>


						<c:if test="${not empty content.qnaFile}">
							<tr>
								<td colspan="2">&nbsp; ${content.qnaTitle }</td>
								<td class="var_right">File .</td>
							</tr>
							<tr>
								<td colspan="2" class="text"><br>
								<br>${content.qnaContent }</td>
								<td><img src="${conPath }/qna_Fileup/${content.qnaFile }"
									class="img"></td>
							</tr>
						</c:if>


						<c:if test="${empty content.qnaFile}">

							<tr>
								<td class="content_left">${content.qnaTitle }</td>
								<td class="content_right1">등록일 &nbsp; <fmt:formatDate
										value="${content.qnaDate}" pattern="yyyy.MM.dd" /></td>
								<td class="content_right">조 회 수 &nbsp; ${content.qnaHit }</td>
							</tr>
							<tr>
								<td colspan="3" class="content_mid"><br>
								<br>
								<br>${content.qnaContent }</td>
							</tr>


						</c:if>

					</table>
					<div class="menu_bar">
						<ul>
							<li><a href="${conPath}/qna.do?method=list">목록</a></li>

							<c:if test="${not empty admin.adminId }">
								<li><a
									href="${conPath}/qna.do?method=reWriteForm&qnaNo=${content.qnaNo }&pageNum=${pageNum}">
										답변 글 쓰기</a></li>
							</c:if>


							<c:if test="${content.memberId eq member.memberId}">

								<li><a
									href="${conPath}/qna.do?method=delete&qnaNo=${content.qnaNo}&pageNum=${pageNum}">글
										삭제</a></li>
								<li><a
									href="${conPath}/qna.do?method=modifyForm&qnaNo=${content.qnaNo}">글
										수정</a></li>
							</c:if>
						</ul>

					</div>

					<div class="bottom_bar">
						<table>
							<tr class="goContent">
								<td>이전글 ▲ &nbsp;</td>
								<c:if test="${empty contentPrevious.qnaTitle }">
									<td colspan="2">이전 글이 없습니다.</td>
								</c:if>
								<c:if test="${not empty contentPrevious.qnaTitle }">
									<input type="hidden" id="pwCk"
										value="${contentPrevious.qnanoPw }">
									<input type="hidden" id="idCk"
										value="${contentPrevious.memberId }">
									<input type="hidden" id="Num" value="${contentPrevious.qnaNo }">


									<td>${contentPrevious.qnaTitle }&nbsp;&nbsp;<c:if
											test="${not empty contentPrevious.qnaFile }">
											<img src="${conPath }/img/photo.png"> &nbsp;&nbsp; </c:if>
										<c:if test="${not empty contentPrevious.qnanoPw }">
											<img src="${conPath }/img/look.png">
										</c:if>

									</td>
									<td class="var_right">등록일 : <fmt:formatDate
											value="${contentPrevious.qnaDate }" pattern="yyyy.MM.dd" /></td>
								</c:if>
							</tr>

							<tr class="goContent">
								<td>다음글 ▼ &nbsp;</td>
								<c:if test="${empty contentNext.qnaTitle }">
									<td colspan="2">다음글이 없습니다.</td>
								</c:if>

								<c:if test="${not empty contentNext.qnaTitle }">
									<input type="hidden" id="pwCk" value="${contentNext.qnanoPw }">
									<input type="hidden" id="idCk" value="${contentNext.memberId }">
									<input type="hidden" id="Num" value="${contentNext.qnaNo }">

									<td>${contentNext.qnaTitle }&nbsp;&nbsp;<c:if
											test="${ not empty  contentNext.qnaFile }">
											<img src="${conPath }/img/photo.png">
										</c:if> &nbsp;&nbsp;<c:if test="${not empty contentNext.qnanoPw }">
											<img src="${conPath }/img/look.png">
										</c:if></td>
									<td class="var_right">등록일 : <fmt:formatDate
											value="${contentNext.qnaDate }" pattern="yyyy.MM.dd" /></td>
								</c:if>
							</tr>
						</table>

					</div>

				</div>
			</form>
		</div>

	</div>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>