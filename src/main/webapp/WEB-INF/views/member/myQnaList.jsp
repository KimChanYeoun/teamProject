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
<link href="${conPath }/css/my_QnaList.css" rel="stylesheet"
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
								if ('' != '${member.memberId}'
										&& idCK == '${member.memberId}') {
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

		//TOP 처리.
		var scrollUpDelay = 1;
		var scrollUpSpeed = 30;
		function scrollUp() {
			if (document.body.scrollTop < 1) {
				return;
			}
			document.body.scrollTop = document.body.scrollTop - scrollUpSpeed;
			setTimeout('scrollUp()', scrollUpDelay);
		}

	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="back_wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li>My M A C</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My Info</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My QnA</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				</ul>
			</div>
		</div>



		<div class="Qnalist_wrap">
			<br>
			<h1>내가 질문한 질문</h1>
			<h3></h3>
			<div class="list_Form">
				<p>
					<br> 총 ${totMy }건 검색되었습니다. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<c:if test="${not empty member.memberId }">
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
					<c:if test="${empty myQnAList }">
						<tr>
							<th colspan="5" style="height: 100px;">최근 이력이 없습니다</th>
						</tr>
						<tr>
							<th colspan="5"><input class="myqna_Back" type="reset"
								value="뒤로가기" onclick="history.back()"></th>

						</tr>
					</c:if>
					<c:if test="${not empty myQnAList }">
						<c:forEach var="myQnAList" items="${myQnAList }">
							<tr class="cook">
								<td class="num_size">${myQnAList.qnaNo }<input
									type="hidden" id="idCk" value="${myQnAList.memberId }"></td>

								<td class="title_size"><c:forEach var="i" begin="1"
										end="${myQnAList.qnaIndent }">
										<c:if test="${i==myQnAList.qnaIndent }">
							└─
								</c:if>
										<c:if test="${ i!= myQnAList.qnaIndent }">
						&nbsp;&nbsp;&nbsp;
						</c:if>
									</c:forEach> ${myQnAList.qnaTitle }
										<c:if test="${not empty myQnAList.qnaFile }">
											<img src="${conPath }/img/photo.png">
										</c:if> <c:if test="${not empty myQnAList.qnanoPw }">
											<img src="${conPath }/img/look.png">
											<input type="hidden" id="pwCk" value="${myQnAList.qnanoPw }">
										</c:if>
									<input type="hidden" id="pwCk" value="${myQnAList.qnanoPw }">
									</td>

								<td>${myQnAList.qnaHit }</td>
								<td>${myQnAList.memberName }</td>
								<td><fmt:formatDate value="${myQnAList.qnaDate}"
										pattern="yyyy.MM.dd" /></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div class="paging">
				<c:if test="${paging.startPage>paging.blockSize}">
		[ <a
						href="${conPath }/member.do?method=myQnAList&memberId=${memberId }&pageNum=${paging.startPage-1 }">이전</a> ]
	</c:if>
				<c:forEach var="i" begin="${paging.startPage}"
					end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<b>[ ${i } ]</b>
					</c:if>
					<c:if test="${paging.currentPage != i }">
			[ <a
							href="${conPath }/member.do?method=myQnAList&memberId=${memberId }&pageNum=${i }">${i }</a> ]
		</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a
						href="${conPath }/member.do?method=myQnAList&memberId=${memberId }&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
			</div>

			<div class="bottom_var">
				<ul>
					<li><img src="${conPath }/img/qnaSerimg1.png"> 01. 자주찾는
						질문검색 ></li>
					<li><img src="${conPath }/img/qnaSerimg2.png"> 02 . 이메일
						문의 <a href="">문의</a></li>
					<li><img src="${conPath }/img/qnaSerimg3.png"> 03 고객 센터
						전화 문의 1588-1415 <br>(상담가능 시간 09:00 ~ 22: 00 )</li>
				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>