<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {

	});
</script>
<link href="${conPath }/css/myInfo.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="myinfo_Wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li>My M A C</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>My Info</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				</ul>
			</div>
		</div>

		<div class="my_info">
			<h1>영화속 주인공 처럼.</h1>
		</div>


		<div class=myInfo>

			<div class="mtInfo_img">
				<img src="${conPath }/img/myInfo_back.png">
			</div>
			<div class="mainbanner">
				<form action="${conPath }/member.do?method=modifyForm" method="post">
					<table class="mainbanner">
						<tr>
							<td colspan="2">${member.memberId }(${member.memberName })&nbsp;님
								안녕하세요</td>
						</tr>
						<tr>
							<td>${member.memberName }&nbsp;님의등급</td>
							<td>${member.memberGradeName }&nbsp;입니다</td>
						</tr>
						<tr>
							<td colspan="2">회원님의 현재 누적 이용 금액은 ${member.memberAmount }원
								입니다.</td>
						</tr>
						<tr>
							<td colspan="2">회원님의 현재 포인트는 ${member.memberPoint }점 입니다.</td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="수정하기">
								&nbsp; 
								<input type="button" value="탈퇴하기"
								onclick="location='${conPath }/member.do?method=memberStopForm'"></td>
						</tr>
					</table>
				</form>
			</div>

			<!-- 찬년씨 이거 크기 가로 노터치  height 만 늘려서 쓰시면됩니당 
			푸터가 씹어먹으면 css에서 .myInfo  크기 늘려서 맞춰주시면됩니다
		 -->
			<div class="content">
				<div class="menu_root">
					<ul>
						<li>MY MAC HOME</li>
						<li><a href="${conPath }/notice.do?method=noticeList">공지사항</a></li>
						<li><a href="${conPath }/qna.do?method=list">QnA</a></li>
						<li><a href="${conPath }/movie.do?method=list">영화검색</a></li>
						<li><a href="${conPath }/booking.do?method=insertForm">영화예매</a></li>
						<li><a href="${conPath }/item.do?method=list">상점</a></li>
						<li><a href="${conPath }/event.do?method=list">이벤트</a></li>
					</ul>
				</div>
				<div class="itemHistory">
					<table>
						<tr>
							<th>구매내역 더보기 &nbsp;</th>
							<td><a
								href="${conPath }/member.do?method=myItemList&memberId=${member.memberId}"><img
									alt="구매내역 더보기" src="${conPath }/img/hospital_4331.png"></a></td>
						</tr>
					</table>
					<table>
						<tr>
							<th class="item_title">구매번호</th>
							<td class="item_money">품명</td>
							<td class="item_total">총금액</td>
							<td class="item_date">구매일</td>
						</tr>
						<c:if test="${empty myItem }">
							<tr>
								<th colspan="5" style="height: 50px;">최근 이력이 없습니다</th>
							</tr>
						</c:if>
						<c:if test="${not empty myItem }">
							<c:forEach var="myItem" items="${myItem }">
								<tr>
									<th class="item_title">${myItem.purchaseNo }</th>
									<td class="item_money">${myItem.itemName}</td>
									<td class="item_total">${myItem.purchasePrice}</td>
									<td class="item_date">${myItem.purchaseDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="movieHistory">
					<table>
						<tr>
							<th>예매내역 더보기 &nbsp;</th>
							<td><a
								href="${conPath }/member.do?method=myMovieList&memberId=${member.memberId}"><img
									alt="예매내역 더보기" src="${conPath }/img/hospital_4331.png"></a></td>
						</tr>
					</table>
					<table>
						<tr>
							<th class="item_title">예매번호</th>
							<td class="item_money">금액</td>
							<td class="item_cnt">매수</td>
							<td class="item_seat">좌석</td>
							<td class="item_total">총금액</td>
							<td class="item_date">예매일</td>
						</tr>
						<c:if test="${empty myMovie }">
							<tr>
								<th colspan="6" style="height: 50px;">최근 이력이 없습니다</th>
							</tr>
						</c:if>
						<c:if test="${not empty myMovie }">
							<c:set var="idx" value="0" />
							<c:forEach var="myMovie" items="${myMovie }">
								<tr>
									<th class="item_title">${myMovie.bookingNo }</th>
									<td class="item_money">${myMovie.movieName}</td>
									<td class="item_cnt">${myMovie.bookingCount}</td>
									<td class="item_seat">${mySeatList.get(idx)}</td>
									<td class="item_total">${myMovie.bookingPrice}</td>
									<td class="item_date">${myMovie.bookingDate }</td>
								</tr>
								<c:set var="idx" value="${idx+1 }" />
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="myQnA">
					<table>
						<tr>
							<th>MYQnAList &nbsp;</th>
							<td><a
								href="${conPath }/member.do?method=myQnAList&memberId=${member.memberId}"><img
									alt="qna내역 더보기" src="${conPath }/img/hospital_4331.png"></a></td>
						</tr>
					</table>
					<table>
						<tr>
							<th class="item_title">글번호</th>
							<td class="item_money">제목</td>
							<td class="item_cnt">조회수</td>
							<td class="item_date">글쓴날짜</td>
							<td class="item_total">삭제하기</td>
						</tr>
						<c:if test="${empty myQnA }">
							<tr>
								<th colspan="5" style="height: 50px;">최근 이력이 없습니다</th>
							</tr>
						</c:if>
						<c:if test="${not empty myQnA }">
							<c:forEach var="myQnA" items="${myQnA }">
								<tr>
									<th class="item_title">${myQnA.qnaNo }</th>
									<td class="item_money"><a
										href="${conPath }/qna.do?method=content&qnaNo=${myQnA.qnaNo}">
											${myQnA.qnaTitle}</a></td>
									<td class="item_cnt">${myQnA.qnaHit}</td>
									<td class="item_date">${myQnA.qnaDate }</td>
									<td class="item_totalA"><a
										href="qna.do?method=delete&qnaNo=${myQnA.qnaNo }">삭제하기</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>