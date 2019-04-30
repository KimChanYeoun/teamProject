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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${conPath }/css/event_content.css" rel="stylesheet"
	type="text/css">
<script>
	$(document)
			.ready(
					function() {
						// 이벤트 글삭제 버튼 클릭이벤트
						$(delete_Btn)
								.click(
										function() {
											if (confirm("이벤트 글을 삭제하시겠습니까?") == true) { // 확인
												location = "${conPath}/event.do?method=delete&eventNo=${detail.eventNo}&pageNum=${param.pageNum}"
											} else { // 취소
												location = "${conPath}/event.do?method=list"
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
					<li onclick="location.href='item.do?method=list'">E V E N T</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>${detail.eventTitle }</li>
				</ul>
			</div>
		</div>

		<div class="content">

			<table>
				<tr>
					<th>제목 : ${detail.eventTitle }</th>
					<th>날짜 : ${detail.eventDate }</th>
				</tr>
				<tr>
					<th colspan="2"><img
						src="${conPath }/eventImgFileUpload/${detail.eventFile }"></th>
				</tr>
				<tr>
					<td colspan="2" style="text-align:right;">
						<c:if test="${not empty admin }">
							<button
								onclick="location='event.do?method=modifyForm&eventNo=${detail.eventNo}&pageNum=${param.pageNum}'">수정</button>
							<button
								onclick="location='event.do?method=delete&eventNo=${detail.eventNo }&pageNum=${param.pageNum }'"
								id="delete_Btn">삭제</button>
						</c:if>
						<button onclick="location='${conPath}/event.do?method=list'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>

</body>
<jsp:include page="../main/footer.jsp" />
</html>