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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="${conPath }/css/joinForm.css" rel="stylesheet"
	type="text/css">
<script>
	$(document)
			.ready(
					function() {
						$('.idconfirm')
								.click(
										function() {
											$
													.ajax({
														url : '${conPath}/member.do',
														datatype : 'html',
														data : "method=memberIdConfirm&memberId="
																+ $('#memberId')
																		.val(),
														success : function(
																data, status) {
															$('#idConfirmMsg')
																	.html(data);
														}
													});
										});
						$('input[name="memberPwChk"]')
								.keyup(
										function() {
											if ($('input[name="memberPw"]')
													.val() == $(
													'input[name="memberPwChk"]')
													.val()) {
												if ($(this).val() == "") {
													$('#pwChkMsg').text("");
												} else {
													$('#pwChkMsg').html(
															'<b>비밀번호 일치</b>');
												}
											} else {
												if ($(this).val() == "") {
													$('#pwChkMsg').text("");
												} else {
													$('#pwChkMsg').html(
															'<b>비밀번호 불일치</b>');
												}
											}
										});
						$('input[name="memberPw"]')
								.keyup(
										function() {
											if ($('input[name="memberPw"]')
													.val() == $(
													'input[name="memberPwChk"]')
													.val()) {
												if ($(this).val() == "") {
													$('#pwChkMsg').text("");
												} else if ($(
														'input[name="memberPw"]')
														.val() == "") {
													$('#pwChkMsg').text("");
												} else {
													$('#pwChkMsg').html(
															'<b>비밀번호 일치</b>');
												}
											} else {
												if ($(this).val() == "") {
													$('#pwChkMsg').text("");
												} else if ($(
														'input[name="memberPw"]')
														.val() == "") {
													$('#pwChkMsg').text("");
												} else {
													$('#pwChkMsg').html(
															'<b>비밀번호 불일치</b>');
												}
											}
										});
						$('input[name="memberId"]').keyup(function() {
							if ($(this).val() == "") {
								$('#idConfirmMsg').text("");
								$('.idconfirm').attr("disabled", true);
							} else {
								$('.idconfirm').attr("disabled", false);
							}
						});
						$('input[type="reset"]').click(function() {
							if ($('input[name="memberId"]').val() != "") {
								$('#idConfirmMsg').text("");
								$('.idconfirm').attr("disabled", true);
							}
							if ($('input[name="memberPwChk"]').val() != "") {
								$('#pwChkMsg').text("");
							}
						});
					});

	function joinInfoChk() {
		var idConfirm = $('#idConfirm').text();
		if (idConfirm == "") {
			alert('ID를 중복확인 바랍니다.');
			return false;
		} else if (idConfirm == "중복된 ID입니다.사용불가") {
			alert('중복된 ID입니다. 사용불가');
			return false;
		}
		if (join_frm.memberPw.value != join_frm.memberPwChk.value) {
			alert('비밀번호 불일치');
			return false;
		}
		if (join_frm.memberPhone.value.indexOf('-') != -1) {
			alert('전화번호 형식을 확인하세요');
			return false;
		}
		if (join_frm.memberEmail.value.length != 0
				&& (join_frm.memberEmail.value.indexOf('@') == -1
						|| join_frm.memberEmail.value.indexOf('@') == 0
						|| join_frm.memberEmail.value.indexOf('@') == join_frm.memberEmail.value.length - 1 || join_frm.memberEmail.value
						.indexOf('@') != join_frm.memberEmail.value
						.lastIndexOf('@'))) {
			alert('메일 형식을 확인하세요');
			join_frm.memberEmail.focus();
			return false;
		}
		return true;
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div class="join_Wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">Login</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>Join Us</li>
				</ul>
			</div>
		</div>

		<div class="join_title">
			<h1>M A C 과 함께하세요.</h1>
		</div>



		<div id="joinForm">
			<div class="joinForm">
				<form action="${conPath }/member.do?method=join" name="join_frm"
					method="post" onsubmit="return joinInfoChk()">
					<table>
						<caption>회원가입</caption>
						<caption>Movie & Cinema MAC에 가입하시고 편안한 서비스를 즐기세요~</caption>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="memberId" id="memberId">
							</td>
							<td><input type="button" class="idconfirm" value="중복확인"
								disabled="disabled"></td>
							<td id="idConfirmMsg" style="color: red;"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="memberPw"></td>
						</tr>
						<tr>
							<th>비번확인</th>
							<td><input type="password" id="memberPwChk"
								name="memberPwChk" required="required"></td>
							<td id="pwChkMsg" colspan="2"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="memberName"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><script
									src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
								<script>
									$(function() {
										$("#datepicker")
												.datepicker(
														{
															changeMonth : true,
															changeYear : true,
															yearRange : 'c-100:c+10',
															dateFormat : 'yy-mm-dd',
															monthNames : [
																	'1월', '2월',
																	'3월', '4월',
																	'5월', '6월',
																	'7월', '8월',
																	'9월',
																	'10월',
																	'11월',
																	'12월' ],
															showMonthAfterYear : true,
															yearSuffix : '년',
															showOtherMonths : true,
															dayNamesMin : [
																	'월', '화',
																	'수', '목',
																	'금', '토',
																	'일' ],
															maxDate : -1,
															onSelect : function(
																	dateText) {
																var today = new Date();
																var y = today
																		.getFullYear();
																var m = today
																		.getMonth() + 1;
																if (('' + m).length == 1) {
																	m = '0' + m;
																}
																var d = today
																		.getDate();
																if (('' + d).length == 1) {
																	d = '0' + d;
																}
																var todayStr = y
																		+ '-'
																		+ m
																		+ '-'
																		+ d;
															}
														});//datepicker 함수 끝
									});
								</script> <input type="text" name="memberBirth" id="datepicker"
								required="required"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" id="memberPhone" name="memberPhone"
								required="required" placeholder="'-'는 제외한 숫자만 입력해주세요"></td>
						</tr>
						<tr>
							<th>메일</th>
							<td><input type="text" name="memberEmail"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" id="sample4_roadAddress"
								name="memberAddress" placeholder="도로명주소"> <input
								type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide"></span></td>
							<td><input type="button"
								onclick="sample4_execDaumPostcode()" value="주소찾기">
							<td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" id="sample4_postcode"
								name="memberPost" class="text_box" placeholder="우편번호"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="4"><input type="submit" value="가입"
								style="width: 100px; height: 50px; line-height: 40px; background-color: #351f66; border: 1px ridge #8a8b8d; color: white; font-weight: bold;">
								<input type="reset" value="다시입력하기"
								style="width: 100px; height: 50px; line-height: 40px; background-color: #351f66; border: 1px ridge #8a8b8d; color: white; font-weight: bold;"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>