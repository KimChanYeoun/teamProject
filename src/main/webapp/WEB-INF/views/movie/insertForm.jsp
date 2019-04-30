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
		$(document).ready(function(){
			$('.ui.dropdown').dropdown();
			$('#imageFile').change(function(){
				$('#imageFileName').val($('input[type=file]')[0].files[0].name);
			});
		});
	</script>
	<style>
		#container{width:66%; margin:10px auto; border:5px solid black;}
		form{width:60%; margin:20px auto;}
		textarea{vertical-align: top;}
		#imageFile{display: none;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<form class="ui form" action="${conPath }/movie.do?method=insert" method="post" enctype="multipart/form-data">
			<h1 class="ui center aligned dividing header">영화등록</h1>
			<div class="field">
				<label>제목</label>
				<input type="text" name="movieName" placeholder="제목" required="required">
			</div>
			<div class="field">
				<label>감독</label>
				<input type="text" name="movieDirector" placeholder="감독" required="required">
			</div>
			<div class="field">
				<label>배우</label>
				<input type="text" name="movieActor" placeholder="ex. actor1, actor2, actor3" required="required">
			</div>
			<div class="field">
				<label>장르</label>
				<select class="ui dropdown" name="movieGenre" required="required">
					<option value="">장르</option>
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
					<option value="미스터리">미스터리</option>
					<option value="뮤지컬">뮤지컬</option>
				</select>
			</div>
			<div class="field">
				<label>국가</label>
				<select class="ui dropdown" name="movieCountry" required="required">
					<option value="">국가</option>
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
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="field">
				<label>등급</label>
				<select class="ui dropdown" name="movieGrade" required="required">
					<option value="">등급</option>
					<option value="전체">전체</option>
					<option value="12세">12세</option>
					<option value="15세">15세</option>
					<option value="청소년 관람불가">청소년 관람불가</option>
				</select>
			</div>
			<div class="field">
				<label>상영시간</label>
				<input type="text" name="movieRunningtime" placeholder="ex. 120분" required="required">
			</div>
			<div class="field">
				<label>개봉일</label>
				<input type="date" name="movieRelease" required="required">
			</div>
			<div class="field">
				<label>대표이미지</label>
				<input type="file" id="imageFile" name="image">
				<label for="imageFile">
					<div class="ui action input">
						<input type="text" id="imageFileName" readonly="readonly">
						<div class="ui red right labeled icon button">
						    <i class="upload icon"></i>
							파일 업로드
						</div>
					</div>
				</label>
			</div>
			<div class="field">
				<label>트레일러</label>
				<input type="text" name="movieTrailer" placeholder="ex. xz93tMnwwzY" required="required">
			</div>
			<div class="field">
				<label>줄거리</label>
				<textarea name="movieStory"></textarea>
			</div>
			<input class="ui right floated button" type="submit" value="완료">
			<input class="ui button" type="reset" value="초기화">
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>