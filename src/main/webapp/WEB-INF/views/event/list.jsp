<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/event_list.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script>
	$(document).ready(function(){
		
	});
</script> -->
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="event_wrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='item.do?method=list'">E V E N T</li>
				</ul>
			</div>
		</div>

		<div class="event_title">
			<h1>영화만큼 즐거운 " E V E N T "</h1>
		</div>
		<div class="content_wrap">
			<div class="content_submit">
				<p>전체 이벤트가 ${paging.total } 건이 있습니다.</p>
				<p>
					<c:if test="${not empty admin }">
						<input type="button" value="이벤트 글등록" class="bt1"
							onclick="location='${conPath }/event.do?method=writeForm'">
					</c:if>
				</p>
			</div>

			<div class="content">
				<c:forEach var="event" items="${list }">
					<table class="table2">
						<tr>
							<td><a
								href="${conPath }/event.do?method=detail&eventNo=${event.eventNo}
											&pageNum=${paging.currentPage}">
									<img src="${conPath }/eventImgFileUpload/${event.eventFile }">
							</a><br> ${event.eventTitle }<br> 이벤트 기간 <br>
								${event.eventDate }<br></td>

						</tr>
					</table>
				</c:forEach>

			</div>
		</div>
		<div class="paging">
			<c:if test="${paging.startPage>paging.blockSize}">
		[ <a
					href="${conPath }/event.do?method=list&pageNum=${paging.startPage+1 }">이전</a> ]
	</c:if>
			<c:forEach var="i" begin="${paging.startPage}"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<b>[ ${i } ]</b>
				</c:if>
				<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/event.do?method=list&pageNum=${i }">${i }</a> ]
		</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a
					href="${conPath }/event.do?method=list&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>