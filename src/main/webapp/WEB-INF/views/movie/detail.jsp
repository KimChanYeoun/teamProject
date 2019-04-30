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
	<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${conPath }/semantic/semantic.min.css">
	<script
	  src="https://code.jquery.com/jquery-3.1.1.min.js"
	  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	  crossorigin="anonymous"></script>
	<script src="${conPath }/semantic/semantic.min.js"></script>
	<script>
		$(document).ready(function() {
			$.fn.generateStars = function() {
			    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*8));});
			};
			// 숫자 평점을 별로 변환하도록 호출하는 함수
			$('.star-prototype').generateStars();
			$('.starRev span').click(function(){
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				$('#movieRatingPoint').val($(this).text());
				return false;
			});
			$('#ratingComment').keyup(function(){
				if($(this).val().length > 100){
					alert('100자 이내로 입력하세요');
					$(this).val($(this).val().substring(0, 100));
				}
			});
			$('#addComment').click(function(){
				$('#frm').submit();
			});
			$('.ui.embed').embed();
		});
	</script>
	<style>
		body{background-color:#f2f2f2;}
		#container{width:66%; margin:0 auto; padding:20px;}
		.movieImg{width:185px; height:260px; vertical-align:top; margin: 15px;}
		.bigFont{font-size:1.5em;}
		.bold{font-weight:bold;}
		.content{display: inline-block; width:inherit;}
		.ui.grid .eight.wide.column{border-bottom:1px solid #f0f0f0;}
		.ui.grid .eight.wide.column:nth-child(2n+1){border-right:1px solid #f0f0f0;}
		span.star-prototype, span.star-prototype > * {
		    height: 16px; 
		    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
		    width: 80px;
		    display: inline-block;
		}
		span.star-prototype > * {
		    background-position: 0 0;
		    max-width:80px; 
		}
		.starR1{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		.starR2{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		.starR1.on{background-position:0 0;}
		.starR2.on{background-position:-15px 0;}
		.ui.comments{max-width:100%;}
		.close.icon:hover{cursor:pointer;}
	</style>
</head>
<body>
	<c:if test="${not empty msg }">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<h1 class="ui header">영화상세
			<c:if test="${not empty admin }">
				<div class="ui right floated button" onclick="location='${conPath}/movie.do?method=modifyForm&movieNo=${detail.movieNo }'">
					수정
				</div>
			</c:if>
		</h1>
		<hr>
		<br>
		<img src="${conPath }/movieImgUp/${detail.movieImage}" alt="사진" class="movieImg">
		<div class="content">
			<br>
			<span class="bigFont bold">${detail.movieName }</span>
			<span class="star-prototype">${detail.movieRating }</span>
			<span class="bold"><fmt:formatNumber value="${detail.movieRating }" pattern="##.#"/></span>
			<br><br>
			<hr>
			<br>
			감독 : ${detail.movieDirector }
			<br>
			배우 : ${detail.movieActor }
			<br>
			장르 : ${detail.movieGenre }
			<br>
			기본 : ${detail.movieGrade }, ${detail.movieRunningtime }, ${detail.movieCountry }
			<br>
			개봉 : <fmt:formatDate value="${detail.movieRelease }" pattern="yyyy.MM.dd"/>
			<br><br><br>
			<c:if test="${activeBooking eq true }">
				<div class="big ui button" onclick="location='${conPath}/booking.do?method=insertForm&movieNo=${detail.movieNo }'" style="background-color: #503396; color: white;">예매하기</div>
			</c:if>
		</div>
		<br>
		<br>
		<h2>줄거리</h2>
		<br>
		<div style="white-space:pre-line; width:100%;">${detail.movieStory }</div>
		<br><br><br>
		<h2>트레일러</h2>
		<br>
		<div class="ui embed" data-source="youtube" data-id="${detail.movieTrailer }"></div>
		<br><br><br>
		<div class="ui comments">
			<h2 class="ui dividing header">평점&한줄평</h2>
			<div class="ui grid">
				<c:forEach var="rating" items="${ratingList }">
					<div class="eight wide column">
						<div class="comment">
							<a class="avatar">
								<i class="big user circle icon"></i>
							</a>
							<div class="content">
								<a class="author">${rating.memberId }</a>
								<div class="metadata">
									<span class="date"><span class="star-prototype">${rating.movieRatingPoint }</span><span class="bigFont"> ${rating.movieRatingPoint }</span></span>
									<c:if test="${member.memberId eq rating.memberId }">
										<i class="close icon" onclick="location='${conPath}/movieRating.do?method=delete&movieRatingNo=${rating.movieRatingNo }&movieNo=${rating.movieNo }'"></i>
									</c:if>
								</div>
								<div class="text">
									${rating.movieRatingComment } 
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<br>
			<form action="${conPath }/movieRating.do?method=insert" class="ui reply form" id="frm" method="post">
				<input type="hidden" name="movieRatingPoint" id="movieRatingPoint" value="5">
				<input type="hidden" name="movieNo" value="${detail.movieNo }">
				<input type="hidden" name="memberId" value="${member.memberId }">
				<div class="field">
					<c:if test="${empty member }">
						<textarea name="movieRatingComment" readonly="readonly" placeholder="로그인 후 이용하세요"></textarea>
					</c:if>
					<c:if test="${not empty member }">
						<textarea name="movieRatingComment" id="ratingComment"></textarea>
					</c:if>
				</div>
				<div class="starRev">
				  <span class="starR1 on">1</span>
				  <span class="starR2 on">2</span>
				  <span class="starR1 on">3</span>
				  <span class="starR2 on">4</span>
				  <span class="starR1 on">5</span>
				  <span class="starR2">6</span>
				  <span class="starR1">7</span>
				  <span class="starR2">8</span>
				  <span class="starR1">9</span>
				  <span class="starR2">10</span>
				</div>
				<c:if test="${empty member }">
					<div class="ui right floated blue disabled button" id="addComment">
						<i class="comments outline icon"></i>댓글달기
					</div>
				</c:if>
				<c:if test="${not empty member }">
					<div class="ui right floated blue button" id="addComment">
						<i class="comments outline icon"></i>댓글달기
					</div>
				</c:if>
				<br><br>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>