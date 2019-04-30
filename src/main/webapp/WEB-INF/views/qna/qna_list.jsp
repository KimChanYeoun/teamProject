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
<link href="${conPath }/css/qnalist.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(function() {

		//컨텐츠 비밀글 진입 처리
		$('.cook')
				.click(
						function() {
							var qnaNo = Number($(this).children(0).eq(0).text());
							var idCK = String($(this).find('#idCk').val());
							var pwCk = String($(this).find('#pwCk').val());

							if (pwCk != 'undefined') {
								if (${not empty admin} || ${not empty member} && idCK == '${member.memberId}') {
									location.href = "${conPath}/qna.do?method=content&qnaNo="
											+ qnaNo
											+ "&pageNum=${paging.currentPage}";
								} else {
									alert('비밀글은 본인만 확인 가능합니다');
								}
							} else {
								location.href = "${conPath}/qna.do?method=content&qnaNo="
										+ qnaNo
										+ "&pageNum=${paging.currentPage}";
							}
						});

	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="back_wrap">

		<div class="content_info">
			<div class="select">
				<ul>
					<li>Q n A</li>
				</ul>
			</div>
		</div>

		<div class="Qna_title">
			<h1>당신의 이야기를 들려주세요</h1>
		</div>


		<div class="list_wrap">
			<br>
			<h1>자주찾는 질문</h1>
			<h3>
				회원들께서 가장 자주하는 질문을 모았습니다. <br> 궁금하신 내용을 검색해보세요.
			</h3>
			<form action="${conPath }/qna.do">
				<input type="hidden" name="method" value="qna_Serch"> <br>
				<br>
				<p class="serch_menu">
					<input type="text" name="qna_Serch"> <input type="submit"
						value="검색하기"> &nbsp;&nbsp; 자주 찾는 문의 : &nbsp; <a
						href="${conPath }/qna.do?method=qna_Serch&qna_Serch=개인정보">개인정보</a>
					| <a href="${conPath }/qna.do?method=qna_Serch&qna_Serch=영화">영화
					</a> | <a href="${conPath }/qna.do?method=qna_Serch&qna_Serch=예매">예매</a>
					| <a href="${conPath }/qna.do?method=qna_Serch&qna_Serch=홈페이지">
						홈페이지</a> | <a href="${conPath }/qna.do?method=qna_Serch&qna_Serch=환불">환불</a>
					|
				</p>
			</form>
			<div class="list_Form">
				<p>
					<br> 총 ${tot }건 검색되었습니다. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;


					<c:if test="${not empty member.memberId}">
						<a href="${conPath }/qna.do?method=writeForm">문의하기</a>
					</c:if>
					<c:if test="${empty member.memberId }">
						<a href="${conPath }/member.do?method=loginForm">로그인후 문의 가능</a>
					</c:if>
					<br>
				</p>



				<table>
					<tr>
						<td class="num_size">No.</td>
						<td class="title_size">Title</td>
						<td class="hit_size">Hit</td>
						<td class="write_name">Name</td>
						<td class="write_date">Date</td>
					</tr>

					<c:if test="${empty qna_list }">
						<tr class="not_list">
							<td></td>
							<td colspan="5">등록된 문의가 없습니다</td>
							<td></td>
							<td></td>
						</tr>

					</c:if>

					<c:forEach var="qna" items="${qna_list }">
						<tr class="cook" onclick='cook()'>
							<td class="num_size">${qna.qnaNo }<input type="hidden"
								id="idCk" value="${qna.memberId }"></td>

							<td class="title_size"><c:forEach var="i" begin="1"
									end="${qna.qnaIndent }">

									<c:if test="${i==qna.qnaIndent }">
							└─
							</c:if>

									<c:if test="${ i!= qna.qnaIndent }">
						&nbsp;&nbsp;&nbsp;
						</c:if>

								</c:forEach> ${qna.qnaTitle } <c:if test="${not empty qna.qnaFile }">
									<img src="${conPath }/img/photo.png">
								</c:if> <c:if test="${not empty qna.qnanoPw }">
									<img src="${conPath }/img/look.png">
									<input type="hidden" id="pwCk" value="${qna.qnanoPw }">
								</c:if></td>

							<td>${qna.qnaHit }</td>

							<td><c:if test="${not empty qna.memberName }">
							${qna.memberName }
							</c:if> <c:if test="${not empty qna.adminId }">
									관리자
								</c:if></td>
							<td><fmt:formatDate value="${qna.qnaDate}"
									pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="paging">
				<c:if test="${paging.startPage>paging.blockSize}">
		[ <a
						href="${conPath }/qna.do?method=list&pageNum=${paging.startPage-1 }">이전</a> ]
	</c:if>
				<c:forEach var="i" begin="${paging.startPage}"
					end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<b>[ ${i } ]</b>
					</c:if>
					<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/qna.do?method=list&pageNum=${i }">${i }</a> ]
		</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a
						href="${conPath }/qna.do?method=list&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
			</div>

			<div class="bottom_var">
				<ul>
					<li><img src="${conPath }/img/qnaSerimg1.png"> 01. 자주찾는
						질문검색 ></li>
					<li><img src="${conPath }/img/qnaSerimg2.png">02 . 이메일
						문의 &nbsp; <a href="">문 의</a> ></li>
					<li><img src="${conPath }/img/qnaSerimg3.png"> 03 고객 센터
						전화 문의 <br>&nbsp;&nbsp;&nbsp;&nbsp; 1588-1415 <br>
						&nbsp;(상담가능 시간 09:00 ~ 22: 00 )</li>
				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>