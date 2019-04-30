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
<link href="${conPath }/css/noticeWriterForm.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div class="notice_writeWrap">
		<div class="content_info">
			<div class="select">
				<ul>
					<li onclick="location.href='notice.do?method=noticeList'">공 지
						사 항</li>
					<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					<li>공 지 올 리 기</li>
				</ul>
			</div>
		</div>

		<div class="write_title">
			<h1>" M A C " 정보와 소식을 전합니다.</h1>
		</div>



		<div id="content">
			<form action="${conPath }/notice.do" method="post"
				enctype="multipart/form-data">
				
				<input type="hidden" name="method" value="writer">
				
				<table>
					<tr>
						<th>공지제목</th>
						<td><input type="text" name="noticeTitle" required="required"
							size="47.5"></td>
					</tr>
					<tr>
						<th>공지이미지</th>
						<td><input type="file" name="tempNoticeFile"></td>
					</tr>
					<tr>
						<th>공지내용</th>
						<td><textarea rows="20" cols="50" name="noticeContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" value="작성 완료">
						 <input	type="reset" value="다시 쓰기">
							 <input type="reset" value="뒤로가기" onclick="history.back()"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>