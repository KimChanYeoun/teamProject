<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/noticeModifyForm.css" rel="stylesheet">
<style>
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<jsp:include page="../main/header.jsp" />
<body>
	<div class="notice_writeWrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='notice.do?method=noticeList'">공 지
						사 항</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>N O .${detail.noticeNo }</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>수정</li>
				</ul>
			</div>
		</div>



		<div id="content">
			<form action="${conPath }/notice.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="method" value="modify"> <input
					type="hidden" name="pageNum" value="${param.pageNum }"> <input
					type="hidden" name="noticeNo" value="${detail.noticeNo }">
				<table>
					<caption>${detail.noticeNo }번 &nbsp;공지&nbsp;수정하기</caption>
					<tr>
						<th>공지제목</th>
						<td><input type="text" name="noticeTitle"
							value="${detail.noticeTitle }" size="47.5"></td>
					</tr>
					<tr>
						<th>공지이미지</th>
						<td><input type="file" name="noticeFile">${detail.noticeFile }</td>
					</tr>
					<tr>
						<th>공지본문</th>
						<td><textarea rows="20" cols="50" name="noticeContent">${detail.noticeContent}</textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="저장"> <input
							type="button" value="목록"
							onclick="location='notice.do?method=noticeList&pageNum=${param.pageNum}'">
				</table>
			</form>
		</div>
	</div>

</body>
<jsp:include page="../main/footer.jsp" />
</html>