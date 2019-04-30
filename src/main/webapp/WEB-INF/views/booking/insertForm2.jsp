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
			$.ajax({
				url : '${conPath}/booking.do?method=getSeatState',
				type : 'get',
				data : 'timeNo=${param.timeNo}&screenNo=${param.screenNo}&seatStateDate=${param.seatStateDate}',
				success : function(seatState){
					for(var i=0 ; i<seatState.length ; i++){
						$('#'+seatState[i]).attr('disabled', 'disabled');
						$('#'+seatState[i]).next().addClass('grey');
					}
					$('#leftSeat').text(100-seatState.length);
				}
			});
			$('input[type=radio]').change(function(){
				$('input[type=checkbox]').prop('checked', false);
				var personnel = $('input[type=radio]:checked').val();
				var totPrice = 11000*Number(personnel);
				$('input[name=bookingPrice]').val(totPrice);
			});
			$('.person').click(function(){
				$('.person').removeClass('black');
				$(this).addClass('black');
				$('.seat').removeClass('red');
				$('#result').html('');
				$('#stepArea').css('background', 'url("${conPath}/img/step.PNG") no-repeat');
			})
			$('input[type=checkbox]').change(function(){
				var personnel = $('input[type=radio]:checked').val();
				var seats = $('input[type=checkbox]:checked').length;
				var totPrice = (11000*Number(personnel)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				if(seats>personnel){
					alert('이미 좌석을 모두 선택하였습니다!');
					$(this).prop('checked', false);
				} else {
					if($('input[type=checkbox]').is(':checked')){
						var seat = [];
						$('input[type=checkbox]:checked').each(function(){
							seat.push(' '+$(this).val());
						})
						$('#stepArea').css('background', 'url()');
						$('#result').html('좌석 : <span class="white">'+seat+'</span><br><br><br>총금액 : <span class="red">'+totPrice+'원</span>');
					} else {
						$('#stepArea').css('background', 'url("${conPath}/img/step.PNG") no-repeat');
						$('#result').html('');
					}
					if(!$(this).prop('checked')){
						$(this).next('.seat').removeClass('red');
					} else {
						$(this).next('.seat').addClass('red');
					}
					if(seats==personnel){
						$('#btnNext').addClass('red');
					} else {
						$('#btnNext').removeClass('red');
					}
				}
			});
			$('#btnNext').click(function(){
				$('#frm').submit();
			});
			$('#frm').submit(function(e){
				var personnel = $('input[type=radio]:checked').val();
				var seats = $('input[type=checkbox]:checked').length;
				if(seats<personnel){
					alert('좌석을 모두 선택해 주세요');
					return false;
				} else {
					e.preventDefault();
					var seatNo = new Array();
					$('input[type=checkbox]:checked').each(function(){
						seatNo.push($(this).val());
					});
					jQuery.ajaxSettings.traditional = true;
					$.ajax({
						url : '${conPath}/booking.do?method=checkSeatState',
						type : 'post',
						data : { 'seatNo' : seatNo, 'timeNo' : '${param.timeNo}' , 'screenNo' : '${param.screenNo}', 'seatStateDate' : '${param.seatStateDate}'},
						success : function(result){
							if(result!=0){
								alert('이미 예매된 좌석입니다. 다시 선택해 주세요');
								location.reload();
							} else {
								$('#frm').unbind('submit').submit();
							}
						}
					});
				}
			});
		});
	</script>
	<style>
		*{margin:0; padding:0;}
		#container{width:66%; height:600px; margin:0 auto; border:5px solid black;}
		#btnNext{
			padding:10px 25px 10px 0;
			border:3px solid darkgray;
			border-radius: 20px;
		}
		#screen{
			width:652px;
			height:25px;
			line-height:25px;
			margin:25px auto;
			background: url("${conPath}/img/screen_bg.png") repeat-x left;
		}
		#screenText{
			width:100%;
			height:25px;
			background: url("${conPath}/img/screen_text.png") no-repeat center;
		}
		#rows{text-align:right;}
		.row{
			display:inline-block;
			width:20px;
			height:31px;
			line-height:31px;
			border-top:1px solid #d4d3c9;
			text-align:center;
			font-size:1.3em;
		}
		#stepArea{background: url("${conPath}/img/step.PNG") no-repeat;}
		#seat{text-align:center;}
		#leftSeat{color:#CA4D10; font-weight: bold;}
		.white{color:white;}
		.red{color:#bf2828;}
		.bold{font-size:1.5em; font-weight:bold;}
		input[type=checkbox], input[type=radio]{display:none;}
		.ui.label.person:hover{cursor:pointer; background-color:grey;}
		.ui.label.seat:hover{cursor:pointer; background-color:red;}
		.ui.secondary.inverted.segment{text-align:center; margin:0; background-color:#333333;}
		.ui.horizontal.segments{margin:0;}
		.ui.inverted.header{text-align:left;}
		.movieImage{vertical-align:middle};
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<h1>좌석선택 페이지</h1>
		<div class="ui secondary inverted segment bold">
			인원 / 좌석
		</div>
		<form action="booking.do?method=payment" method="post" id="frm">
			<input type="hidden" name="memberId" value="${member.memberId }">
			<input type="hidden" name="movieNo" value="${param.movieNo }">
			<input type="hidden" name="screenupNo" value="${param.screenupNo }">
			<input type="hidden" name="timeNo" value="${param.timeNo }">
			<input type="hidden" name="bookingDate" value="${param.seatStateDate }">
			<input type="hidden" name="bookingPrice" value="11000">
			<input type="hidden" name="screenNo" value="${param.screenNo }">
			<input type="hidden" name="cinemaName" value="${param.cinemaName }">
			<input type="hidden" name="screenName" value="${param.screenName }">
			<input type="hidden" name="seatStateDate" value="${param.seatStateDate }">
			<input type="hidden" name="time" value="${param.time }">
			
			<div class="ui horizontal segments">
				<div class="ui segment">
					<div id="personnelSelect">
						<span class="bold">인원</span>
						<input type="radio" id="person1" name="bookingCount" value="1" checked="checked">
						<input type="radio" id="person2" name="bookingCount" value="2">
						<input type="radio" id="person3" name="bookingCount" value="3">
						<input type="radio" id="person4" name="bookingCount" value="4">
						<input type="radio" id="person5" name="bookingCount" value="5">
						<input type="radio" id="person6" name="bookingCount" value="6">
						<input type="radio" id="person7" name="bookingCount" value="7">
						<input type="radio" id="person8" name="bookingCount" value="8">
						<label class="ui label person black" for="person1">1</label>
						<label class="ui label person" for="person2">2</label>
						<label class="ui label person" for="person3">3</label>
						<label class="ui label person" for="person4">4</label>
						<label class="ui label person" for="person5">5</label>
						<label class="ui label person" for="person6">6</label>
						<label class="ui label person" for="person7">7</label>
						<label class="ui label person" for="person8">8</label>
					</div>
				</div>
				<div class="ui segment">
					${param.cinemaName } | ${param.screenName } | 남은좌석 <span id="leftSeat"></span>/100<br>
					<span class="bold">${param.seatStateDate } &nbsp; ${param.time }</span>
				</div>
			</div>
			<div id="screen">
				<div id="screenText"></div>
			</div>
			<div id="seat" class="ui grid">
				<div class="five wide column" id="rows">
					<span class="row">A</span><br>
					<span class="row">B</span><br>
					<span class="row">C</span><br>
					<span class="row">D</span><br>
					<span class="row">E</span><br>
					<span class="row">F</span><br>
					<span class="row">G</span><br>
					<span class="row">H</span><br>
					<span class="row">I</span><br>
					<span class="row">J</span>
				</div>
				<div class="six wide column">
					<c:set var="rows" value="A,B,C,D,E,F,G,H,I,J" />
					<div class="ui labels">
						<c:forTokens var="row" items="${rows }" delims=",">
							<c:forEach var="col" begin="1" end="10" varStatus="status"><c:if test="${status.index == 3 or status.index == 9 }"> &nbsp; &nbsp; &nbsp;</c:if><input type="checkbox" name="seatNo" id="${row }${col}" value="${row }${col}"><label class="ui label seat" for="${row }${col}">${col}</label></c:forEach>
							<br>
						</c:forTokens>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="ui inverted vertical segment" id="resultArea">
		<div class="ui container">
			<div class="ui stackable inverted divided equal height stackable grid">
				<div class="three wide column" id="movieArea">
					<div class="ui inverted header" id="resultMovie">
						<div class="ui inverted link list">
							<span class="item">
								<a href="${conPath}/movie.do?method=detail&movieNo=${movie.movieNo}">
									<img class="ui left floated image" src="${conPath}/movieImgUp/${movie.movieImage }" alt="이미지" width="74" height="104">${movie.movieName }
								</a>
							</span>
						</div>
					</div>
				</div>
				<div class="four wide column" id="cinemaArea">
					<div class="ui inverted header" id="resultCinema">
						<div class="ui inverted link list">
							<span class="item">극장 : <a href="" target="_blank" >${param.cinemaName }</a></span>
							<span><span class="item">일시 : <a>${param.seatStateDate }</a></span></span><br>
							<span><span class="item">상영관 : <a>${param.screenName } &nbsp;${param.time }</a></span></span>
						</div>
					</div>
				</div>
				<div class="eight wide column" id="stepArea">
					<div class="ui left floated inverted header">
						<span class="ui inverted link list">
							<span class="item" id="result">
							</span>
						</span>
					</div>
					<div class="ui right floated labeled button" id="btnArea">
						<div class="ui grey button" id="btnNext">
							<i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">결제가기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>