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
<link href="${conPath }/css/loginForm.css" rel="stylesheet"
	type="text/css">
<script>
	$(document).ready(function() {

	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<c:if test="${not empty member }">
		<script>
			location.href="${conPath}/main.do";
		</script>
	</c:if>
	<div class="admin_loginForm">
		<div class="admin_login">
			<div class="admin_select">
				<ul>
					<li>관리자</li>
					<li>로그인</li>
				</ul>
			</div>
		</div>
		<div class="admin_main_from">
			<div class="admin_login_main">
				<br> <br> <br>
				<p>
				<form action="${conPath }/admin.do">
					<input type="hidden" name="method" value="login"> 관리자 아이디
					비밀번호 입력후 로그인 버튼을 클릭해주세요. <br> <input type="text"
						name="adminId" placeholder="관리자 I D " value="${adminId }"
						style="width: 60%; height: 30px;"><br> <input
						type="password" name="adminPw" placeholder="비밀번호"
						value="${adminPw }" style="width: 60%; height: 30px;"><br>
					<input type="submit" value="로그인" style="width: 61%; height: 40px;">
				</form>
				<br> <br> <br>
			</div>
			<div class="admin_sub_join">
				<p>
					 관리자가 아니시면 &nbsp;
					<button onclick="location.href='main.do?method=main'">돌아
						가기</button>
					&nbsp; 를 눌러주세요.
				</p>

			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>