<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:if test="${result==1 }">
		<p id="idConfirm">중복된 ID입니다.<br> 사용불가<p>
	</c:if>
	<c:if test="${result==0 }">
		<p id="idConfirm">사용 가능한<br> ID입니다.</p>
	</c:if>
