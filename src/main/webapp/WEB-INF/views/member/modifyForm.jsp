<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="${conPath }/css/modifyForm.css" rel="stylesheet"
	type="text/css">
<script>
	$(document)
			.ready(
					function() {
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

	function modifyChk() {
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
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
					showOtherMonths : true,
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					maxDate : -1,
					onSelect : function(dateText) {
						var today = new Date();
						var y = today.getFullYear();
						var m = today.getMonth() + 1;
						if (('' + m).length == 1) {
							m = '0' + m;
						}
						var d = today.getDate();
						if (('' + d).length == 1) {
							d = '0' + d;
						}
						var todayStr = y + '-' + m + '-' + d;
					}
				});//datepicker 함수 끝
	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="mymodify_Wrap">

		<div class="content_info">
			<div class="select">
				<ul>
					<li>MY M A C</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My Info</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>수 정 하 기</li>
				</ul>
			</div>
		</div>

		<div class="my_info">
			<h3>정보를 수정 합니다.</h3>
		</div>


		<div id="modifyForm">
			<div class="modifyForm">
				<form action="${conPath }/member.do?method=modify" name="join_frm"
					method="POST" onsubmit="return modifyChk();">
					<input type="hidden" name="memberId" value="${memberId}">
					<table>
						<caption>회원정보변경</caption>
						<tr>
							<td>아이디</td>
							<td>&nbsp; &nbsp;${memberId }</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="memberPw"
								value="${member.memberPw }"></td>
						</tr>
						<tr>
							<td>비번확인</td>
							<td><input type="password" id="memberPwChk"
								name="memberPwChk" required="required"></td>
							<td id="pwChkMsg" colspan="2">
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="memberName"
								value="${member.memberName }"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="memberBirth" id="datepicker"
								value="${member.memberBirth }" required="required"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" id="memberPhone" name="memberPhone"
								value="${member.memberPhone }" required="required"
								placeholder="'-'는 제외한 숫자만 입력해주세요"></td>
						</tr>
						<tr>
							<td>메일</td>
							<td><input type="text" name="memberEmail"
								value="${member.memberEmail }"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" id="sample4_roadAddress"
								name="memberAddress" value="${member.memberAddress }"
								placeholder="도로명주소"> <input type="hidden"
								id="sample4_jibunAddress" placeholder="지번주소"> <span
								id="guide"></span></td>
							<td><input type="button"
								onclick="sample4_execDaumPostcode()" value="주소찾기"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" id="sample4_postcode"
								name="memberPost" value="${member.memberPost }" class="text_box"
								placeholder="우편번호" readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="변경하기"> <input
								type="reset" value="다시입력하기"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>