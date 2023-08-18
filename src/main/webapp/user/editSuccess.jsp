<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 회원 수정 완료 </title>
	<link rel="stylesheet" href="../css/editSuccess.css">
</head>
<%@ include file="/layout/top.jsp" %>
<%@ include file="/layout/nav.jsp" %>
<%@ include file="/user/controller.jsp" %>

<section>
	<div class="congratulations">
	    <p>회원수정이 성공적으로 완료되었습니다.</p>
	</div>
<form name="editForm" action="controller.jsp" method="post" accept-charset="UTF-8">
			<div>
				<input type="hidden" name="action" value="edit">
				 <%
				 		String sessionMail = (String) session.getAttribute("userMail");
				 		String sessionAddr = (String) session.getAttribute("userAddr");
            String sessionTel = (String) session.getAttribute("userTel");
           
                // 가져온 정보를 폼에 출력
            %>

			<div class="user-information">
			    <h3>저장된 회원 정보</h3>
			    <p>이름: <%= sessionName %></p>
			    <p>아이디: <%= sessionID %></p>
			    <p>이메일: <%= sessionMail %></p>
			    <p>주소: <%= sessionAddr %></p>
			    <p>전화번호: <%= sessionTel %></p>
			    <p>등급: <%= sessionGrade %></p>
			</div>
			</div>
	</form>
		<div class="button-container">
	    <button class="mainpage-button" onclick="goMain()">메인 화면</button>
    </div>
    <script src="../js/function.js"></script>


    <script src="../js/function.js"></script>
</section>
<%@ include file="../layout/bottom.jsp" %>