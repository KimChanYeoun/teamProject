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
			$('#imageFile').change(function(){
				$('#imageFileName').val($('input[type=file]')[0].files[0].name);
			});
		});
	</script>
	<style>
		#container{width:66%; margin:0 auto; border:5px solid black;}
		form{width:60%; margin:20px auto;}
		textarea{vertical-align: top;}
		#imageFile{display: none;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<h1 class="ui center aligned dividing header">영화수정</h1>
		<form class="ui form" action="${conPath }/movie.do?method=modify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="movieRelease" value="${modifyForm.movieRelease }">
			<input type="hidden" name="movieNo" value="${modifyForm.movieNo }">
			<input type="hidden" name="movieImage" value="${modifyForm.movieImage }">
			<div class="field">
				<label>제목</label>
				<input type="text" name="movieName" placeholder="제목" required="required" value="${modifyForm.movieName }">
			</div>
			<div class="field">
				<label>감독</label>
				<input type="text" name="movieDirector" placeholder="감독" required="required" value="${modifyForm.movieDirector }">
			</div>
			<div class="field">
				<label>배우</label>
				<input type="text" name="movieActor" placeholder="ex. actor1, actor2, actor3" required="required" value="${modifyForm.movieActor }">
			</div>
			<div class="field">
				<label>장르</label>
				<select class="ui dropdown" name="movieGenre" required="required">
					<option value="액션" <c:if test="${modifyForm.movieGenre eq '액션' }">selected="selected"</c:if>>액션</option>
					<option value="코미디" <c:if test="${modifyForm.movieGenre eq '코미디' }">selected="selected"</c:if>>코미디</option>
					<option value="드라마" <c:if test="${modifyForm.movieGenre eq '드라마' }">selected="selected"</c:if>>드라마</option>
					<option value="판타지" <c:if test="${modifyForm.movieGenre eq '판타지' }">selected="selected"</c:if>>판타지</option>
					<option value="공포" <c:if test="${modifyForm.movieGenre eq '공포' }">selected="selected"</c:if>>공포</option>
					<option value="멜로/로맨스" <c:if test="${modifyForm.movieGenre eq '멜로/로맨스' }">selected="selected"</c:if>>멜로/로맨스</option>
					<option value="모험" <c:if test="${modifyForm.movieGenre eq '모험' }">selected="selected"</c:if>>모험</option>
					<option value="스릴러" <c:if test="${modifyForm.movieGenre eq '스릴러' }">selected="selected"</c:if>>스릴러</option>
					<option value="다큐멘터리" <c:if test="${modifyForm.movieGenre eq '다큐멘터리' }">selected="selected"</c:if>>다큐멘터리</option>
					<option value="애니메이션" <c:if test="${modifyForm.movieGenre eq '애니메이션' }">selected="selected"</c:if>>애니메이션</option>
					<option value="범죄" <c:if test="${modifyForm.movieGenre eq '범죄' }">selected="selected"</c:if>>범죄</option>
					<option value="SF" <c:if test="${modifyForm.movieGenre eq 'SF' }">selected="selected"</c:if>>SF</option>
					<option value="미스터리" <c:if test="${modifyForm.movieGenre eq '미스터리' }">selected="selected"</c:if>>미스터리</option>
					<option value="뮤지컬" <c:if test="${modifyForm.movieGenre eq '뮤지컬' }">selected="selected"</c:if>>뮤지컬</option>
				</select>
			</div>
			<div class="field">
				<label>국가</label>
				<select class="ui dropdown" name="movieCountry" required="required">
					<option value="대한민국" <c:if test="${modifyForm.movieCountry eq '대한민국' }">selected="selected"</c:if>>대한민국</option>
					<option value="미국" <c:if test="${modifyForm.movieCountry eq '미국' }">selected="selected"</c:if>>미국</option>
					<option value="일본" <c:if test="${modifyForm.movieCountry eq '일본' }">selected="selected"</c:if>>일본</option>
					<option value="중국" <c:if test="${modifyForm.movieCountry eq '중국' }">selected="selected"</c:if>>중국</option>
					<option value="인도" <c:if test="${modifyForm.movieCountry eq '인도' }">selected="selected"</c:if>>인도</option>
					<option value="프랑스" <c:if test="${modifyForm.movieCountry eq '프랑스' }">selected="selected"</c:if>>프랑스</option>
					<option value="네덜란드" <c:if test="${modifyForm.movieCountry eq '네덜란드' }">selected="selected"</c:if>>네덜란드</option>
					<option value="대만" <c:if test="${modifyForm.movieCountry eq '대만' }">selected="selected"</c:if>>대만</option>
					<option value="러시아" <c:if test="${modifyForm.movieCountry eq '러시아' }">selected="selected"</c:if>>러시아</option>
					<option value="멕시코" <c:if test="${modifyForm.movieCountry eq '멕시코' }">selected="selected"</c:if>>멕시코</option>
					<option value="스위스" <c:if test="${modifyForm.movieCountry eq '스위스' }">selected="selected"</c:if>>스위스</option>
					<option value="스웨덴" <c:if test="${modifyForm.movieCountry eq '스웨덴' }">selected="selected"</c:if>>스웨덴</option>
					<option value="아르헨티나" <c:if test="${modifyForm.movieCountry eq '아르헨티나' }">selected="selected"</c:if>>아르헨티나</option>
					<option value="아일랜드" <c:if test="${modifyForm.movieCountry eq '아일랜드' }">selected="selected"</c:if>>아일랜드</option>
					<option value="오스트리아" <c:if test="${modifyForm.movieCountry eq '오스트리아' }">selected="selected"</c:if>>오스트리아</option>
					<option value="오스트레일리아" <c:if test="${modifyForm.movieCountry eq '오스트레일리아' }">selected="selected"</c:if>>오스트레일리아</option>
					<option value="이스라엘" <c:if test="${modifyForm.movieCountry eq '이스라엘' }">selected="selected"</c:if>>이스라엘</option>
					<option value="이탈리아" <c:if test="${modifyForm.movieCountry eq '이탈리아' }">selected="selected"</c:if>>이탈리아</option>
					<option value="캐나다" <c:if test="${modifyForm.movieCountry eq '캐나다' }">selected="selected"</c:if>>캐나다</option>
					<option value="홍콩" <c:if test="${modifyForm.movieCountry eq '홍콩' }">selected="selected"</c:if>>홍콩</option>
					<option value="기타" <c:if test="${modifyForm.movieCountry eq '기타' }">selected="selected"</c:if>>기타</option>
				</select>
			</div>
			<div class="field">
				<label>등급</label>
				<select class="ui dropdown" name="movieGrade" required="required">
					<option value="전체" <c:if test="${modifyForm.movieGrade eq '전체' }">selected="selected"</c:if>>전체</option>
					<option value="12세" <c:if test="${modifyForm.movieGrade eq '12세' }">selected="selected"</c:if>>12세</option>
					<option value="15세" <c:if test="${modifyForm.movieGrade eq '15세' }">selected="selected"</c:if>>15세</option>
					<option value="청소년 관람불가" <c:if test="${modifyForm.movieGrade eq '청소년 관람불가' }">selected="selected"</c:if>>청소년 관람불가</option>
				</select>
			</div>
			<div class="field">
				<label>상영시간</label>
				<input type="text" name="movieRunningtime" placeholder="ex. 120분" required="required" value="${modifyForm.movieRunningtime }">
			</div>
			<div class="field">
				<label>대표이미지</label>
				<input type="file" id="imageFile" name="image">
				<label for="imageFile">
					<div class="ui action input">
						<input type="text" id="imageFileName" readonly="readonly" value="${modifyForm.movieImage }">
						<div class="ui red right labeled icon button">
						    <i class="upload icon"></i>
							파일 업로드
						</div>
					</div>
				</label>
			</div>
			<div class="field">
				<label>트레일러</label>
				<input type="text" name="movieTrailer" placeholder="ex. xz93tMnwwzY" required="required" value="${modifyForm.movieTrailer }">
			</div>
			<div class="field">
				<label>줄거리</label>
				<textarea name="movieStory">${modifyForm.movieStory }</textarea>
			</div>
			<input class="ui right floated button" type="submit" value="완료">
			<input class="ui button" type="reset" value="초기화">
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>