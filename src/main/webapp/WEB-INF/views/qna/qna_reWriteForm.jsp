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
					<li>&nbsp;&nbsp;| ${re.qnaNo }&nbsp;${re.qnaTitle }</li>
					<li>&nbsp;&nbsp; | 답변</li>
				</ul>
			</div>
		</div>



		<div class="write_Form">
			<form action="${conPath }/qna.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="method" value="reWrite"> 
				<input
					type="hidden" name="memberId" value="${member.memberId }">
				<input type="hidden" name="adminId" value="${admin.adminId }">
				<input type="hidden" name="qnanoPw" value="${re.qnanoPw }">
				<input type="hidden" name="qnaStep" value="${re.qnaStep }">
				<input type="hidden" name="qnaGroup" value="${re.qnaGroup }">
				<input type="hidden" name="qnaIndent" value="${re.qnaIndent }">
				<input type="hidden" name="pageNum" value="${pageNum }">

				<table>
					<tr>
						<td>${re.qnaTitle }<br>답변글쓰기
						</td>
						<td colspan="2"><input type="text" name="qnaTitle"
							value="Re-${re.qnaTitle }" required="required"></td>
					</tr>
					<tr>
						<td>답변내용</td>
						<td colspan="2"><textarea name="qnaContent" required="required"></textarea></td>
					</tr>
					<tr>
						<td>사진 참조</td>
						<td colspan="2"><input type="file" name="file">${re.qnaFile }</td>

					</tr>

					<tr>
						<td colspan="3"><input type="submit" value="등록" > <input
							type="reset" value="다시쓰기"> <input type="button"
							onclick="history.back();" value="뒤로가기"></td>
				</table>
			</form>
		</div>
	</div>


</body>
<jsp:include page="../main/footer.jsp" />
</html>