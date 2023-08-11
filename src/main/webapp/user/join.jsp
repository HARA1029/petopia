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
		<form name="signupForm" action="controller.jsp" method="post">
			<div>
				<input type="hidden" name="action" value="signup">
			
				이름 : <br>
				<input type="text" size = "16" name="uname"><br><br>
				
				아이디 : <br>
				<input type="text" size = "16" name="id"><br><br>
			
				비밀번호 : <br> 
				<input type="password" size = "16" name="pw"><br><br>
				
				이메일 : <br>
				<input type="email" size="30" name="mail"><br><br>
				
				주소 : <br>
				<input type="text" size = "16" name="addr"><br><br>
				
				번호 : <br>
				<input type="text" size = "16" name="tel"><br><br>
				
				<input type="hidden" name="grade" value="C">
				
				
			</div>
			<div>
				<input type="reset" value=" 다시작성 ">
				<input type="submit" value=" 가입하기 ">
			</div>
					
		</form>
	</div>

<%@ include file="../layout/bottom.jsp" %>
