<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="../css/login.css">
</head>

<%@ include file="/layout/top.jsp" %>
	
	<div class="login">
		<form name="loginForm" action="controller.jsp" method="post">
			<div>
				<input type="hidden" name="action" value="login">
				
				아이디 : <br>
				<input type="text" size = "16" name="userID"><br><br>
			
				비밀번호 : <br> 
				<input type="password" size = "16" name="userPW"><br><br>				
				
			</div>
			<div>
				<input type="submit" value=" 로그인 ">
			</div>
					
		</form>
	</div>
	
<%@ include file="../layout/bottom.jsp" %>