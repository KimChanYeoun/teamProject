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
		$("#eventFile").change(function() {
			$('#output').text($('input[type=file]')[0].files[0].name);
			readURL(this);

		});

		$("label").click(function() {
			$("#eventFile").click();

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


<link href="${conPath }/css/event_write.css" rel="stylesheet"
	type="text/css">

</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="write_wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">E V E N T</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>E V E N T 등 록</li>
				</ul>
			</div>
		</div>

		<div class="write_title">
			<h1>"다양하게 즐길 이벤트를 등록해주세요"</h1>
		</div>

		<div class="content_wrap">

			<div class="content">
				<form action="${conPath }/event.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="method" value="write">



					<table>
						<tr>
							<td class="text_left">제목</td>
							<td rowspan="4"><img id="loding"
								src="${conPath }/img/${detail.eventFile }"></td>
						</tr>
						<tr>
							<td><input type="text" name="eventTitle" id="eventTitle"
								required="required" placeholder="이벤트 제목"></td>
						</tr>
						<tr>
							<td><label>이미지 등록 &nbsp; </label></td>
						</tr>
						<tr>
							<td class="text_left">이미지 파일 : <span id="output"></span> <input
								type="file" name="tempEventFile" id="eventFile"
								required="required"></td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="등록">
								<button
									onclick="location.href='${conPath}/event.do?method=list'">목록</button>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
<jsp:include page="../main/footer.jsp" />
</html>