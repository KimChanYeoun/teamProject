<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/my_itemList.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="myItemList_Wrap">

		<div class="content_info">
			<div class="select">
				<ul>
					<li>MY M A C</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My Info</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My ItemList</li>
				</ul>
			</div>
		</div>




		<div id="content">
			<table>
				<caption>구매내역 보기</caption>
				<tr>
					<th class="item_title">구매번호</th>
					<th class="item_money">품명</th>
					<td class="item_total">총금액</td>
					<td class="item_date" style="width: 100px;">구매일</td>
				</tr>
				<c:if test="${empty myItemList }">
					<tr>
						<th colspan="4">최근 이력이 없습니다</th>
					</tr>
					<tr>
						<th colspan="4"><input type="reset" value="뒤로가기"
							onclick="history.back()"></th>
					</tr>
				</c:if>
				<c:if test="${not empty myItemList }">
					<c:set var="idx" value="0" />
					<c:forEach var="myItemList" items="${myItemList }">
						<tr>
							<th class="item_title">${myItemList.purchaseNo }</th>
							<td class="item_money">${myPurchaseItemList.get(idx)}</td>
							<td class="item_total">${myItemList.purchasePrice}</td>
							<td class="item_date">${myItemList.purchaseDate }</td>
						</tr>
						<c:set var="idx" value="${idx+1 }" />
					</c:forEach>
				</c:if>
			</table>


			<div id="paging">
				<c:if test="${paging.startPage>paging.blockSize}">
		[ <a
						href="${conPath }/member.do?method=myItemList&memberId=${memberId }&pageNum=${paging.startPage-1 }">이전</a> ]
	</c:if>
				<c:forEach var="i" begin="${paging.startPage}"
					end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<b>[ ${i } ]</b>
					</c:if>
					<c:if test="${paging.currentPage != i }">
			[ <a
							href="${conPath }/member.do?method=myItemList&memberId=${memberId }&pageNum=${i }">${i }</a> ]
		</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a
						href="${conPath }/member.do?method=myItemList&memberId=${memberId }&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>