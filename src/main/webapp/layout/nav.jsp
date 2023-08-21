<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/nav.css" >
<script src="../js/nav.js"></script>
<div class="container">

		    <%
		        String sessionName = (String) session.getAttribute("userName");
		        String sessionGrade = (String) session.getAttribute("userGrade");
		        String level = "";
		
		        if (sessionGrade != null && !sessionGrade.isEmpty() && !sessionName.equals("관리자")) {
		
		            if(sessionGrade.equals("C")) {
		                level = "소형견";
		            } else if(sessionGrade.equals("B")) {
		                level = "중형견";
		            } else if(sessionGrade.equals("A")) {
		                level = "대형견";
		            } else {
		                level = "등급없음";         
		            }
		
		    %>
		    <div class="ment">
		       &emsp; 반가워요! <b><%= sessionName %></b> 님 고객님의 등급은 <b><%= level %></b>  입니다. &emsp;
		    </div>
		
		    <%
		       }
		        if (sessionGrade != null && !sessionGrade.isEmpty()) {
		    %>
		    
		    
		   <div class="list">
			    &emsp;<a href="/petopia/user/edit.jsp" onclick="setActiveLink(this)">정보 수정</a> &emsp; &emsp; 
			    <a href="/petopia/mypage/myList.jsp"onclick="setActiveLink(this)">내가 쓴 글</a> &emsp; &emsp; 
			    <a href="#" onclick="setActiveLink(this)">주문 내역</a> &emsp; &emsp; 
			    <a href="/petopia/user/withdrawal.jsp"onclick="setActiveLink(this)">회원 탈퇴</a> &emsp;
			</div>
		    <%
		        }
		    %>
		</div>
