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
<link href="${conPath }/css/memberStop.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document).ready(
			function() {
				$('form').submit(
						function() {
							if ($('input[name="memberPw"]').val() == $(
									'input[name="memberPwDB"]').val()) {
							} else {
								alert('비밀번호 불일치');
								return false;
							}
						});
			});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="memberStop_wrap">

		<div class="content_info">
			<div class="select">
				<ul>
					<li>My MAC</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My Info</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>회원 탈퇴</li>
				</ul>
			</div>
		</div>

		<div class="Stop_title">
			<h1>더욱 발전하는  M A C 이 되겠습니다.</h1>
		</div>



		<div class="memberStop_from">
			<div class="memberStop_main">
				<form action="${conPath }/member.do">
					<input type="hidden" name="method" value="memberStop"> <input
						type="hidden" name="memberId" value="${member.memberId }">
					<input type="hidden" name="memberPwDB" value="${member.memberPw }">
					<p>회원 탈퇴원하시면 비밀번호를 입력해주세요</p>
					<table>
						<tr>
							<td>아이디</td>
							<td>&nbsp;${member.memberId }</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="memberPw"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="탈퇴하기"> <input
								type="reset" value="취소하기" onclick="history.back()"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>