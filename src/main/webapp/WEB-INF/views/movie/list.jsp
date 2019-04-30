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
	<link rel="stylesheet" type="text/css" href="${conPath }/semantic/semantic.min.css">
	<script
	  src="https://code.jquery.com/jquery-3.1.1.min.js"
	  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	  crossorigin="anonymous"></script>
	<script src="${conPath }/semantic/semantic.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.ui.dropdown').dropdown();
			$.fn.generateStars = function() {
			    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*8));});
			};
			// 숫자 평점을 별로 변환하도록 호출하는 함수
			$('.star-prototype').generateStars();
			$('form').submit(function(){
				if($('#minYear').val()<1960 || $('#minYear').val()>2020){
					alert('입력가능한 범위가 아닙니다');
					$('#minYear').val(1960);
					$('#minYear').focus();
					return false;
				}
				if($('#maxYear').val()<1960 || $('#maxYear').val()>2020){
					alert('입력가능한 범위가 아닙니다');
					$('#maxYear').val(2020);
					$('#maxYear').focus();
					return false;
				}
			});
			$('input[type=reset]').click(function(){
				$('.text').text('전체');
				$('.text').addClass('default');
			});
		});
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) { 
				return;
			} else {
				return false;
			}
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
				return;
			} else {
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
			}
		}
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
		.middle{line-height: 37.33px;}
		table{width:95%;}
		.dropdown{width:100%;}
		.center{text-align:center;}
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
		<div class="ui segment">
			<h1 class="ui header">
				무비파인더
				<c:if test="${not empty admin }">
					<div class="ui right floated button" onclick="location='${conPath}/screenup.do?method=insertForm'">상영등록</div>
					<div class="ui right floated button" onclick="location='${conPath}/movie.do?method=insertForm'">영화등록</div>
				</c:if>
			</h1>
	        <form class="ui form" action="movie.do?method=search" method="post">
	            <fieldset>
	                <legend class="center">무비파인더 검색 및 조건</legend>
	                <table>
	                    <tr>
	                        <th>제목</th>
	                        <td>
	                            <input type="text" name="movieName" placeholder="키워드를 입력해 주세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>장르</th>
	                        <td>
	                           	<select class="ui dropdown" name="movieGenre">
	                           		<option value="">전체</option>
									<option value="액션">액션</option>
									<option value="코미디">코미디</option>
									<option value="드라마">드라마</option>
									<option value="판타지">판타지</option>
									<option value="공포">공포</option>
									<option value="멜로/로맨스">멜로/로맨스</option>
									<option value="모험">모험</option>
									<option value="스릴러">스릴러</option>
									<option value="다큐멘터리">다큐멘터리</option>
									<option value="애니메이션">애니메이션</option>
									<option value="범죄">범죄</option>
									<option value="SF">SF</option>
									<option value="스릴러">스릴러</option>
								</select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>제작국가</th>
	                        <td>
	                            <select class="ui dropdown" name="movieCountry">
	                            	<option value="">전체</option>
									<option value="대한민국">대한민국</option>
									<option value="미국">미국</option>
									<option value="일본">일본</option>
									<option value="중국">중국</option>
									<option value="인도">인도</option>
									<option value="프랑스">프랑스</option>
									<option value="네덜란드">네덜란드</option>
									<option value="대만">대만</option>
									<option value="러시아">러시아</option>
									<option value="멕시코">멕시코</option>
									<option value="스위스">스위스</option>
									<option value="스웨덴">스웨덴</option>
									<option value="아르헨티나">아르헨티나</option>
									<option value="아일랜드">아일랜드</option>
									<option value="오스트리아">오스트리아</option>
									<option value="오스트레일리아">오스트레일리아</option>
									<option value="이스라엘">이스라엘</option>
									<option value="이탈리아">이탈리아</option>
									<option value="캐나다">캐나다</option>
									<option value="홍콩">홍콩</option>
								</select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>제작년도</th>
	                        <td>
	                        	<div class="two fields">
	                        		<div class="field">
			                            <input type="text" id="minYear" name="minYear" maxlength="4" placeholder="최소" value="1960" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
	                        		</div>
	                        		<span class="middle">-</span>
	                        		<div class="field">
			                            <input type="text" id="maxYear" name="maxYear" maxlength="4" placeholder="최대" value="2020" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
	                        		</div>
	                        		<span class="middle">년</span>
	                            </div>
	                        </td>
	                    </tr>
	                </table>
	                <div class="center">
	                    <input type="submit" class="ui button" value="검색">
	                    <input type="reset" class="ui button" value="초기화" onclick="location='${conPath}/movie.do?method=list'">
	                </div>
	            </fieldset>
	        </form>
		</div>
		<br>
		<c:forEach var="movie" items="${list }" varStatus="idx">
			<div class="movieWrap">
				<a href="${conPath }/movie.do?method=detail&movieNo=${movie.movieNo}&pageNum=${param.pageNum}">
					<img class="movieImg" src="${conPath }/movieImgUp/${movie.movieImage}" alt="사진"></a>
				<br>
				<a href="${conPath }/movie.do?method=detail&movieNo=${movie.movieNo}&pageNum=${param.pageNum}" style="color:black; font-size:1.2em; font-weight:bold;">
					${movie.movieName }</a>
				<br>
				<span class="star-prototype">${movie.movieRating }</span>
				<span class="bold"><fmt:formatNumber value="${movie.movieRating }" pattern="##.#"/></span>
				<br>
				<fmt:formatDate value="${movie.movieRelease }" pattern="yyyy.MM.dd"/> 개봉
			</div>
			<c:if test="${not idx.last }">
				<c:if test="${idx.count%4 eq 0 }"><br><br><hr><br></c:if>
			</c:if>
		</c:forEach>
		<br><br>
		<c:if test="${not empty list }">
			<div class="center">
				<div class="ui pagination menu">
					<c:if test="${paging.startPage>paging.blockSize }">
						<a class="icon item" href="${conPath }/movie.do?method=list&pageNum=${paging.startPage-1}"><i class="left chevron icon"></i></a>
					</c:if>
					<c:forEach var="i" begin="${paging.startPage }"
						end="${paging.endPage }">
						<c:if test="${paging.currentPage==i }">
							<span class="item" style="color:red; text-decoration: underline;">${i }</span>
						</c:if>
						<c:if test="${paging.currentPage!=i }">
							<a class="item" href="${conPath }/movie.do?method=list&pageNum=${i}">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage<paging.pageCnt }">
						<a class="icon item" href="${conPath }/movie.do?method=list&pageNum=${paging.endPage+1}"><i class="right chevron icon"></i></a>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>