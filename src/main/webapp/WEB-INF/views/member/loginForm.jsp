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
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="${conPath }/css/loginForm.css" rel="stylesheet"
	type="text/css">
<script>
	$(document).ready(function() {
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var userInputId = getCookie("userInputId");
		$("input[name='memberId']").val(userInputId);

		if ($("input[name='memberId']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}

		$("#idSaveCheck").change(function() { // 체크박스에 변화가 있다면,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputId = $("input[name='memberId']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("input[name='memberId']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var userInputId = $("input[name='memberId']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>
</head>
<body>
	<c:if test="${not empty admin }">
		<script>
			location.href="${conPath}/main.do";
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div class="loginForm">

		<div class="login">
			<div class="select">
				<ul>
					<li>로그인 |</li>
					<li>회원가입</li>
				</ul>
			</div>
		</div>


		<div class="main_from">
			<div class="login_main">
				<br> <br> <br>
				<p>
					<c:if test="${not empty result}">
						<script>
							alert('${result}');
						</script>
					</c:if>
				<form action="${conPath }/member.do">
					<input type="hidden" name="method" value="login">
					<p>아이디 비밀번호 입력후 로그인 버튼을 클릭해주세요.</p>
					<br> <input type="text" name="memberId"
						placeholder="&nbsp; ID 를 입력해주세요" value="${memberId }"
						style="width: 60%; height: 30px;"><br> <input
						type="password" name="memberPw" placeholder="&nbsp;비밀번호를 입력해주세요"
						style="width: 60%; height: 30px;"><br>
					<br> <input type="submit" value="로그인" class="submit_login"><br>
					<br> <input type="checkbox" id="idSaveCheck"> I D 저장
					&nbsp;&nbsp;&nbsp;<a
						href="${conPath }/member.do?method=searchMyInfo"> 아이디찾기 &
						비밀번호찾기</a>
				</form>
				<br> <br> <br>
			</div>

			<div class="login_phone">
				<p>휴대폰 간편로그인 (자체 지원)</p>
				<br>
				<H2>휴대폰</h2>
				<h3>간편 로그인</h3>
				<br>
				<form action="${conPath }/member.do">
					<div class="phone">

						<input type="hidden" name="method" value="call">
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
						<input type="submit" value="간편 로그인">
					</div>
				</form>
			</div>


			<div class="sub_join">
				<p>
					아직 M A C 회원이 아니신가요? 가입하고 다양한 혜택을 누리세요! |
					 <a href="${conPath }/member.do?method=joinForm"><button>MAC
							가입하기</button></a> |
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>