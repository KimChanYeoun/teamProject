<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/noticeWriterForm2.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script type="text/javascript" src="${conPath }/resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
<style>
	
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/notice.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="method" value="writer">
			<table>
				<tr><th>공지제목</th>
					<td><input type="text" name="noticeTitle" required="required" size="35"></td>
				</tr>
				<tr><th>공지이미지</th>
					<td><input type="file" name="tempNoticeFile"></td>
				</tr>
				<tr><th>공지내용</th>
					<td>
						<textarea id="popContent" name="noticeContent"></textarea>
						<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							    oAppRef: oEditors,
							    elPlaceHolder: "popContent",
							    sSkinURI: "${conPath}/resources/smartEditor/SmartEditor2Skin.html",
							    fCreator: "createSEditor2"
							});
							function submitContents(elClickedObj) {
							    // 에디터의 내용이 textarea에 적용됩니다.
							    oEditors.getById["popContent"].exec("UPDATE_CONTENTS_FIELD", []);
							    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
							 
							    try {
							        elClickedObj.form.submit();
							    } catch(e) {}
							}
							</script>
					</td>
				</tr>
				<tr><td colspan="2">
					<input type="submit" value="작성 완료" onclick="submitContents(this)">
					<input type="reset" value="다시 쓰기">
					<input type="reset" value="뒤로가기" onclick="history.back()">
				</td></tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>