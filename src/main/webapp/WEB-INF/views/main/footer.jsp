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
<link href="${conPath }/css/footer.css" rel="stylesheet" type="text/css">
</head>
<body>



	<div class="footer">
		<div class="foorter_varwrap">
			<div class="foorter_var">
				<ul>
					<li><img src="${conPath }/img/footer_root1.png"></li>
					<li><img src="${conPath }/img/footer_root2.png"></li>
					<li><img src="${conPath }/img/footer_root3.png"></li>
					<li><img src="${conPath }/img/footer_root4.png"></li>
					<li><img src="${conPath }/img/footer_root5.png"></li>
					<li><img src="${conPath }/img/footer_root6.png"></li>
					<li><img src="${conPath }/img/footer_root7.png"></li>
					<li><img src="${conPath }/img/footer_root8.png"></li>
					<li><img src="${conPath }/img/footer_root9.png"></li>
					<li><img src="${conPath }/img/footer_root10.png"></li>

				</ul>
			</div>
		</div>

		<div class="footer_wrap">


			<div class="footer_gnb">
				<ul>
					<li>회사 소개</li>
					<li>IR</li>
					<li>채용 정보</li>
					<li>광고/프로모션</li>
					<li>제휴 문의</li>
					<li>출점 문의</li>
					<li>이용약관</li>
					<li>편성기준</li>
					<li class="point_color">개인정보처리방침</li>
					<li>법적 고지</li>
					<li>이메일무단수집거부</li>
					<li><a href="${conPath}/admin.do?method=loginForm">상생경영</a></li>
					<li class="point"><a
						href="${conPath}/sub.do?method=siteMap">사이트맵</a></li>
				</ul>

			</div>

			<div class="footer_info">
				<div class="logo">
					<img src="${conPath }/img/header_logo.png">
				</div>
				<div class="footer_infocontent">
					<p>(02-432-2235) 서울특별시 종로구 삼일대로17길 51 스타골드빌딩 3~5
					<p>대표 : M A C | 사업자등록번호 : 104-82-744924 | 통신판매업신고번호 :
						2019-서울종각-0501
					<p>개인정보보호 책임자 : 최현근 | 대표이메일 :mac@java.co.kr | MAC고객센터 :
						1511-6611
				</div>

				<div class="SNS">
					<div class="SNS_wrap">
						<ul>
							<li><img src="${conPath }/img/facebook.png"></li>
							<li><img src="${conPath }/img/twiter.png"></li>
							<li><img src="${conPath }/img/instar.png"></li>
							<li class="li_select">
								<form>
									<select>
										<option>만든이 바로가기</option>
										<option>강지훈</option>
										<option>김찬년</option>
										<option>전승희</option>
										<option>최현근</option>
									</select> <input type="submit" value="Go">
								</form>
							</li>
						</ul>
					</div>
					<p class="text_right">© TJ MAC. All Rights Reserved</p>
				</div>
			


			</div>



		</div>
	</div>
</body>
</html>