<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/noticeList.css" rel="stylesheet">
<style>
</style>
</head>
<jsp:include page="../main/header.jsp" />
<body>

	<div class="notice_listWrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='notice.do?method=noticeList'">공 지
						사 항</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				</ul>
			</div>
		</div>

		<div class="notice_title">
			<h1>" M A C " 정보와 소식이 있는</h1>
		</div>

		<div id="content">
			<table>
				<caption>공지사항 게시판</caption>
				<tr>
					<td>번호</td>
					<td>공지제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<c:forEach var="noticeList" items="${noticeList }">
					<tr>
						<td>${noticeList.noticeNo }</td>

						<td class="fileimg"><a
							href="${conPath }/notice.do?method=detail&noticeNo=${noticeList.noticeNo}&pageNum=${paging.currentPage}">
								${noticeList.noticeTitle } <c:if
									test="${not empty noticeList.noticeFile}">
								 &nbsp; <img src="${conPath }/img/attachment_87543.png">
								</c:if>
						</a></td>


						<td>${noticeList.noticeDate }</td>
						<td>${noticeList.noticeReadCount }</td>
					</tr>
				</c:forEach>
				<tr>
					<c:if test="${not empty admin }">
						<td colspan="4"><input type="button" value="글작성"
							onclick="location='${conPath}/notice.do?method=writerForm'"></td>
					</c:if>
					
				</tr>
			</table>
		</div>


		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize}">
		[ <a
					href="${conPath }/notice.do?method=noticeList&pageNum=${paging.startPage-1 }">이전</a> ]
	</c:if>
			<c:forEach var="i" begin="${paging.startPage}"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<b>[ ${i } ]</b>
				</c:if>
				<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/notice.do?method=noticeList&pageNum=${i }">${i }</a> ]
		</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a
					href="${conPath }/notice.do?method=noticeList&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>