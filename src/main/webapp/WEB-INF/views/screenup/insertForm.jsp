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
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$('.ui.dropdown').dropdown();
			$('#screenPicker').change(function(){
				var screenNo = $('#screenPicker').val();
				$.ajax({
					url : '${conPath}/screenup.do',
					type : 'get',
					data : 'method=getScreenupDate&screenNo='+screenNo,
					success : function(result){
						var disabledDays = result;
						function disableAllTheseDays(date) {
							var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
							for (i = 0; i < disabledDays.length; i++) {
								if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
									return [false];
								}
							}
							return [true];
						}
						$('#startDate').val('');
						$('#startDate').datepicker('destroy');
						$('#endDate').val('');
						$('#endDate').datepicker('destroy');
						$('#endDate').attr('placeholder', '상영시작일을 선택하세요');
						$('#startDate').datepicker({
							dateFormat : 'yy-mm-dd',
							monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							showMonthAfterYear : true,
							yearSuffix : '년',
							showOtherMonths : true,
							dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
							minDate : $('#movieRelease').val(),
							beforeShowDay : disableAllTheseDays,
							onClose: function(){
								$('#endDate').val('');
								$('#endDate').datepicker('destroy');
								$('#endDate').datepicker({
									dateFormat : 'yy-mm-dd',
									monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
									showMonthAfterYear : true,
									yearSuffix : '년',
									showOtherMonths : true,
									dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
									minDate : $('#startDate').val(),
									beforeShowDay : disableAllTheseDays
								});
							}
						});
					}
				});
				$('#startDate').removeAttr('placeholder');
			});
			$('#startDate').change(function(){
				$('#endDate').removeAttr('placeholder');
			});
			$('#moviePicker').change(function(){
				var movieNo = $('#moviePicker').val();
				$.ajax({
					url : '${conPath}/movie.do',
					type : 'get',
					data : 'method=getMovie&movieNo='+movieNo,
					success : function(result){
						$('#movieImg').html('<img src="${conPath}/movieImgUp/'+result.movieImage+'" alt="사진" width="185" height="260">');
						$('#movieRelease').val(result.movieRelease);
					}
				});
				$('.dropdown').removeClass('disabled');
				$('#screenArea .text').text('상영관을 선택하세요');
				$('#screenArea .text').addClass('default');
				$('#startDate').val('');
				$('#startDate').datepicker('destroy');
				$('#startDate').attr('placeholder', '상영관을 먼저 선택하세요');
				$('#endDate').val('');
				$('#endDate').datepicker('destroy');
				$('#endDate').attr('placeholder', '상영시작일을 먼저 선택하세요');
			});
			$('form').submit(function(){
				if($('#moviePicker').val() == null){
					alert('영화를 선택하세요');
					return false;
				}
				if($('#startDate').val() == ''){
					alert('상영시작일을 선택하세요');
					return false;
				}
				if($('#endDate').val() == ''){
					alert('상영종료일을 선택하세요');
					return false;
				}
			});
		});
	</script>
	<style>
		#container{width:66%; margin:0 auto; border:5px solid black;}
		#movieImg{width:185px; margin:0 auto;}
		form{width:60%; margin:20px auto;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<form class="ui form" action="${conPath }/screenup.do?method=insert" method="post">
			<input type="hidden" id="movieRelease">
			<h1 class="ui center aligned dividing header">상영등록</h1>
			<div id="movieImg"></div>
			<div class="field">
				<label>영화</label>
				<select class="ui dropdown" id="moviePicker" name="movieNo">
					<option value="">영화를 선택하세요</option>
					<c:forEach var="movie" items="${movieList }">
						<option value="${movie.movieNo }">${movie.movieName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="field" id="screenArea">
				<label>상영관</label>
				<select class="ui disabled dropdown" id="screenPicker" name="screenNo">
					<option value="">영화를 먼저 선택하세요</option>
					<option value="Y01">용산1관</option>
					<option value="Y02">용산2관</option>
					<option value="Y03">용산3관</option>
					<option value="Y04">용산4관</option>
					<option value="Y05">용산5관</option>
					<option value="G01">강남1관</option>
					<option value="G02">강남2관</option>
					<option value="G03">강남3관</option>
					<option value="G04">강남4관</option>
					<option value="G05">강남5관</option>
					<option value="M01">미아1관</option>
					<option value="M02">미아2관</option>
					<option value="M03">미아3관</option>
					<option value="M04">미아4관</option>
					<option value="M05">미아5관</option>
					<option value="H01">홍대1관</option>
					<option value="H02">홍대2관</option>
					<option value="H03">홍대3관</option>
					<option value="H04">홍대4관</option>
					<option value="H05">홍대5관</option>
					<option value="D01">동대문1관</option>
					<option value="D02">동대문2관</option>
					<option value="D03">동대문3관</option>
					<option value="D04">동대문4관</option>
					<option value="D05">동대문5관</option>
				</select>
			</div>
			<div class="field">
				<label>상영시작일</label>
				<input type="text" name="screenupStartdate" id="startDate" placeholder="상영관을 먼저 선택하세요" readonly="readonly">
			</div>
			<div class="field">
				<label>상영종료일</label>
				<input type="text" name="screenupEnddate" id="endDate" placeholder="상영시작일을 먼저 선택하세요" readonly="readonly">
			</div>
			<input class="ui button" type="submit" value="등록하기">
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>