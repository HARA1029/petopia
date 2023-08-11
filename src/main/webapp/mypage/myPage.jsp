<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> myPage </title>
<link rel="stylesheet" href="../css/myPage.css" />

</head>
<%@ include file="../layout/top.jsp" %>

	<section>
		<div class="container">
			<div class="ment">
				
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String jdbc = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "petopia";
	String pw = "cat";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(jdbc, id, pw);
	
	String u_id = request.getParameter("id");
	String c_sql = "SELECT * FROM customer where id = ? ";
	pstmt = con.prepareStatement(c_sql);
	pstmt.setString(1, "gana");
	rs = pstmt.executeQuery();
	
	

	String name = null;
	String grade = null;
	
	
	while(rs.next()) {
		name = rs.getString("uname");
		grade = rs.getString("grade");
		String level="";
		if(grade.equals("C")) {
			level = "소형견";
		}else if(grade.equals("B")) {
			level = "중형견";
		} else if(grade.equals("A")) {
			level = "대형견";
		} else {
				level = "등급없음";			
	}
	
%>

	반가워요! <%= name %>님 고객님의 등급은 <%= level %>  입니다.
		
	<%
	}
	%>

		
			</div>
			
			<div class="list">
				  <a href="#">정보 수정</a> &emsp;
				 &emsp; <a href="myList.jsp">내가 쓴 글</a> &emsp;
				 &emsp; <a href="#">주문 내역</a> &emsp;
				 &emsp; <a href="#">회원 탈퇴</a> &emsp;
			</div>
		</div>
		
		<br><br>
		<div class="orderList"> <!-- 주문 목록 -->
		
			<font size=5> <b style = "padding-left: 80px;"> 주문 목록 </b></font>
			<br><br>			
    </div>
    
    <table id = o_table border="1" align="center">
    	<tr align="center">
    		<td width="200px"> 주문번호 </td>
    		<td width="200px"> 상품명 </td>
    		<td width="200px"> 주문날짜 </td>
    		<td width="200px"> 총 합계 </td>
   		</tr>
   		<%
	
				String o_sql = "select * from product_order";
				pstmt = con.prepareStatement(o_sql);
				rs = pstmt.executeQuery();
				
				int number;//주문번호
				String p_name = "";//상품명
				String date = "";//주문날짜
				String total = "";//총 합
				int count;
				
				
				while(rs.next()) {
					number = Integer.parseInt(rs.getString("ono"));
					p_name = rs.getString("title");
					date = rs.getString("date");//주문날짜
					total = rs.getString("total");//총 합
					count = Integer.parseInt(rs.getString("count")); // 상세테이블에서 가져올 것 
			%>
   		
   		<tr>
   			<td><%=number %></td>
   			<td><%=p_name %> + "외 " + <%=count %> + "건"</td>
   			<td><%=date %></td>
   			<td><%=total %></td>
 			</tr>
 			
 			<%
   			}
 			%>
    </table>
    
    	<br><br>
		<div class="cart"> <!-- 장바구니  -->
		
			<font size=5> <b style = "padding-left: 80px;"> 장바구니 </b></font>
			<br><br>			
    </div>
    
    <table id = o_table border="1" align="center">
    	<tr align="center">
    		<td width="200px"> 이미지 </td>
    		<td width="200px"> 상품명 </td>
   			<td width="200px"> 가격 </td>
    		<td width="200px"> 수량 </td>
    		<td width="200px"> 총 합계 </td>
   			<td width="200px"> 선택 </td>
   		</tr>
   		<%
	
				/* String _sql = "select * from product_order";
				pstmt = con.prepareStatement(o_sql);
				rs = pstmt.executeQuery();
				
				int number;//주문번호
				String p_name = "";//상품명
				String date = "";//주문날짜
				String total = "";//총 합
				int count;
				
				
				while(rs.next()) {
					number = Integer.parseInt(rs.getString("ono"));
					p_name = rs.getString("title");
					date = rs.getString("date");//주문날짜
					total = rs.getString("total");//총 합
					count = Integer.parseInt(rs.getString("count")); // 상세테이블에서 가져올 것  */
			%>
   		
   		<%-- <tr>
   			<td><%=number %></td>
   			<td><%=p_name %> + "외 " + <%=count %> + "건"</td>
   			<td><%=date %></td>
   			<td><%=total %></td>
 			</tr> --%>
 			
 			<%
   		/* 	} */
 			%>
    </table>
    <%
    	rs.close();
    	pstmt.close();
    	con.close();
    %>
	</section>
<%@ include file="../layout/bottom.jsp"%>