<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/emp.sss" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>

</head>
<body>
<form role="form" method="post" autocomplete="off">

		<div class="inputArea">
			<label for="itemNo">상품번호</label> <input type="text" id="itemNo"
				name="itemNo" />
		</div>
		<div class="inputArea">
			<label for="itemName">상품명</label> <input type="text" id="itemName"
				name="itemName" />
		</div>

		<div class="inputArea">
			<label for="itemImage">상품이미지</label> <input type="text" id="itemImage"
				name="itemImage" />
		</div>

		<div class="inputArea">
			<label for="itemPrice">가격</label> <input type="text" id="itemPrice"
				name="itemPrice" />
		</div>

		<div class="inputArea">
			<button type="submit" id="item_Btn" class="btn btn-primary">등록</button>
		</div>

	</form>
</body>
</html>