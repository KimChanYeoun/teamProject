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
			$('form').on('submit', function(){
				$(window).off('beforeunload');
				return true;
			});
			$('#usePoint').keyup(function(){
				$(this).val($(this).val().replace(/\D/g, ''));
			});
			$('#usePoint').blur(function(){
				var bookingPrice = ${param.bookingPrice };
				var memberPoint = ${member.memberPoint};
				if($(this).val()>bookingPrice && memberPoint>bookingPrice){
					alert('결제금액보다 많은 포인트는 사용하실 수 없습니다');
					$(this).val(bookingPrice);
				}
				if($(this).val()>memberPoint){
					alert('보유하신 포인트 이하의 금액을 입력하세요');
					$(this).val(memberPoint);
				}
				if($(this).val()==bookingPrice){
					$('#btnNext').addClass('red');
				} else {
					$('#btnNext').removeClass('red');
					$('#allUsePoint').prop('checked', false);
				}
				var discountPrice = $(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var resultPrice = (bookingPrice-$(this).val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('input[name=usePoint]').val($(this).val());
				$('input[name=resultPrice]').val(bookingPrice-$(this).val());
				$('#discount').text(discountPrice+' 원');
				$('#result').text(resultPrice+' 원');
			});
			$('#allUsePoint').change(function(){
				if($(this).is(':checked')){
					var bookingPrice = ${param.bookingPrice };
					var memberPoint = ${member.memberPoint};
					if(bookingPrice>memberPoint){
						$('#usePoint').val(memberPoint);
					} else {
						$('#usePoint').val(bookingPrice);
						$('#btnNext').addClass('red');
					}
					var discountPrice = $('#usePoint').val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var resultPrice = (bookingPrice-$('#usePoint').val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('input[name=usePoint]').val($('#usePoint').val());
					$('input[name=resultPrice]').val(bookingPrice-$('#usePoint').val());
					$('#discount').text(discountPrice+' 원');
					$('#result').text(resultPrice+' 원');
				} else {
					$('#usePoint').val('0');
					$('#btnNext').removeClass('red');
					var bookingPrice = ${param.bookingPrice };
					var discountPrice = $('#usePoint').val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var resultPrice = (bookingPrice-$('#usePoint').val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('input[name=usePoint]').val($('#usePoint').val());
					$('input[name=resultPrice]').val(bookingPrice);
					$('#discount').text(discountPrice+' 원');
					$('#result').text(resultPrice+' 원');
				}
			});
			$('#creditNumber1, #creditNumber2, #creditNumber3').keyup(function(){
				$(this).val($(this).val().replace(/\D/g, ''));
				if($(this).val().length==4){
					$(this).parent().next().next().find('input').val('');
					$(this).parent().next().next().find('input').focus();
				}
				if($(this).val().length!=4){
					$('#btnNext').removeClass('red');
				}
			});
			$('#creditNumber4').keyup(function(){
				$(this).val($(this).val().replace(/\D/g, ''));
				if($('#creditNumber1').val().length==4 && $('#creditNumber2').val().length==4 && $('#creditNumber3').val().length==4 && $('#creditNumber4').val().length==4){
					$('#btnNext').addClass('red');
				} else {
					$('#btnNext').removeClass('red');
				}
			});
			$('#btnNext').click(function(){
				$('#frm').submit();
			});
			$('#frm').submit(function(){
				var bookingPrice = ${param.bookingPrice};
				var usePoint = $('#usePoint').val();
				if(bookingPrice>usePoint){
					if($('#creditNumber1').val().length!=4){
						alert('올바른 카드번호를 입력하세요');
						$('#creditNumber1').focus();
						return false;
					}
					if($('#creditNumber2').val().length!=4){
						alert('올바른 카드번호를 입력하세요');
						$('#creditNumber2').focus();
						return false;
					}
					if($('#creditNumber3').val().length!=4){
						alert('올바른 카드번호를 입력하세요');
						$('#creditNumber3').focus();
						return false;
					}
					if($('#creditNumber4').val().length!=4){
						alert('올바른 카드번호를 입력하세요');
						$('#creditNumber4').focus();
						return false;
					}
				}
			});
		});
		$(window).on('beforeunload', function() {
			jQuery.ajaxSettings.traditional = true;
			var seatNo = new Array();
			<c:forEach var="sn" items="${seatNo}">
				seatNo.push('${sn}');
			</c:forEach>
		    $.ajax({
		    	url : '${conPath}/booking.do?method=cancelPayment',
				type : 'post',
				data : { 'seatNo' : seatNo, 'timeNo' : '${param.timeNo}' , 'screenNo' : '${param.screenNo}', 'seatStateDate' : '${param.seatStateDate}'}
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
		#container{width:66%; height:600px; margin:0 auto; border:5px solid black;}
		#btnNext{
			padding:10px 25px 10px 0;
			border:3px solid darkgray;
			border-radius: 20px;
		}
		.white{color:white;}
		.red{color:#bf2828;}
		.blue{color:#2185d0;}
		.brown{color:#a5673f;}
		.bold{font-size:1.5em; font-weight:bold;}
		.b{font-weight:bold;}
		.centerAlign{text-align:center;}
		.rightAlign{text-align:right;}
		.inputLine{line-height:38px;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="container">
		<h1>결제페이지</h1>
		<div class="ui grid">
			<div class="two wide column">
			</div>
			<div class="eight wide column ui form">
				<br><br>
				<span class="bold">◈ MAC 포인트</span>
				<br><br>
				<div id="payment">
					<div class="ui grid">
						<div class="four wide column inputLine">
							보유 포인트 &nbsp; <span class="brown b">${member.memberPoint }</span>
						</div>
						<div class="three wide column inputLine">
							사용할 포인트
						</div>
						<div class="five wide column">
							<input type="text" class="rightAlign" id="usePoint" maxlength="5" value="0">
						</div>
						<div class="four wide column inputLine">
							<div class="ui checkbox">
								<input type="checkbox" id="allUsePoint" class="hidden" name="allUsePoint">
								<label for="allUsePoint">모두사용</label>
							</div>
						</div>
					</div>
					<br><br><br>
					<span class="bold">카드번호</span>
					<br><br>
					<div class="four fields">
						<div class="field">
							<input type="text" id="creditNumber1" maxlength="4" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
						</div>
						<span class="bold inputLine">-</span>
						<div class="field">
							<input type="text" id="creditNumber2" maxlength="4" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
						</div>
						<span class="bold inputLine">-</span>
						<div class="field">
							<input type="text" id="creditNumber3" maxlength="4" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
						</div>
						<span class="bold inputLine">-</span>
						<div class="field">
							<input type="text" id="creditNumber4" maxlength="4" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
						</div>
					</div>
				</div>
			</div>
			<div class="two wide column">
			</div>
			<div class="three wide column">
				<div id="totPrice">
					<div class="ui attached message centerAlign bold">
						결제하실 금액
					</div>
					<div class="ui bottom attached black message rightAlign">
						<span class="bold white">
							<fmt:formatNumber value="${param.bookingPrice }" pattern="##,###"></fmt:formatNumber> 원
						</span>
					</div>
				</div>
				<br>
				<div id="discountPrice">
					<div class="ui attached message centerAlign bold">
						총 할인금액
					</div>
					<div class="ui bottom attached blue message rightAlign">
						<span id="discount" class="blue bold">
							0 원
						</span>
					</div>
				</div>
				<br>
				<div id="resultPrice">
					<div class="ui attached message centerAlign bold">
						남은 결제금액
					</div>
					<div class="ui bottom attached brown message rightAlign">
						<span id="result" class="bold brown">
							<fmt:formatNumber value="${param.bookingPrice }" pattern="##,###"></fmt:formatNumber> 원
						</span>
					</div>
				</div>
			</div>
			<form action="booking.do" id="frm" method="post">
				<input type="hidden" name="method" value="insert">
				<input type="hidden" name="memberId" value="${member.memberId }">
				<input type="hidden" name="memberGradeNo" value="${member.memberGradeNo }">
				<input type="hidden" name="screenupNo" value="${param.screenupNo }">
				<input type="hidden" name="timeNo" value="${param.timeNo }">
				<input type="hidden" name="bookingDate" value="${param.bookingDate }">
				<input type="hidden" name="bookingCount" value=${param.bookingCount }>
				<input type="hidden" name="bookingPrice" value="${param.bookingPrice }">
				<input type="hidden" name="screenNo" value="${param.screenNo }">
				<input type="hidden" name="seatStateDate" value="${param.seatStateDate }">
				<input type="hidden" name="usePoint" value="0">
				<input type="hidden" name="resultPrice" value="${param.bookingPrice }">
				<c:forEach var="sn" items="${seatNo }">
					<input type="hidden" name="seatNo" value="${sn }">
				</c:forEach>
			</form>
		</div>
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
							<span class="item">
								좌석 : 
								<span class="white">
									<c:forEach var="seat" items="${paramValues.seatNo }" varStatus="status"><c:if test="${status.first }">${seat }</c:if><c:if test="${not status.first }">, ${seat }</c:if></c:forEach>
								</span>
								<br><br><br>
								총금액 : 
								<span class="red">
									<fmt:formatNumber value="${param.bookingPrice }" pattern="##,###"></fmt:formatNumber>원
								</span>
							</span>
						</span>
					</div>
					<div class="ui right floated labeled button" id="btnArea">
						<div class="ui grey button" id="btnNext">
							<i class="huge arrow right inverted icon"></i><br><br>&nbsp; &nbsp; &nbsp; &nbsp; <span class="white">결제하기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>