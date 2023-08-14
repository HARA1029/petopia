<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/top.css" />

<body>
		<header id=header>
			<div class=container>
				<div>
				 	<a href="main.jsp"><img src="../image/logo.png"></a>
			 	</div>
			 	<div class="user-info">
				    <%
				        String sessionID = (String) session.getAttribute("userID");
				        if (sessionID != null && !sessionID.isEmpty()) {
				            String sessionName = (String) session.getAttribute("userName");
				            if (sessionID.equals("kosa")) {
				    %>
				    <!-- 관리자 로그인 후 -->
				    <div class="user">
				        <div>
				            <p>관리자님 안녕하세요</p>
				        </div>
				        <div>
				            <form action="customer_management.jsp" method="get">
				                <button type="submit">고객관리</button>
				            </form>
				            <form action="order_management.jsp" method="get">
				                <button type="submit">주문관리</button>
				            </form>
				            <form action="controller.jsp" method="get">
				                <input type="hidden" name="action" value="logout">
				                <button type="submit">로그아웃</button>
				            </form>
				        </div>
				    </div>
				    <%
				            } else {
				    %>
				    <!-- 일반 사용자 로그인 후 -->
				    <div class="user">
				        <div>
				            <p><%= sessionName %>님 안녕하세요</p>
				        </div>
				        <div>
				            <form action="mypage.jsp" method="get">
				                <button type="submit">마이페이지</button>
				            </form>
				            <form action="cart.jsp" method="get">
				                <button type="submit">장바구니</button>
				            </form>
				            <form action="controller.jsp" method="get">
				                <input type="hidden" name="action" value="logout">
				                <button type="submit">로그아웃</button>
				            </form>
				        </div>
				    </div>
				    <%
				            }
				        } else {
				    %>
				    <!-- 로그인 전 -->
				    <div class="user">
				        <form action="login.jsp" method="get">
				            <button type="submit">로그인</button>
				        </form>
				        <form action="join.jsp" method="get">
				            <button type="submit">회원가입</button>
				        </form>
				    </div>
				    <%
				        }
				    %>
				</div>		 	
	        </div>
		</header>
	
		<nav id=nav>
			<div class=container>
				<a href="main.jsp" >메인</a>&emsp;
				<a href="#" >상품목록</a> &emsp;
				<a href="notice.jsp" >공지사항</a> &emsp;
				<input id="search" type="search" placeholder="검색해주세요"  >
				<input id="search-btn" type="submit" value="search">
			</div>
		</nav>

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
		        반가워요! <%= sessionName %>님 고객님의 등급은 <%= level %>  입니다
		    </div>
		
		    <%
		       }
		        if (sessionGrade != null && !sessionGrade.isEmpty()) {
		    %>
		    <div class="list">
		        <b> <a href="edit.jsp">정보 수정</a></b> &emsp; &emsp; 
		          	<a href="../mypage/myList.jsp">내가 쓴 글</a> &emsp; &emsp; 
		        	<a href="#">주문 내역</a> &emsp; &emsp; 
		        	<a href="#">회원 탈퇴</a> &emsp;
		    </div>
		    <%
		        }
		    %>
		</div>