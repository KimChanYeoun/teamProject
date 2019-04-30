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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document).ready(function() {
		$("#itemImage").change(function() {
			$('#output').text($('input[type=file]')[0].files[0].name);
			readURL(this);

		});

		$("label").click(function() {
			$("#itemImage").click();

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
<jsp:include page="../main/header.jsp" />
<body>
	<div class="modify_Wrap">

		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">S N A C K
						&nbsp;|&nbsp;</li>
					<li>&nbsp;${detail.itemName }&nbsp;|&nbsp;</li>
					<li>&nbsp; 수정하기</li>
				</ul>
			</div>
		</div>
		<div class="item_title">
			<h1>${detail.itemName }</h1>
		</div>



		<div class="modify_content">
			<form action="${conPath }/item.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="method" value="modify"> <input
					type="hidden" name="pageNum" value="${param.pageNum }"> <input
					type="hidden" name="itemNo" value="${detail.itemNo }">

				<table border="1">
					<tr>
						<td>상품명</td>
						<td><input type="text" name="itemName"
							value="${detail.itemName }"></td>
					</tr>
					<tr>
						<td>상품 금액</td>
						<td><input type="text" name="itemPrice"
							value="${detail.itemPrice }"></td>
					</tr>
					<tr>
						<td rowspan="4">상품 <br>이미지
						</td>
					</tr>
					<tr>
						<td><label>파일 변경 / &nbsp; </label> 현재 이미지 -> <input
							type="file" name="tempItemImage" id="itemImage">
							${detail.itemImage }</td>
					</tr>
					<tr>
						<td>변경될 이미지 -> <span id="output"></span></td>
					</tr>
					<tr>
						<td colspan="1"><img id="loding"
							src="${conPath }/img/${detail.itemImage }"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정"> <input
							type="button" value="목록"
							onclick="location='item.do?method=list&pageNum=${param.pageNum}'">
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
<jsp:include page="../main/footer.jsp" />
</html>