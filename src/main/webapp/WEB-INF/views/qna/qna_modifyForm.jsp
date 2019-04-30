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
<link href="${conPath }/css/qnawriteForm.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document).ready(function() {
		$('input[type="password"]').keyup(function() {
			if ($('#qnanoPw').val() != $('pwCkh').val()) {
				msg = "비밀번호가 일치하지 않습니다."
			}
		});
	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="write_Wrap">
		<div class="top_var">
			<div class="top_root">
				<ul>
					<li onclick="location.href='qna.do?method=list'">Q n A</li>
					<li>&nbsp;&nbsp;| ${modifyForm.qnaNo }&nbsp;&nbsp;${modifyForm.qnaTitle }</li>
					<li>&nbsp;&nbsp;|수정</li>
				</ul>
			</div>
		</div>

		<div class="write_Form">
			<form
				action="${conPath }/qna.do?method=modify&qnaNo=${modifyForm.qnaNo}"
				method="post" enctype="multipart/form-data">
				<input type="hidden" value="${modifyForm.qnanoPw }" name="qnanoPw">
				<table>
					<tr>
						<td>글 제목</td>
						<td><input type="text" name="qnaTitle"
							value="${modifyForm.qnaTitle }" required="required"></td>
					</tr>
					<tr>
						<td>본문 내용</td>
						<td><textarea name="qnaContent" required="required">${modifyForm.qnaContent }</textarea></td>
					</tr>
					<tr>
						<td>사진 수정</td>
						<td><input type="file" name="file">${modifyForm.qnaFile }</td>

					</tr>
					<c:if test="${empty modifyForm.qnanoPw }">
						<tr>
							<td><a class="tooltips" href="#">비밀 글로 바꾸기. <span>
										비밀번호를 설정하여 <br> 당사자만 확인할수있습니다!
								</span></a> <input type="checkbox" name="noPw"></td>
							<td><input type="password" name="qnanoPw" hidden="hidden"
								value="${re.qnanoPw }"></td>
							<td><input type="password" name="pwCkh" hidden="hidden">
								${msg }</td>
						</tr>
					</c:if>


					<tr>
						<td colspan="3"><input type="submit" value="등록"> <input
							type="reset" value="다시쓰기"> <input type="button"
							onclick="history.back();" value="뒤로가기"></td>
				</table>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>
