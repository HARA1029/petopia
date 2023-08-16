<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/top.css" />

<body>
		<header id=header>
			<div class=container>
				<div>
				 	<a href="/petopia/user/main.jsp"><img class="topImg" src="../image/logo.png"></a>
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
	                        <b>관리자</b>님 안녕하세요.
	                       </td>
	                       &emsp;
	                       <td>
	                        <form action="customer_management.jsp" method="get">
	                            <button type="submit">고객관리</button>
	                        </form>
	                     </td>
	                     <td>
	                        <form action="order_management.jsp" method="get">
	                            <button type="submit">주문관리</button>
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
	                        <b><%= sessionName %></b>님 안녕하세요.                 
	                       </td>
	                       <td></td>
	                         <td>
	                        <form action="/petopia/mypage/myPage.jsp" method="get">
	                            <button type="submit">마이페이지</button>
	                        </form>
	                         </td>
	                         <td>
	                        <form action="cart.jsp" method="get">
	                            <button type="submit">장바구니</button>
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
				            }
				        } else {
				    %>
				    <!-- 로그인 전 -->
				    <div class="user">
	                   <table>
	                      <tr>
	                         <td>
	                          <form action="/petopia/user/login.jsp" method="get">
	                              <button type="submit">로그인</button>
	                          </form>
	                       </td>
	                       <td>
	                          <form action="/petopia/user/join.jsp" method="get">
	                              <button type="submit">회원가입</button>
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
				<a href="/petopia/user/main.jsp" >메인</a>&emsp;
				<a href="#" >상품목록</a> &emsp;
				<a href="/petopia/notice/notice.jsp" >공지사항</a> &emsp;
				<table>
	               <tr>
	                  <td>
	                     &emsp;<input id="search" type="search" placeholder="검색어를 입력해주세요"  >&emsp;
	                  </td>
	                  <td>
	                     <input id="search-btn" type="submit" value="search">
	                  </td>
	               </tr>
	            </table>
			</div>
		</nav>
