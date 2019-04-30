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
<link href="${conPath }/css/header.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
	
</script>
<script>
	$(function() {

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
<body>
	<div class="header_wrap">
		<div class="barwrap_back">
			<div class="barwrap">
				<div class="barcontent">
					<ul>
						<li><a href="${conPath }/sub.do?method=app"> <img
								src="${conPath }/img/logo99.png"> MAC APP
						</a></li>
						<li><a href="https://www.facebook.com/CJCGV"> <img
								src="${conPath }/img/logo_face.jpg"> Like
						</a></li>
						<li><a href="https://www.instagram.com/cgv_korea/"> <img
								src="${conPath }/img/logo_in.jpg"> Follow
						</a></li>
						<li><a href="${conPath }/sub.do?method=siteMap">영화관을 즐기자</a></li>
						<c:if test="${not empty admin.adminId }">
							<li><a href="${conPath }/admin.do?method=memberList">memberList</a></li>
						</c:if>

					</ul>
					<div class="barcontent_right">
						<ul>
							<li><a href="${conPath }/qna.do?method=list">QnA</a></li>
							<li><a href="${conPath }/notice.do?method=noticeList">
									공지사항 </a></li>
							<c:if test="${not empty member.memberId }">
								<li><a href="${conPath }/member.do?method=myInfo">MY
										MAC</a></li>
							</c:if>

							<c:if test="${empty member.memberId }">
								<li><a href="${conPath }/member.do?method=joinForm">Join
										Us </a></li>
							</c:if>
							<c:if test="${ empty member.memberId and empty admin }">
								<li><a href="${conPath }/member.do?method=loginForm">Login</a></li>
							</c:if>
							<c:if test="${not empty member.memberId or not empty admin }">
								<li><a href="${conPath }/member.do?method=logout">Logout</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>

		</div>


		<div class="bannerwrap">
			<div class="bannerimg">
				<img src="${conPath }/img/header_banner2.png">
			</div>
			<div class="top_content">
				<div class="logo">
					<p>
						<a href="${conPath }/main.do"> <img
							src="${conPath }/img/logo_MAC.png">
						</a>
					</p>
				</div>
				<div class="mid_wrap">
					<div class="conname">
						<h1>CULTUREPLEX</h1>
					</div>
					<div class="conbar">
						<div>
							<ul>
								<li class="sub_bar"><a href="movie.do?method=list">영화</a>
									<ul>
										<li><div>
												<a href="movie.do?method=now">현재상영작</a>
											</div></li>
										<li><div>
												<a href="movie.do?method=schedule">상영예정작</a>
											</div></li>
										<li><div>
												<a href="movie.do?method=list">무비파인더</a>
											</div></li>
									</ul></li>
								<li><a href="booking.do?method=insertForm">예매</a></li>
								<li><a href="${conPath }/item.do?method=list">SNANK</a></li>
								<li><a href="event.do?method=list">이벤트 & 컬쳐</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="serch">
					<div class="movieser">
						<div class="movieimg">
							<img src="${conPath }/img/endgame.png">
						</div>
						<form action="${conPath }/movie.do">
							<input type="hidden" name="method" value="search"> <input
								type="text" name="movieName" placeholder="영화검색"
								style="width: 65%;"> <input type="submit"
								style="width: 30%; border-radius: 5px; border: 1px solid #ebe9e6;"
								value="검색">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="remocon">
		<a href=""> <img
			src="${conPath }/img/MAC_HOUSE.png"></a>
		<hr>
		<hr>
		<a href="booking.do?method=insertForm"> <img
			src="${conPath }/img/MAC_TICHET.png"></a>
		<hr>
		<hr>
		<a href="item.do?method=list"> <img
			src="${conPath }/img/MAC_SHACK.png"></a>
		<hr>
		<hr>
		<h1>
			<a href="javascript:scroll(0,0)">TOP</a>
		</h1>
	</div>


	</div>




</body>
</html>