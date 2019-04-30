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
<link href="${conPath }/css/item_detail.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						// 매점상품 글삭제 버튼 클릭이벤트
						$(delete_Btn)
								.click(
										function() {
											if (confirm("매점상품 글을 삭제하시겠습니까?") == true) { // 확인
												location = "${conPath}/item.do?method=delete&itemNo=${detail.itemNo}&pageNum=${param.pageNum}"
											} else { // 취소
												location = "${conPath}/item.do?method=list"
											}
										});
					});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="detail_Wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">S N A C K
						&nbsp;|&nbsp;</li>
					<li>&nbsp;${detail.itemName }&nbsp;|&nbsp;</li>
					<li>&nbsp; 상세보기</li>
				</ul>
			</div>
		</div>
		<div class="item_title">
			<h1>${detail.itemName }</h1>
		</div>

		<div id="content">
			<table>
				<tr>
					<th colspan="2"><img
						src="${conPath }/itemImgFileUpload/${detail.itemImage }"></th>
				</tr>
				<tr>
					<th>상품명 : ${detail.itemName }</th>
					<th>가격 : ${detail.itemPrice }</th>
				</tr>

				<tr>
					<td colspan="2"><c:if test="${not empty admin.adminId }">
							<button
								onclick="location='item.do?method=modifyForm&itemNo=${detail.itemNo}&pageNum=${param.pageNum}'">수정</button>
							<button
								onclick="location='item.do?method=delete&itemNo=${detail.itemNo }&pageNum=${param.pageNum }'"
								id="delete_Btn">삭제</button>
						</c:if>
						<button onclick="location='${conPath}/item.do?method=list'">목록</button>
					</td>
				</tr>
			</table>
		</div>

	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>