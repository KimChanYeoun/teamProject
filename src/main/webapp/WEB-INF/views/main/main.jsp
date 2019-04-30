<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${conPath }/css/main.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(document).ready(function() {
		
		/* 메인 슬라이더 자동변경 및 버튼 설정*/
		var slide = 0;
		banner_list();
		function banner_list() {
			var i;
			var banner = document.getElementsByClassName("slides");
			for (i = 0; i < banner.length; i++) {
				banner[i].style.display = "none";
			}
			slide++;
			if (slide > banner.length) {
				slide = 1
			}
			banner[slide - 1].style.display = "block";
			setTimeout(banner_list, 3000);
		}
		
		/* 하단 Qna 자동 변경처리 */
		var slideIndex = 0;
		change_list();
		function change_list() {

			var i;
			var change = document.getElementsByClassName("list_in");
			for (i = 0; i < change.length; i++) {
				change[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > change.length) {
				slideIndex = 1
			}
			change[slideIndex - 1].style.display = "block";
			setTimeout(change_list, 2000);
		}
		
		var random = Math.floor(Math.random()*${fn:length(movieSelection)});
		var Trailer = new Array();
		var Image = new Array();
		var movieNo = new Array();
		<c:forEach var="movie" items="${movieSelection}">
			Trailer.push('${movie.movieTrailer}');
			Image.push('${movie.movieImage}');
			movieNo.push('${movie.movieNo}');
		</c:forEach>
		$('#movieTrailer').attr('src', 'https://www.youtube.com/embed/'+Trailer[random]);
		$('#movieImage').attr('src', '${conPath}/movieImgUp/'+Image[random]);
		$('#movieLink').attr('href', '${conPath}/movie.do?method=detail&movieNo='+movieNo[random]);
	});
	
</script>

</head>

<body>
	<jsp:include page="header.jsp" />

	<div class="wrap">
		<div class="ment">
			<h1>
				<a href=""> 소중한 순간을 담은 사진 지금, 간직하세요 </a>
			</h1>
		</div>


		<div class="mainwrap">
			<div class="mainwrap_back">
				<img src="${conPath }/img/main_banner3.png">

				<div class="mainbanner">
					<img class="slides" src="${conPath }/img/slide1.png"> <img
						class="slides" src="${conPath }/img/slide2.png"> <img
						class="slides" src="${conPath }/img/slide3.png"> <img
						class="slides" src="${conPath }/img/slide4.png"> <img
						class="slides" src="${conPath }/img/slide5.png">
				</div>
			</div>
		</div>

		<div class="movie_selection">

			<div class="up">
				======== &nbsp; <a href="movie.do?method=list">MOVIE SELECTION</a>
				&nbsp; =======
			</div>
			<div class="movie_Form">
				<div class="movie_gg">
					<iframe id="movieTrailer" width="940" height="400" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
				<div class="movie_img">
					<a id="movieLink"> <img id="movieImage">
					</a>
				</div>

			</div>
			<div class="mid">
				====== &nbsp; <a href="event.do?method=list"> EVENT </a> &nbsp;
				======
			</div>
			<div class="menu_top">
				<ul class="list_left">
					<li>MAC 스페셜 </li>
					<li><a href="booking.do?method=insertForm">영화 예매 </a></li>
					<li>MAC 아트하우스 </li>
					<li>제휴 / 할인</li>
				</ul>
			</div>
			<div class="event_img">
				<ul class="listimg_left">
					<c:forEach items="${ event_list}" var="event" begin="1" end="4">
						<li>
						<a href="event.do?method=detail&eventNo=${event.eventNo }">
								<img src="${conPath }/eventImgFileUpload/${event.eventFile}">
						</a></li>
					</c:forEach>
				</ul>
			</div>

			<div class="mini_banner">
				<c:forEach var="event" items="enent_list">
					<div class="mini_left">
						<a href="item.do?method=list"><img
							src="${conPath }/img/leftImg.png"></a>
					</div>
					<div class="mini_mid">
						<a hreg="sub.do?method=서브페이지 수정"><img
							src="${conPath }/img/midImg.png"></a>
					</div>
					<div class="mini_right">
						<a href="event.do?method=이벤트 No로 보낼꺼임"><img
							src="${conPath }/img/rightImg.png"></a>
					</div>
				</c:forEach>
			</div>


			<div class="mini_bar">
				<div class="mini_barwrap">
					<div class="scroll">
						<ul>
							<c:forEach var="qna" items="${qna_Hitlist }">
								<li class="list_in">
									<div>
										<div class="list_inleft">Q N A :&nbsp; ${qna.qnaTitle }
											. . . &nbsp;&nbsp;&nbsp; ${qna.memberName } &nbsp;</div>
										<div class="list_inright">
											<fmt:formatDate value="${qna.qnaDate}" pattern="yyyy.MM.dd" />
										</div>
									</div>
								</li>
							</c:forEach>

						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>