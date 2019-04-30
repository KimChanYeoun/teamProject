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

		$('input[name="noPw"]').click(function() {
			$('input[name="noPw"]').prop('checked', true);
			$('input[name="qnanoPw"]').show();
		});
	});

	function myFunction() {
		var popup = document.getElementById('myPopup');
		popup.classList.toggle('show');

	}
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="write_Wrap">
		<div class="top_var">
			<div class="top_root">
				<ul>
					<li onclick="location.href='qna.do?method=list'">Q n A</li>
					<li>&nbsp;&nbsp;| ${content.qnaNo }&nbsp;${content.qnaTitle }</li>
					<li>&nbsp; 글쓰기</li>
				</ul>
			</div>
		</div>
		<div class="write_Form">
			<form action="${conPath }/qna.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="method" value="write"> <input
					type="hidden" name="memberId" value="${member.memberId }">

				<table>
					<caption> <h2>궁금한 점을 문의하세요</h2></caption>
					<tr>
						<td>제목</td>
						<td colspan="2"><input type="text" name="qnaTitle" required="required"></td>
					</tr>
					<tr>
						<td>문의내용</td>
						<td colspan="2"><textarea name="qnaContent" required="required"></textarea></td>
					</tr>
					<tr>
						<td>사진 첨부</td>
						<td colspan="2"><input type="file" name="file"></td>

					</tr>
					<tr>

						<td><a class="tooltips" href="#">비밀글 설정 <span>
									비밀번호를 설정하여 <br> 글쓴이 만 <br> 볼수있습니다!
							</span></a> <input type="checkbox" name="noPw"></td>
						<td><input type="password" name="qnanoPw" hidden="hidden" placeholder="글 비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" value="등록"> <input
							type="reset" value="다시쓰기"> <input type="button"
							onclick="history.back();" value="목록"></td>
				</table>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>