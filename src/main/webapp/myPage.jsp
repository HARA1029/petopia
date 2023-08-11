<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> myPage </title>
<link rel="stylesheet" href="./css/myPage.css" />
</head>
<%@ include file="top.jsp" %>
<%
	String name = request.getParameter("uname");
	/* int grade = request.getParameter("grade");
	
	if ( grade == 1) {
		out.println("소형견");
	}else if ( grade == 2 ) {
		out.println("중형견");
	} else {
		out.println("대형견");
	} */
%>
	<section>
		<div class="container">
			<div class="ment">
					반가워요! <%= name %>님 고객님의 등급은      입니다.
			</div>
			<div class="list">
				  <a href="#">정보 수정</a> &emsp;
				 &emsp; <a href="myList.jsp">내가 쓴 글</a> &emsp;
				 &emsp; <a href="#">주문 내역</a> &emsp;
				 &emsp; <a href="#">회원 탈퇴</a> &emsp;
			</div>
		</div>
		<div class="orderList">
			<%--  <% if(connect == true) { %>
      <h3>연결되었습니다.</h3>
   <% } else { %>
      <h3>연결에 실패했습니다.</h3>
   <% } %> --%>
   </div>
		<div class="cart">
			장바구니
		</div>
	</section>
<%@ include file="bottom.jsp"%>