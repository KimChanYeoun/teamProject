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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
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
		});
	</script>
	<style>
		body{background-color:#f2f2f2;}
		#container{width:66%; margin:0 auto; padding:20px;}
		.movieWrap{display:inline-block; width:24%; text-align:center;}
		.movieImg{width:185px; height:260px;}
		span.star-prototype, span.star-prototype > * {
		    height: 16px; 
		    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
		    width: 80px;
		    display: inline-block;
		    text-align: left;
		}
		span.star-prototype > * {
		    background-position: 0 0;
		    max-width:80px; 
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<h1>상영예정작</h1>
		<br>
		<c:forEach var="movie" items="${schedule }" varStatus="idx">
			<div class="movieWrap">
				<a href="${conPath }/movie.do?method=detail&movieNo=${movie.movieNo}&pageNum=${param.pageNum}">
					<img class="movieImg" src="${conPath }/movieImgUp/${movie.movieImage}" alt="사진"></a>
				<br>
				<a href="${conPath }/movie.do?method=detail&movieNo=${movie.movieNo}&pageNum=${param.pageNum}">
					${movie.movieName }</a>
				<br>
				<span class="star-prototype">${movie.movieRating }</span>
				<span class="bold"><fmt:formatNumber value="${movie.movieRating }" pattern="##.#"/></span>
				<br>
				<fmt:formatDate value="${movie.movieRelease }" pattern="yyyy.MM.dd"/> 개봉
			</div>
			<c:if test="${idx.count%4 eq 0 }"><br><br><hr><br></c:if>
		</c:forEach>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>