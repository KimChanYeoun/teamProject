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
<link href="${conPath }/css/search_Myinfo.css" rel="stylesheet"
	type="text/css">
<script>
	$(document).ready(function() {

	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="loginForm">
		<div class="login">
			<div class="select">
				<ul>
					<li>로그인</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>ID & PW 찾기
				</ul>
			</div>
		</div>


		<div class="main_from">
			<div class="login_main">
				<br>
				<p>
					<c:if test="${not empty result}">
						<script>
							alert('${result}');
						</script>
					</c:if>
				<form action="${conPath }/member.do">
					<input type="hidden" name="method" value="searchMemberPw">
					아이디와 전화번호를 입력후 찻기 버튼을 클릭해주세요. <br> <br>
					<p>
						I D : <input type="text" name="memberId" 
							style="width: 250px;">
					</p>
					<br> <select name="tel1">
						<option>010</option>
						<option>011</option>
					</select> -<input type="text" name="tel2"> -<input type="text"
						name="tel3">


					<div class="submit">
						<input type="submit" value="찻기">
					</div>
				</form>
				<br> <br> <br>
			</div>


			<div class="login_phone">
				<p>
					휴대폰 간편로그인 (자체 지원)<br> <br>
				<H2>휴대폰번호로 ID찻기</h2>
				<br>
				<form action="${conPath }/member.do">
					<div class="phone">

						<input type="hidden" name="method" value="searchMemberId">
						<ul>
							<li><select name="tel1">
									<option>010</option>
									<option>011</option>
							</select></li>
							<li>- <input type="text" name="tel2" style="width: 70%;">
							</li>
							<li>- <input type="text" name="tel3" style="width: 80%;">
							</li>
						</ul>

					</div>
					<div class="submit_back">
						<input type="submit" value="ID찻기"
							style="width: 100%; height: 40px;">
					</div>
				</form>
			</div>
			<div class="sub_join">
				<p>
					아직 M A C 회원이 아니신가요? 가입하고 다양한 혜택을 누리세요! | <a
						href="member.do?method=joinForm"><button>MAC 가입하기</button> |</a>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>