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
<link href="${conPath }/css/item_Write.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document).ready(function() {
		$("#itemImage").change(function() {
			readURL(this);
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#loding').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div class="item_listWrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='qna.do?method=list'">S N A C K |</li>
					<li>상 품 등 록 |</li>
					<li>${content.qnaNo }&nbsp;${content.qnaTitle }</li>
				</ul>
			</div>
		</div>

		<div class="Item_title">
			<h1>영화만큼 즐거운 상품을 등록하세요.</h1>
		</div>
		<div class="content_form">
			<div id="content">
				<form action="${conPath }/item.do" method="post"
					enctype="multipart/form-data" runat="server">
					<input type="hidden" name="method" value="write">
					<table>
						<tr>
							<td>상품명</td>
							<td><input type="text" name="itemName" id="itemName"
								required="required"></td>
							<td rowspan="4"><img id="loding" src="#" alt="상품이미지"
								style="width: 100%; height: 130%;"></td>
						</tr>
						<tr>
							<td>상품 사진</td>
							<td><input type="file" name="tempItemImage" id="itemImage"
								required="required"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="itemPrice" id="itemPrice"
								required="required"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="등록">
								<button onclick="location.href='${conPath}/item.do?method=list'">목록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>