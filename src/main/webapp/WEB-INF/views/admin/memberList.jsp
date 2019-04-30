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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${conPath }/css/memberList.css" rel="stylesheet"
	type="text/css">
<script>
	$(document)
			.ready(
					function() {
						$('.memberStop')
								.each(
										function(idx, item) {
											$(item)
													.click(
															function() {
																$
																		.ajax({
																			url : '${conPath}/admin.do',
																			datatype : 'html',
																			data : "method=memberStop&memberId="
																					+ $(
																							"#memberId"
																									+ idx)
																							.val(),
																			success : function(
																					data,
																					status) {
																				$(
																						'#msg'
																								+ idx)
																						.text(
																								'강퇴회원');
																			}
																		});
															});
										});
						$('.memberStart')
								.each(
										function(idx, item) {
											$(item)
													.click(
															function() {
																$
																		.ajax({
																			url : '${conPath}/admin.do',
																			datatype : 'html',
																			data : "method=memberStart&memberId="
																					+ $(
																							"#memberId"
																									+ idx)
																							.val(),
																			success : function(
																					data,
																					status) {
																				$(
																						'#msg'
																								+ idx)
																						.text(
																								'활동회원');
																			}
																		});
															});
										});
					});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>



	<div class="content_info">
		<div class="select">
			<ul>
				<li>A D M I N</li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li>MEMBER LIST</li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li>회 원 리스트</li>
			</ul>
		</div>
	</div>



	<div id="content">
		<table>
			<caption>회원리스트</caption>
			<c:set var="i" value="0" />
			<tr>
				<td></td>
				<td>아이디</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>이메일</td>
				<td>주소</td>
				<td>회원등급</td>
				<td>회원상태</td>
				<td>탈퇴/복구</td>
			</tr>

			<c:if test="${empty memberList }">
				<tr>
					<td colspan="9"></td>
				</tr>
				<tr>
					<td class="notList" colspan="9">검색한 회원이 없습니다 . .</td>
				</tr>


			</c:if>
			<c:forEach var="memberList" items="${memberList }">
				<tr>
					<td><input type="hidden" id="memberId${i }"
						value="${memberList.memberId }"></td>
					<td>${memberList.memberId }</td>
					<td>${memberList.memberName }</td>
					<td>${memberList.memberBirth }</td>
					<td>${memberList.memberEmail }</td>
					<td>${memberList.memberAddress }&nbsp;${memberList.memberPost }</td>
					<td>${memberList.memberGradeName }</td>
					<c:if test="${memberList.memberState eq 1 }">
						<td><span id="msg${i }">강퇴회원</span></td>
					</c:if>
					<c:if test="${memberList.memberState eq 0 }">
						<td><span id="msg${i }">활동회원</span></td>
					</c:if>
					<td colspan="2"><input type="button" class="memberStop"
						value="회원강퇴"> <input type="button" class="memberStart"
						value="회원복귀"></td>
				</tr>
				<c:set var="i" value="${i+1 }" />
			</c:forEach>
		</table>

		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize}">
				[ <a
					href="${conPath }/admin.do?method=memberList&pageNum=${paging.startPage-1 }&memberGradeName=${param.memberGradeName }&schItem=${param.schItem }&schWord=${param.schWrod}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<b>[ ${i } ]</b>
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a
						href="${conPath }/admin.do?method=memberList&pageNum=${i }&memberGradeName=${param.memberGradeName }&schItem=${param.schItem }&schWord=${param.schWord}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a
					href="${conPath }/admin.do?method=memberList&pageNum=${paging.endPage+1 }&memberGradeName=${param.memberGradeName }&schItem=${param.schItem }&schWord=${param.schWord}">다음</a> ]
			</c:if>
		</div>


		<div id="search">
			<form action="${conPath }/admin.do">
				<input type="hidden" name="method" value="memberList"> <select
					name="memberGradeName">
					<option value="normal"
						<c:if test="${param.memberGradeName=='normal' }">selected="selected"</c:if>>normal
					</option>
					<option value="vip"
						<c:if test="${param.memberGradeName=='vip' }">selected="selected"</c:if>>vip
					</option>
				</select> <select name="schItem">
					<option value="memberId"
						<c:if test="${param.schItem=='memberId' }">selected="selected"</c:if>>회원아이디
					</option>
					<option value="memberPhone"
						<c:if test="${param.schItem=='memberPhone' }">selected="selected"</c:if>>회원전화번호
					</option>
				</select> <input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색"> <input type="button"
					value="리셋" onclick="location='admin.do?method=memberList'">
			</form>
		</div>
	</div>

</body>
<jsp:include page="../main/footer.jsp" />
</html>