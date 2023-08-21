<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 회원탈퇴 </title>
	<link rel="stylesheet" href="../css/withdrawalSuccess.css">
</head>
<%@ include file="/layout/top.jsp" %>

	<div class="congratulations">
	    <p><b>회원탈퇴가 성공적으로 완료되었습니다.</b></p>
	</div>

	<div class="button-container">
	    <button class="mainpage-button" onclick="goMain()">메인화면</button>
  </div>
<script src="../js/function.js"></script>

<%@ include file="../layout/bottom.jsp" %>