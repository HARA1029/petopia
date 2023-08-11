<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<%@ include file="/layout/top.jsp" %>

	<div class="signup">
		<form name="loginForm" action="userConn.jsp" method="post">
			<div>
				이름 : <br>
				<input type="text" size = "16" name="userNAME"><br><br>
				
				아이디 : <br>
				<input type="text" size = "16" name="userID"><br><br>
			
				비밀번호 : <br> 
				<input type="password" size = "16" name="userPW"><br><br>
				
				이메일 : <br>
				<input type="email" size="30" name="userMAIL"><br><br>
				
				주소 : <br>
				<input type="text" size = "16" name="userADDR"><br><br>
				
				번호 : <br>
				<input type="text" size = "16" name="userTEL"><br><br>
				
				
			</div>
			<div>
				<input type="reset" value=" 다시작성 ">
				<input type="submit" value=" 가입하기 ">
			</div>
					
		</form>
	</div>

<%@ include file="../layout/bottom.jsp" %>
