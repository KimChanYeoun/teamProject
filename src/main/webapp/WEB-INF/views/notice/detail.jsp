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
<link href="${conPath }/css/noticeDetial.css" rel="stylesheet">
<style>
</style>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="notice_listdetail">


		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='notice.do?method=noticeList'">공 지
						사 항</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>NO.${detail.noticeNo}</li>
				</ul>
			</div>
		</div>

		<div class="detail_title">
			<h1>" M A C 이야기 "</h1>
			<br>
			<h4>&nbsp;&nbsp;MAC의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</h4>
		</div>



		<div id="content">
			<table>
				<caption>
					<br>
				</caption>
				<tr>
					<td>공지사항</td>
					<td>${detail.noticeTitle }</td>
					<td>작성일</td>
					<td>${detail.noticeDate }</td>
					<td>조회수</td>
					<td>${detail.noticeReadCount }</td>
				</tr>
				<tr>
					<c:if test="${not empty detail.noticeFile}">

						<td colspan="6" class="imgInfo"><img
							src="${conPath }/noticeImg/${detail.noticeFile }"></td>
					</c:if>
				</tr>
				<tr>
					<td colspan="6">${detail.noticeContent }</td>
				</tr>
				<tr>
					<td colspan="6"><c:if test="${not empty admin }">
							<button
								onclick="location='notice.do?method=modifyForm&noticeNo=${detail.noticeNo}&pageNum=${param.pageNum}'">수정</button>
							<button
								onclick="location='notice.do?method=delete&noticeNo=${detail.noticeNo}&pageNum=${param.pageNum}'">삭제</button>
						</c:if>
						<button
							onclick="location='notice.do?method=noticeList&pageNum=${param.pageNum}'">목록</button>
					</td>
			</table>



			<table>
				<tr class="line_sup_prev">
					<td class="stit">다음글</td>
					<c:if test="${not empty detailNext }">
						<td class="name"><a
							href="${conPath }/notice.do?method=detail&noticeNo=${detailNext.noticeNo}&pageNum=${param.pageNum}"
							class="txt">${detailNext.noticeTitle } <c:if
									test="${not empty detailNext.noticeFile }">
					&nbsp; <img src="${conPath }/img/attachment_87543.png">
								</c:if></a></td>
						<td class="check_writ_area">작성일</td>
						<td class="check_num">${detailNext.noticeDate }</td>
					</c:if>
					<c:if test="${empty detailNext }">
						<td>다음 글이 없습니다</td>
					</c:if>
				</tr>
				<tr class="line_sup_next">
					<td class="stit">이전글</td>
					<c:if test="${not empty detailBefore }">
						<td class="name"><a
							href="${conPath }/notice.do?method=detail&noticeNo=${detailBefore.noticeNo}&pageNum=${param.pageNum}"
							class="txt">${detailBefore.noticeTitle }<c:if
									test="${not empty detailBefore.noticeFile }">
					&nbsp; <img src="${conPath }/img/attachment_87543.png">
								</c:if></a></td>
						<td class="check_writ_area">작성일</td>
						<td class="check_num">${detailBefore.noticeDate }</td>
					</c:if>
					<c:if test="${empty detailBefore }">
						<td>이전 글이 없습니다</td>
					</c:if>
				</tr>
			</table>


		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>