<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 회원가입 </title>
	<link rel="stylesheet" href="../css/join.css">
</head>
<%@ include file="/layout/top.jsp" %>
	<section>
		<div class="signup">
			<form name="signupForm" action="controller.jsp" method="post" accept-charset="UTF-8">
				<div>
					<input type="hidden" name="action" value="signup">
					
					아이디 : <br>
					<input type="text" size = "16" name="id">
					<button type="button" id="checkId">아이디 중복 확인</button>
					<div id="idCheckResult" style="display: none;"></div>
					<br><br>
				
					비밀번호 : <br> 
					<input type="password" size = "16" name="pw" id="pw"><br><br>
					
					비밀번호 확인: <br> 
					<input type="password" size = "16" name="pw2" id="pw2">
					<div id="passwordMismatch" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</div>
					<br><br>
					
					이름 : <br>
					<input type="text" size = "16" name="uname"><br><br>
					
					이메일 : <br>
					<input type="text" name="mail1" class="email-input1"> @
					<input type="text" name="mail2" class="email-input2" >
					<select id="emailDomainSelect" name="emailDomain" onchange="changeEmailDomain(this)">
					    <option value="직접입력">직접입력</option>
					    <option value="google.com">google.com</option>
					    <option value="naver.com">naver.com</option>
					</select><br><br>
									
					주소 : <br>
					<input type="text" size ="16" name="addr"><br><br>
										
					번호 : <br>
					<select name="tel1">
					    <option value="010">010</option>
					    <option value="011">011</option>
					</select> -
					<input type="tel" pattern="[0-9]{3,4}" placeholder="3자리 or 4자리" name="tel2"> -
					<input type="tel" pattern="[0-9]{4}" placeholder="4자리" name="tel3"><br><br>
					
					<input type="hidden" name="grade" value="C">
					
				</div>
				<div>
					<input type="reset" value=" 다시작성 ">
					<input type="submit" value=" 가입하기 ">
				</div>
						
			</form>
		</div>
	</section>
	<script src="../js/join.js"></script>

<%@ include file="../layout/bottom.jsp" %>
