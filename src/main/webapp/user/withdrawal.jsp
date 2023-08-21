<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<link rel="stylesheet" href="../css/withdrawal.css" />
</head>
<script src="../js/withdrawal.js"></script>
<%@ include file="/layout/top.jsp"%>
<%@ include file="/layout/nav.jsp"%>
<div class="withdrawal">
	<form name="withdrawalForm" action="controller.jsp" method="post">
		<div>
			<input type="hidden" name="action" value="withdrawal"> 
			아이디 :
			<br> <input type="text" size="16" name="userID"><br>
			<br> 
			비밀번호 : <br> <input type="password" size="16" name="userPW"><br>
			<br>
			<div class="button-container">
				<button class="withdrawal-button" onclick="withdrawal(event)">탈퇴하기</button>
				<button class="mainpage-button" onclick="/petopia/user/main.jsp">메인화면</button>
			</div>
		</div>
	</form>
</div>

<%@ include file="/layout/bottom.jsp"%>