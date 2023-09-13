<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../user/dbConn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet" href="../css/myPage.css" />

</head>
<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/nav.jsp"%>
	
	<br>
	<br>
	<div class="orderList">
		<!-- 주문 목록 -->
		<h1> 주문 목록 </h1>
		
	</div>

	<table class="orderTable">
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>주문날짜</th>
                <th>총 합계</th>
            </tr>
		<%
		
   			sessionID = (String) session.getAttribute("userID");
        String o_sql = "SELECT o.ono, o.uno, o.title, o.total, o.orderdate FROM product_order o" 
   										+ " WHERE o.uno = (SELECT uno FROM customer WHERE id = ?)";
       	pstmt = conn.prepareStatement(o_sql);
        pstmt.setString(1, sessionID);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            int number = rs.getInt("ono");
            int uno = rs.getInt("uno");
            String title = rs.getString("title");
            int total = rs.getInt("total");
            String orderdate = rs.getString("orderdate");
    %>
     <tr>
         <td class="td_1"><%= number %></td>
         <td class="td_2"><%= title %></td>
         <td class="td_3"><%= orderdate %></td>
         <td class="td_4"><%= total %></td>
     </tr>

		<%
        }
    %>
	</table>

	<br>
	<br>
	<div class="cart">
		<!-- 장바구니  -->
		<h1> 장바구니 </h1>
	</div>

	<table class="cartTable">
            <tr>
                <th>이미지</th>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>총 합계</th>
                <th>선택</th>
            </tr>
		<%
        
        try {
        	String cart_sql = "SELECT c.cno, p.pname, p.price, c.count, (p.price * c.count) " +
                    "AS total FROM cart c JOIN product p ON c.pno = p.pno " +
                    "WHERE c.uno = (SELECT uno FROM customer WHERE id = ?)";
			    pstmt = conn.prepareStatement(cart_sql);
			    pstmt.setString(1, sessionID);
			    rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int cart_num = rs.getInt("cno");
                String pro_name = rs.getString("pname");
                int price = rs.getInt("price");
                int cart_count = rs.getInt("count");
                int cart_total = rs.getInt("total");
        %>
        
     <tr>
         <td class="ctd_1"><!-- 이미지 출력 (필요 시 추가) --></td>
         <td class="ctd_2"><%= pro_name %></td>
         <td class="ctd_3"><%= price %></td>
         <td class="ctd_4"><%= cart_count %></td>
         <td class="ctd_5"><%= cart_total %></td>
         <td class="ctd_6">
	         <button type="button">수정</button>
					 <button type="button">삭제</button>
         </td>
     </tr>
		<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
        %>
	</table>

<%@ include file="../layout/bottom.jsp"%>