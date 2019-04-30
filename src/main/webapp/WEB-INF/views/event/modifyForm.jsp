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
<script>
	$(document).ready(function() {
		$("#eventImg").change(function() {
			$('#output').text($('input[type=file]')[0].files[0].name);
			readURL(this);

		});

		$("label").click(function() {
			$("#eventImg").click();

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


<link href="${conPath }/css/event_modify.css" rel="stylesheet"
	type="text/css">

</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="modify_wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">E V E N T</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>${detail.eventTitle }</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>수 정 하 기</li>
				</ul>
			</div>
		</div>

		<div class="modify_title">
			<h1>" ${detail.eventTitle } "</h1>
		</div>

		<div class="content_wrap">

			<div class="content">
				<form action="${conPath }/event.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="method" value="modify"> <input
						type="hidden" name="pageNum" value="${param.pageNum }"> <input
						type="hidden" name="eventNo" value="${detail.eventNo }">



					<table>
						<tr>
							<td class="text_left">제목 .</td>
							<td rowspan="4"><img id="loding"
								src="${conPath }/img/${detail.eventFile }"></td>
						</tr>
						<tr>
							<td><input type="text" name="eventTitle"
								value="${detail.eventTitle }"></td>
						</tr>
						<tr>
							<td><label>이미지 변경 &nbsp; </label></td>
						</tr>
						<tr>
							<td class="text_left">이미지 파일 : <span id="output"></span> <input type="file"
								name="tempEventFile" id="eventImg"></td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="저장">
							 <input
								type="button" value="목록"
								onclick="location='event.do?method=list&pageNum=${param.pageNum}'">
						</tr>
					</table>





				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>