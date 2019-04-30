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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#content{
	width: 800px;
	height: 800px;
	margin: 50px auto;
	border: 2px solid red;
	text-align: center;
	background-color: yellow;
}
.pic{
	border:3px solid black;
}
img {
	width: 200px;
	height: 200px;
	border: 3px solid green;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div id="content">
		<table>
			<caption>ITEM</caption>
			<tr>
				<td><input type="button" value="매점상품등록"
					onclick="location='${conPath }/item.do?method=writeForm'">
				</td>
			</tr>

			<tr>
				<c:forEach var="item" items="${list }">
					<td>
						<div class="pic">
					<a href="${conPath }/item.do?method=detail&itemNo=${item.itemNo}
											&pageNum=${paging.currentPage}">
							<img src="${conPath }/itemImgFileUpload/${item.itemImage}">
					</a><br> ${item.itemName }<br> ${item.itemPrice }<br>
						<input type="button" value="리스트담기" class="addB">
						</div>
				</c:forEach>
			</tr>
			
			
			
		</table>

		<div>
			<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/item.do?method=list&pageNum=${paging.startPage+1 }">이전</a> ]
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
		[ <a href="${conPath }/item.do?method=list&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
		</div>
	</div>
	

	<jsp:include page="../main/footer.jsp" />
</body>

<script>
	$(".addB").click(function(){
		if(confirm("리스트에 담으시겠습니까?")==true) { // 확인
			location = "${conPath}/item.do?method=purchaselist";	
		} else { //취소
			location = "${conPath}/item.do?method=list"
		}
	});
	
</script>

</html>