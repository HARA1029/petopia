<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 - 정보 확인</title>
<link rel="stylesheet" href="../css/editConfirm.css" />
</head>
<script src="../js/editConfirm.js"></script>
<%@ include file="/layout/top.jsp"%>
<%@ include file="/layout/nav.jsp"%>
<div class="editConfirm">
	<form name="editConfirmForm" action="controller.jsp" method="post">
		<div>
			<!-- 아이디를 hidden 필드로 설정 -->
			<input type="hidden" name="action" value="editConfirm"> <input
				type="hidden" name="userID"
				value="<%=session.getAttribute("userID")%>"> <br>
			비밀번호를 입력하세요: <br>
			<br> <input type="password" size="16" name="userPW"><br>
			<br>
			<div class="button-container">
				<button type="button" class="editConfirm-button" onclick="editconfirm()">확인</button>
			</div>
		</div>
	</form>
</div>

<%@ include file="/layout/bottom.jsp"%>