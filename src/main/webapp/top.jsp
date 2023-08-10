<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/top.css" />
<body>
		<header id=header>
			<div class=container>
				<div>
				 	<a href="main.jsp"><img src="logo.png"></a>
			 	</div>
			 
			 	<div>
					<form action="login.jsp" method="post">
						<input id="login" type="submit" value=" 로그인 "> &emsp;
					</form>
				</div>
				<div>
					<form action="join.jsp" method="post">
						<input id="join" type="submit" value=" 회원가입 ">
					</form>
				</div>
			</div>
		</header>
	
		<nav id=nav>
			<div class=container>
			<a href="main.jsp" >메인</a>&emsp;
			<a href="#" >상품목록</a> &emsp;
			<a href="#" >공지사항</a> &emsp;
			<input id="search" type="search" placeholder="검색해주세요"  >
			<input id="search-btn" type="submit" value="search">
			</div>
		</nav>
		
		
	