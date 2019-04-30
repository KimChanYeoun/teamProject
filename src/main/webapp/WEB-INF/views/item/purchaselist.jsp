<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today" />

<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
<link href="${conPath }/css/purchase_list.css" rel="stylesheet"
	type="text/css">
</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="purchase_listWrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li>S N A C K</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>결 제 완 료</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				</ul>
			</div>
		</div>

		<div class="purchase_title">
			<h1>결제가 완료되었습니다 .</h1>
		</div>


		<div class="purchase_form">
			
			<c:forEach var="item" items="${purchaselist }">
				<input type="hidden" name="itemNo" value="${item.itemNo}">
				<table>
					<tr>
						<td>
							<div class="pic">
								<a
									href="${conPath }/item.do?method=purchaselist&itemNo=${item.itemNo}
												&pageNum=${paging.currentPage}">NO
									. ${item.itemNo }<br> <img
									src="${conPath }/itemImgFileUpload/${item.itemImage}">
								</a><br> 상풍명 : ${item.itemName }<br>&nbsp;&nbsp;&nbsp;금액
								:${item.itemPrice }<br>
							</div>
					</tr>
				</table>
			</c:forEach>
		</div>
		<div class="totInfo">
			<table>
				<tr>
					<td rowspan="4"><a href="${conPath}/member.do?method=myInfo">My
							Page</a></td>
					<td>아이디</td>
					<td>${memberId}</td>
				</tr>
				<tr>
					<td>상품갯수</td>
					<td>${purchaselist.size() }개</td>
				</tr>
				<tr>
					<td>총 가격</td>
					<td>${totalPrice}원</td>
				</tr>
				<tr>
					<td>구매날짜</td>
					<td>${today}</td>
				</tr>
				<tr>

				</tr>
			</table>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />


</html>