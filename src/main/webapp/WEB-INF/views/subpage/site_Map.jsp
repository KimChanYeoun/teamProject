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
<link href="${conPath }/css/sub_siteMap.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<jsp:include page="../main/header.jsp" />
<body>



	<div class="sub_wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li>M A C</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>Site Map</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				</ul>
			</div>
		</div>

		<div class="Site_title">
			<h1>M A C 을 한눈에</h1>
		</div>


		<div class="sub_sitemap">
			<h2>사이트맵</h2>
			<br> <br>
			<div class="sub_sitelist">
				<ul>
					<li class="sub_sitetitle">영화</li>
					<li><a href="${conPath }/movie.do?method=list">무비차트</a></li>
					<li><a href="http://www.cgv.co.kr/movies/hd-trailer.aspx"
						target="_blank">HD트레일러*</a></li>
					<li><a href="http://www.cgv.co.kr/movies/point/"
						target="_blank">평점*</a></li>
					<li><a href="http://www.cgv.co.kr/arthouse/" target="_blank">M
							A C 아트 박스*</a></li>
				</ul>

				<ul>
					<li class="sub_sitetitle">예매</li>
					<li><a href="${conPath }/booking.do?method=insertForm">빠른
							예매</a></li>
					<li><a href="http://www.cgv.co.kr/reserve/show-times/"
						target="_blank">상영시간표*</a></li>
				</ul>
				<ul>
					<li class="sub_sitetitle">극장</li>
					<li><a href="http://www.cgv.co.kr/theaters/MAC"
						target="_blank">M A C극장*</a></li>
					<li><a href="http://www.cgv.co.kr/theaters/special/"
						target="_blank">특별관*</a></li>
					<li><a href="http://www.cgv.co.kr/theaters/special/"
						target="_blank">&nbsp;4DX*</a></li>
					<li><a
						href="http://www.cgv.co.kr/theaters/special/?regioncode=07"
						target="_blank">&nbsp;IMAX*</a></li>
					<li><a
						href="http://www.cgv.co.kr/theaters/special/?regioncode=99"
						target="_blank">&nbsp;GOLD CLASS*</a></li>
					<li><a
						href="http://www.cgv.co.kr/theaters/special/?regioncode=09"
						target="_blank">&nbsp;SWEET BOX*</a></li>
				</ul>


				<ul>
					<li class="sub_sitetitle">이벤트 and 컬쳐</li>
					<li><a href="${conPath }/event.do?method=list">이 벤 트</a></li>
					<li><a href="${conPath }/item.do?method=list">스 토 어</a></li>
					<li><a href="http://www.cgv.co.kr/magazine/" target="_blank">매
							거 진*</a></li>
				</ul>

				<ul>
					<li class="sub_sitetitle">무비 로그</li>
					<c:if test="${not empty member.memberId }">
						<li><a
							href="${conPath }/member.do?method=myMovieList&memberId=${memberId }">내가
								본 영화</a></li>
					</c:if>

					<c:if test="${empty member.memberId }">
						<li><a href="${conPath }/member.do?method=loginForm">내가 본
								영화</a></li>
					</c:if>
					<li><a href="http://www.cgv.co.kr/movies/finder.aspx"
						target="_blank">무비 다이어리*</a></li>
				</ul>
				<ul>
					<li class="sub_sitetitle">MY MAC</li>
					<c:if test="${not empty member.memberId }">
						<li><a
							href="${conPath }/member.do?method=myMovieList&memberId=${memberId }">예매
								내역</a></li>
					</c:if>

					<c:if test="${empty member.memberId }">
						<li><a href="${conPath }/member.do?method=loginForm">예매
								내역</a></li>
					</c:if>
					<c:if test="${not empty member.memberId }">
						<li><a
							href="${conPath }/member.do?method=myInfo&memberId=${memberId}">나
								의 정 보</a></li>
					</c:if>

					<c:if test="${empty member.memberId }">
						<li><a href="${conPath }/member.do?method=loginForm">나 의
								정 보</a></li>
					</c:if>
					<li><a href="${conPath }/event.do?method=list">나 의 문의 내역</a></li>
				</ul>

				<ul>
					<li class="sub_sitetitle">회사 소개</li>
					<li><a href="http://corp.cgv.co.kr/" target="_blank">회사
							소개*</a></li>
					<li><a href="http://corp.cgv.co.kr/company/cgv/"
						target="_blank">M A C 정보*</a></li>
					<li><a
						href="http://corp.cgv.co.kr/company/ir/manage/manage_list.aspx"
						target="_blank">투 자 정 보*</a></li>
					<li><a
						href="http://corp.cgv.co.kr/company/recruit/step/default.aspx"
						target="_blank">채 용 정 보*</a></li>
					<li><a href="http://corp.cgv.co.kr/company/cyber/Default.aspx"
						target="_blank">사이버 감시실*</a></li>
					<li><a
						href="http://corp.cgv.co.kr/company/advertize/ad_Default.aspx"
						target="_blank">광고 제휴 문의*</a></li>
				</ul>

				<ul>
					<li class="sub_sitetitle">고객 센터</li>
					<li><a href="${conPath }/qna.do?method=list">자주 찾는 질문</a></li>
					<li><a href="${conPath }/notice.do?method=noticeList">M A
							C 공지/뉴스</a></li>
					<li><a href="http://www.cgv.co.kr/support/lease/default.aspx"
						target="_blank">단체 / 대관 문의*</a></li>
					<li><a
						href="http://section.cgv.co.kr/event/develop/widget.aspx"
						target="_blank">서비스 가이드*</a></li>
				</ul>

				<ul>
					<li class="sub_sitetitle">회원 서비스</li>
					<li><a href="${conPath }/member.do?method=loginForm">로그인</a></li>
					<li><a href="${conPath }/member.do?method=joinForm">회원 가입</a></li>
					<li><a href="${conPath }/sub.do?method=siteMap">사이트 맵</a></li>
				</ul>

				<ul>
					<li class="sub_sitetitle">VIP MAC</li>
					<li><a href="http://www.cgv.co.kr/user/vip-lounge/event/"
						target="_blank">VIP 이벤트*</a></li>
					<li><a href="http://www.cgv.co.kr/user/vip-lounge/letter.aspx"
						target="_blank">VIP 전용 레터*</a></li>
				</ul>


				<ul>
					<li class="sub_sitetitle">M A C 정책</li>
					<li><a href="http://www.cgv.co.kr/rules/service.aspx"
						target="_blank">이용 약관*</a></li>
					<li><a href="http://www.cgv.co.kr/rules/organized.aspx"
						target="_blank">편성 기준*</a></li>
					<li><a href="http://www.cgv.co.kr/rules/privacy.aspx"
						target="_blank">개인정보 취급방침*</a></li>
					<li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx"
						target="_blank">법적 고지*</a></li>
					<li><a href="http://www.cgv.co.kr/rules/emreject.aspx"
						target="_blank">이메일 주소 무단 수집 거부*</a></li>
				</ul>
			</div>
		</div>


	</div>



	<jsp:include page="../main/footer.jsp" />
</body>
</html>