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
		<div class="signup">
			<form name="signupForm" action="/petopia/Controller/controller.jsp" method="post" accept-charset="UTF-8">
				<div>
					<input type="hidden" name="action" value="signup">
					
					아이디 : <br>
					<input type="text" name="id">
					<button type="button" id="checkId">아이디 중복 확인</button>
					<div id="idCheckResult" style="display: none;"></div>
					<br><br>
				
					비밀번호 : <br> 
					<input type="password" id="pw" name="pw" ><br><br>
					
					비밀번호 확인: <br> 
					<input type="password" id="pw2" name="pw2">
					<div id="passwordMismatch" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</div>
					<br><br>
					
					이름 : <br>
					<input type="text" name="uname"><br><br>
					
					이메일 : <br>
					<input type="text" name="mail1" class="mail1"> @
					<input type="text" name="mail2" class="mail2" >
					<select id="emailDomainSelect" name="emailDomain" onchange="changeEmailDomain(this)">
					    <option value="직접입력">직접입력</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="naver.com">naver.com</option>
					</select><br><br>
									
					주소 : <br>
					<input type="text" placeholder ="우편번호" id="zipcode" name="zipcode" class="zipcode">
					<input type="button" onclick="click_searchAddress()" value="주소 찾기"><br>
					<input type="text" placeholder ="주소 찾기 버튼 클릭" id="addr1" name="addr1" >
					<input type="text" placeholder ="상세주소를 입력해주세요" id="addr2" name="addr2"><br><br>
										
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
	<script src="../js/join.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 API -->

<%@ include file="../layout/bottom.jsp" %>
