<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 정보수정 </title>
	<link rel="stylesheet" href="../css/edit.css">
</head>
	<script src="../js/edit.js"></script>
<%@ include file="/layout/top.jsp" %>
<%@ include file="/layout/nav.jsp" %>
<section>
	<div class="edit">
		<form name="editForm" action="controller.jsp" method="post" accept-charset="UTF-8" >
			<div>
				<input type="hidden" name="action" value="edit">
				 <%
				 		String sessionMail = (String) session.getAttribute("userMail");
				 		String sessionAddr = (String) session.getAttribute("userAddr");
            String sessionTel = (String) session.getAttribute("userTel");
           
                // 가져온 정보를 폼에 출력
            %>
				아이디 : <b>아이디 변경 불가</b> <br>
				<input type="text" size = "16" name="id"  value="<%= sessionID %>" onclick="editId();"readonly>
				<!-- 기존 정보 불러오기 -->
           
				<br><br>
			
				비밀번호 : <br> 
				<input type="password" size = "16" name="pw"><br><br>
			
				이름 : <b>개명시에만 변경 가능</b><br>
				<input type="text" size = "16" name="uname" value="<%= sessionName %>" onclick="editName()" readonly><br><br>
				
				이메일 : <br>
				<input type="email" size="30" name="mail" value="<%= sessionMail %>"><br><br>
				
				주소 : <br>
				<input type="text" size = "16" name="addr" value="<%= sessionAddr %>"><br><br>
				
				번호 : <br>
				<input type="text" size = "16" name="tel"  value="<%= sessionTel %>"><br><br>
				
				등급 :  <b>등급 변경 불가</b> <br>
				<input type="text" name="grade"  value="<%= sessionGrade %>" onclick="editGrade()" readonly ><br><br>
				
			</div>
			<div class="editButton">
				<input type="reset" value=" 다시작성 ">
				<input type="submit" value=" 수정하기 " onclick="checkAndUpdate();">
			</div>
		</form>
	</div>
</section>	
<%@ include file="../layout/bottom.jsp" %>