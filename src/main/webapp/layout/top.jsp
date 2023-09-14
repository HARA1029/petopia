<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/petopia/css/top.css" />
<script src="/petopia/js/top.js"></script>
<body>
		<header id=header>
			<div class=container>
				<div>
				 	<a href="/petopia/user/main.jsp"><img class="topImg" src="/petopia/image/logo.png"></a>
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
				    	<table>
				        <tr>
				        	<td>
				            <b><%=sessionName%></b> 님 안녕하세요.
				        	</td>
				        	&emsp;
				        	<td>
					            <form action="/petopia/admin/customerManagement.jsp" method="get">
					                <button type="submit">고객관리</button>
					            </form>
			            	</td>
			            	<td>
					            <form action="#" method="get">
					                <button type="submit">주문관리</button>
					            </form>
					       </td>
					       <td>
					            <form action="/petopia/admin/reviewManagement.jsp" method="get">
					                <button type="submit">리뷰관리</button>
					            </form>
					       </td>
				            <td>
					            <form action="/petopia/user/controller.jsp" method="get">
					                <input type="hidden" name="action" value="logout">
					                <button type="submit">로그아웃</button>
					            </form>
				            </td>
				        </tr>
				        </table>
				    </div>
				    <%
				            } else {
				    %>
				    <!-- 일반 사용자 로그인 후 -->
				   <div class="user">
					    <table>
					        <tr>
					            <td class="name"> 
					                <b><%= sessionName %></b> 님 안녕하세요.			        
					            </td>
					            <td></td>
					            <td>
					                <form action="/petopia/mypage/myPage.jsp" method="get">
					                    <button type="submit" class="user-button" >마이페이지</button>
					                </form>
					            </td>
					            <td>
					                <form action="cart.jsp" method="get">
					                    <button type="submit" class="user-button">장바구니</button>
					                </form>
					            </td>
					            <td>
					                <form id="logoutForm" action="/petopia/user/controller.jsp?action=logout" method="get">
					                    <!--<input type="hidden" name="action" value="logout">-->
					                    <button type="submit" class="user-button">로그아웃</button>
					                </form>
					            </td>
					        </tr>
					    </table>
					</div>

				    <%
				            }
				        } else {
				    %>
				    <!-- 로그인 전 -->
				    <div class="user">
				    	<table>
				    		<tr>
				    			<td>
						        <form action="/petopia/user/login.jsp" method="get">
						            <button type="submit" onclick="setActiveLink(this)">로그인</button>
						        </form>
				        	</td>
				        	<td>
						        <form action="/petopia/user/join.jsp" method="get">
						            <button type="submit" onclick="setActiveLink(this)">회원가입</button>
						        </form>
						        </td>
					        </tr>
			        </table>
				    </div>
				    <%
				        }
				    %>
				</div>		 	
	        </div>
		</header>
		
		<nav id=nav>
			<div class=container>
				<a href="/petopia/user/main.jsp" onclick="setActiveLink(this)">메인</a>&emsp;
			    <a href="/petopia/Controller/ManagerController.jsp?Submit=pList&cateno=0&id=<%=sessionID%>">상품목록</a> &emsp;
			    <a href="/petopia/notice/notice.jsp" onclick="setActiveLink(this)">공지사항</a>
				<form action="/petopia/Controller/ManagerController.jsp">
					<table>
				<tr>
				   <td>
					  &emsp;<input id="search" type="search" placeholder="검색어를 입력해주세요"  name="pname" style="color:black;">&emsp;
				   </td>
				   <td>
					  <input id="search-btn" type="submit" name="Submit" value="search">
				   </td>
				</tr>
			 </table>
			 </form>
				</div>
			</nav>
			<main>