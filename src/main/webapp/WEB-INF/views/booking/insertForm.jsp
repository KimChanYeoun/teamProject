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
			$('.movieSelected').click(function(){
				$('#movieArea').css('background', 'url()');
				$('#cinemaArea').css('background', 'url("${conPath}/img/cinemaSelect.PNG") no-repeat');
				$('.movieSelected').attr('style', 'background-color:#fff;');
				$('.movieSelected').find('.movieName').attr('style', 'color:#333');
				$(this).attr('style', 'background-color:#333; border:2px solid #5c5c5c');
				$(this).find('.movieName').attr('style', 'color:#fff');
				var movieNo = $(this).children('#movieNo').val();
				var movieName = $(this).find('.movieName').text();
				var movieImage = $(this).children('#movieImage').val();
				$('#resultMovie').html('<div class="ui inverted link list"><span class="item"><a href="${conPath}/movie.do?method=detail&movieNo='+movieNo+'"><img class="ui left floated image" src="${conPath}/movieImgUp/'+movieImage+'" alt="이미지" width="74" height="104">'+movieName+'</a></span></div>');
				$('#dateList').html('');
				$('#screenList').html('');
				$('#resultCinema').html('');
				$('#resultDate').html('');
				$('#resultTime').html('');
				$('#btnArea').html('<div class="ui grey button" id="btnNext" onclick="alert(\'조건을 모두 선택하세요\')"><i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">좌석선택</span></div>');
				$.ajax({
					url : '${conPath}/booking.do',
					type : 'get',
					data : 'method=selectedMovie&movieNo='+movieNo,
					success : function(cinema){
						for(var i=0 ; i<cinema.length ; i++){
							if(i==0){
								$('#cinemaList').html('<div class="cinemaSelected">'+cinema[i].cinemaName+'<input type="hidden" id="cinemaNo" value="'+cinema[i].cinemaNo+'"></div>');
							} else {
								$('#cinemaList').append('<div class="cinemaSelected">'+cinema[i].cinemaName+'<input type="hidden" id="cinemaNo" value="'+cinema[i].cinemaNo+'"></div>');
							}
						}
						$('.cinemaSelected').click(function(){
							$('#cinemaArea').css('background', 'url()');
							$('.cinemaSelected').attr('style', 'background-color:#fff; color:#333');
							$(this).attr('style', 'background-color:#333; color:#fff; border:2px solid #5c5c5c; padding-left:5px');
							var cinemaNo = $(this).children('#cinemaNo').val();
							var cinemaName = $(this).text();
							$('#resultCinema').html('<div class="ui inverted link list"><span class="item">극장 : <a href="" target="_blank" >'+cinemaName+'</a></span><span id="resultDate"></span></div>');
							$('#screenList').html('');
							$('#resultDate').html('');
							$('#resultTime').html('');
							$('#btnArea').html('<div class="ui grey button" id="btnNext" onclick="alert(\'조건을 모두 선택하세요\')"><i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">좌석선택</span></div>');
							$.ajax({
								url : '${conPath}/booking.do',
								type : 'get',
								data : 'method=selectedCinema&movieNo='+movieNo+'&cinemaNo='+cinemaNo,
								success : function(date){
									var today = new Date();
									var dd = today.getDate();
									var mm = today.getMonth()+1;
									var yyyy = today.getFullYear();
									if(mm<10){
										mm = "0"+mm;
									}
									if(dd<10){
										dd = "0"+dd;
									}
									today = yyyy+'-'+mm+'-'+dd;
									$('#dateList').html('');
									for(var i=0 ; i<date.length ; i++){
										if(today <= date[i]){
											$('#dateList').append('<div class="dateSelected">'+date[i]+'<input type="hidden" id="selectedDate" value="'+date[i]+'"></div>');
										}
									}
									$('.dateSelected').click(function(){
										$('.dateSelected').attr('style', 'background-color:#fff; color:#333');
										$(this).attr('style', 'background-color:#333; color:#fff; border:2px solid #5c5c5c; padding-left:5px');
										var selectedDate = $(this).children('#selectedDate').val();
										$('#resultDate').html('<span class="item">일시 : <a>'+selectedDate+'</a></span><br><span id="resultTime"></span>');
										$('#resultTime').html('');
										$('#btnArea').html('<div class="ui grey button" id="btnNext" onclick="alert(\'조건을 모두 선택하세요\')"><i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">좌석선택</span></div>');
										$.ajax({
											url : '${conPath}/booking.do',
											type : 'get',
											data : 'method=selectedDate&movieNo='+movieNo+'&cinemaNo='+cinemaNo+'&selectedDate='+selectedDate,
											success : function(screen){
												var nowTime = new Date().getHours();
												for(var i=0 ; i<screen.length ; i++){
													if(selectedDate == today){
														if(i==0){
															$('#screenList').html('<div class="screenSelected">'+screen[i].screenName+'<input type="hidden" id="selectedScreen" value="'+screen[i].screenNo+'">');
															$('#screenList').append('<input type="hidden" id="screenName" value="'+screen[i].screenName+'">')
															if(nowTime<8){
																$('#screenList').append('<span class="timeSelected">08:00<input type="hidden" id="selectedTime" value="8"></span>');
															}
															if(nowTime<11){
																$('#screenList').append('<span class="timeSelected">11:00<input type="hidden" id="selectedTime" value="11"></span>');
															}
															if(nowTime<14){
																$('#screenList').append('<span class="timeSelected">14:00<input type="hidden" id="selectedTime" value="14"></span>');
															}
															if(nowTime<17){
																$('#screenList').append('<span class="timeSelected">17:00<input type="hidden" id="selectedTime" value="17"></span>');
															}
															if(nowTime<20){
																$('#screenList').append('<span class="timeSelected">20:00<input type="hidden" id="selectedTime" value="20"></span>');
															}
															if(nowTime<23){
																$('#screenList').append('<span class="timeSelected">23:00<input type="hidden" id="selectedTime" value="23"></span>');
															}
															$('#screenList').append('</div>');
														} else {
															$('#screenList').append('<div class="screenSelected">'+screen[i].screenName+'<input type="hidden" id="selectedScreen" value="'+screen[i].screenNo+'">');
															$('#screenList').append('<input type="hidden" id="screenName" value="'+screen[i].screenName+'">')
															if(nowTime<8){
																$('#screenList').append('<span class="timeSelected">08:00<input type="hidden" id="selectedTime" value="8"></span>');
															}
															if(nowTime<11){
																$('#screenList').append('<span class="timeSelected">11:00<input type="hidden" id="selectedTime" value="11"></span>');
															}
															if(nowTime<14){
																$('#screenList').append('<span class="timeSelected">14:00<input type="hidden" id="selectedTime" value="14"></span>');
															}
															if(nowTime<17){
																$('#screenList').append('<span class="timeSelected">17:00<input type="hidden" id="selectedTime" value="17"></span>');
															}
															if(nowTime<20){
																$('#screenList').append('<span class="timeSelected">20:00<input type="hidden" id="selectedTime" value="20"></span>');
															}
															if(nowTime<23){
																$('#screenList').append('<span class="timeSelected">23:00<input type="hidden" id="selectedTime" value="23"></span>');
															}
															$('#screenList').append('</div>');
														}
													} else {
														if(i==0){
															$('#screenList').html('<div class="screenSelected">'+screen[i].screenName+'<input type="hidden" id="selectedScreen" value="'+screen[i].screenNo+'">');
															$('#screenList').append('<input type="hidden" id="screenName" value="'+screen[i].screenName+'">')
															$('#screenList').append('<span class="timeSelected">08:00<input type="hidden" id="selectedTime" value="8"></span>');
															$('#screenList').append('<span class="timeSelected">11:00<input type="hidden" id="selectedTime" value="11"></span>');
															$('#screenList').append('<span class="timeSelected">14:00<input type="hidden" id="selectedTime" value="14"></span>');
															$('#screenList').append('<span class="timeSelected">17:00<input type="hidden" id="selectedTime" value="17"></span>');
															$('#screenList').append('<span class="timeSelected">20:00<input type="hidden" id="selectedTime" value="20"></span>');
															$('#screenList').append('<span class="timeSelected">23:00<input type="hidden" id="selectedTime" value="23"></span>');
															$('#screenList').append('</div>');
														} else {
															$('#screenList').append('<div class="screenSelected">'+screen[i].screenName+'<input type="hidden" id="selectedScreen" value="'+screen[i].screenNo+'">');
															$('#screenList').append('<input type="hidden" id="screenName" value="'+screen[i].screenName+'">')
															$('#screenList').append('<span class="timeSelected">08:00<input type="hidden" id="selectedTime" value="8"></span>');
															$('#screenList').append('<span class="timeSelected">11:00<input type="hidden" id="selectedTime" value="11"></span>');
															$('#screenList').append('<span class="timeSelected">14:00<input type="hidden" id="selectedTime" value="14"></span>');
															$('#screenList').append('<span class="timeSelected">17:00<input type="hidden" id="selectedTime" value="17"></span>');
															$('#screenList').append('<span class="timeSelected">20:00<input type="hidden" id="selectedTime" value="20"></span>');
															$('#screenList').append('<span class="timeSelected">23:00<input type="hidden" id="selectedTime" value="23"></span>');
															$('#screenList').append('</div>');
														}
													}
												}
												$('.timeSelected').click(function(){
													$('.timeSelected').attr('style', 'background-color:#fff; color:#333');
													$(this).attr('style', 'background-color:#333; color:#fff; border:2px solid #5c5c5c');
													var selectedScreen = $(this).parent().find('#selectedScreen').val();
													var selectedTime = $(this).children('#selectedTime').val();
													var screenName = $(this).parent().find('#screenName').val();
													var time = $(this).text();
													$('#resultTime').html('<span class="item">상영관 : <a>'+screenName+' &nbsp;'+time+'</a></span>');
													$.ajax({
														url : '${conPath}/booking.do',
														type : 'get',
														data : 'method=selectedAll&movieNo='+movieNo+'&screenNo='+selectedScreen+'&selectedDate='+selectedDate,
														success : function(screenup){
															var screenupNo = screenup.screenupNo;
															$('#btnArea').html('<div class="ui red button" id="btnNext" onclick="location=\'${conPath}/booking.do?method=insertForm2&movieNo='+movieNo+'&cinemaNo='+cinemaNo+'&seatStateDate='+selectedDate+'&screenNo='+selectedScreen+'&timeNo='+selectedTime+'&screenupNo='+screenupNo+'&cinemaName='+cinemaName+'&screenName='+screenName+'&time='+time+'\'">'+
															'<i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">좌석선택</span></div>');
														}
													});
												});
											}
										});
									});
								}
							});
						});
					}
				});
			});
			if(${not empty param.movieNo}){
				$('#movieNo${param.movieNo}').trigger('click');
			}
		});
	</script>
	<style>
		*{margin:0; padding:0;}
		#container{width:66%; height:600px; margin:0 auto; border:5px solid black; padding-left:0.9%;}
		#btnNext{
			padding:10px 25px 10px 0;
			border:3px solid darkgray;
			border-radius: 20px;
		}
		.white{color:white;}
		.bold{font-weight:bold;}
		#movieArea{background: url("${conPath}/img/movieSelect.PNG") no-repeat;}
		#cinemaArea{background: url("${conPath}/img/cinemaSelect.PNG") no-repeat;}
		#stepArea{background: url("${conPath}/img/step.PNG") no-repeat;}
		#resultArea{height:128px;}
		#movieSelect{width:29%; height:78%; display: inline-block; vertical-align:top;}
		#cinemaSelect{width:29%; height:78%; display: inline-block; vertical-align:top;}
		#dateSelect{width:10%; height:78%; display: inline-block; vertical-align:top;}
		#timeSelect{width:30%; height:78%; display: inline-block; vertical-align:top;}
		.title{height:25px; background-color: black; color:white; text-align: center; font-size: 1.5em;}
		.ui.secondary.inverted.segment{text-align:center; margin:0; background-color:#333333;}
		#movieList, #cinemaList, #dateList, #screenList{width:100%; height:100%; display: inline-block; vertical-align:top; overflow:auto;}
		#screenList{padding-left:2%;}
		.movieSelected, .cinemaSelected, .dateSelected, .timeSelected{margin:5px;}
		.movieSelected:hover, .cinemaSelected:hover, .dateSelected:hover, .timeSelected:hover{cursor:pointer;}
	</style>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			alert('로그인 후 이용가능합니다');
			location.href='${conPath}/member.do?method=loginForm';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<h1>영화예매</h1>
		<div id="movieSelect">
			<div class="ui secondary inverted segment bold">영화</div>
			<div id="movieList" class="ui middle aligned animated list">
			<c:forEach var="movie" items="${movieList }">
				<div class="movieSelected item" id="movieNo${movie.movieNo }">
					<c:if test="${movie.movieGrade eq '전체' }">
						<a class="ui green circular label">전체</a>
					</c:if>
					<c:if test="${movie.movieGrade eq '12세' }">
						<a class="ui blue circular label">12</a>
					</c:if>
					<c:if test="${movie.movieGrade eq '15세' }">
						<a class="ui orange circular label">15</a>
					</c:if>
					<c:if test="${movie.movieGrade eq '청소년 관람불가' }">
						<a class="ui red circular label">청불</a>
					</c:if>
					<span class="movieName">
						${movie.movieName }
					</span>
					<input type="hidden" id="movieNo" value="${movie.movieNo }">
					<input type="hidden" id="movieImage" value="${movie.movieImage }">
				</div>
			</c:forEach>
			</div>
		</div>
		<div id="cinemaSelect">
			<div class="ui secondary inverted segment bold">극장</div>
			<br>
			<div id="cinemaList">
			</div>
		</div>
		<div id="dateSelect">
			<div class="ui secondary inverted segment bold">날짜</div>
			<br>
			<div id="dateList">
			</div>
		</div>
		<div id="timeSelect">
			<div class="ui secondary inverted segment bold">시간</div>
			<br>
			<div id="screenList">
			</div>
		</div>
	</div>
	<div class="ui inverted vertical segment" id="resultArea">
		<div class="ui container">
			<div class="ui stackable inverted divided equal height stackable grid">
				<div class="three wide column" id="movieArea">
					<div class="ui inverted header" id="resultMovie">
						<br>
						<br>
						<br>
						<br>
						<br>
					</div>
				</div>
				<div class="four wide column" id="cinemaArea">
					<div class="ui inverted header" id="resultCinema">
					</div>
				</div>
				<div class="eight wide column" id="stepArea">
					<div class="ui right floated labeled button" id="btnArea">
						<div class="ui grey button" id="btnNext" onclick="alert('조건을 모두 선택하세요')">
							<i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">좌석선택</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>