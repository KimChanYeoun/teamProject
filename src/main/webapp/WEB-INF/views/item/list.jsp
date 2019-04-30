<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/item_list.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$(".not_member").click(function() {
			location = "${conPath}/member.do?method=loginForm";
		})

		$("#allCheck").click(function() { // 모두선택 체크박스를 선택하면
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".oneCheck").prop("checked", true); // 나머지도 전부 체크됨
			} else {
				$(".oneCheck").prop("checked", false); // (모두선택 체크박스 선택을 안했을 경우) 나머지도 전부 체크가 안 됨
			}
		});
		
		$(".oneCheck").click(function() { // 개별 체크박스가 선택이 안되면, 모두선택 체크박스가 해제됨
			$("#allCheck").prop("checked", false);
		});

		
		
		$(".purchase").click(function() {
			if (confirm("선택한 상품을 구매하시겠습니까?") == true) { // 확인
				$('#frm').submit();
			} else { // 취소
				location = "${conPath}/item.do?method=list";
			}
		});
		$('#frm').submit(function(){
			if($('.oneCheck:checked').length==0){
				alert('상품을 선택하세요');
				return false;
			}
		});
	})
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="item_listWrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">S N A C K</li>
				</ul>
			</div>
		</div>

		<div class="item_title">
			<h1>영화보다 달콤한 이야기가 있는곳.</h1>
		</div>

		<div class="content_form">
			<form action="${conPath}/item.do" id="frm">
				<input type="hidden" name="method" value="purchaselist"> <input
					type="hidden" name="memberId" value="${member.memberId}">
				<div id="content">

					<c:forEach var="item" items="${list }">
						<div class="pic">
							<a
								href="${conPath }/item.do?method=detail&itemNo=${item.itemNo}
												&pageNum=${paging.currentPage}"
								class="left"> ${item.itemNo } .<br> <img
								src="${conPath }/itemImgFileUpload/${item.itemImage}">
							</a> <br>${item.itemName }<br> <input type="checkbox"
								name="itemNo" class="oneCheck" data-cartNum="${item.itemNo }"
								value="${item.itemNo }" /> ${item.itemPrice }원
						</div>


					</c:forEach>
				</div>

			</form>
		</div>
		<div class="paging">
			<c:if test="${paging.startPage>paging.blockSize}">
		[ <a
					href="${conPath }/item.do?method=list&pageNum=${paging.startPage+1 }">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<b>[ ${i } ]</b>
				</c:if>
				<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/item.do?method=list&pageNum=${i }">${i }</a> ]
		</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a
					href="${conPath }/item.do?method=list&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
		</div>
		<!--페이징  -->

		<div class="submit_go">
			<input type="hidden" name="method" value="purchaselist">
			<c:if test="${not empty admin.adminId }">
				<input type="button" value="매점상품등록"
					onclick="location='${conPath }/item.do?method=writeForm'">
			</c:if>

			<input type="checkbox" name="allCheck" id="allCheck" /><label
				for="allCheck">모두 선택</label>

			<c:if test="${not empty member }">
				<input class="purchase" type="button" value="구매하기" name="purchase">
			</c:if>
			<c:if test="${empty member }">
				<input class="not_member" type="button" value="로그인 후 구매"
					name="not_member">
			</c:if>


		</div>
	</div>


	<jsp:include page="../main/footer.jsp" />
</body>


</html>