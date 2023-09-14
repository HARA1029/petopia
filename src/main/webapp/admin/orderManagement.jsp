<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Controller/dbConn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<link rel="stylesheet" href="../css/orderManagement.css" />
</head>

<%@ include file="/layout/top.jsp"%>
<h1>주문 관리</h1>

<div>
	<table class="orderTable" border="1">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 합계</th>
			<th>주문날짜</th>
			<th>상태</th>
			<th>선택</th>
		</tr>
		<%
	            String sql = "SELECT * FROM product_order";
	       
	           if (connect) {
	               pstmt = conn.prepareStatement(sql);
	               rs = pstmt.executeQuery();
	
	               while (rs.next()) {
	                   int orderNumber = rs.getInt("ono");
	                   String productName = rs.getString("title");
	                   String orderDate = rs.getString("orderdate");
	                   String totalAmount = rs.getString("total");
	                   String state = rs.getString("state");
            %>
		<tr>
			<td class="td_1"><%= orderNumber %></td>
			<td class="td_2"><%= productName %></td>
			<td class="td_3"><%= totalAmount %></td>
			<td class="td_4"><%= orderDate %></td>
			<td class="td_5">
				<% 
				    if (state.equals("0")) {
				        out.println("결제완료");
				    } else if (state.equals("1")) {
				        out.println("배송완료");
				    }
			    %>
			</td>
			<td class="td_6">
			    <form action="/petopia/Controller/controller.jsp" method="post">
				    <input type="hidden" name="action" value="updateOrderStatus">
				    <input type="hidden" name="orderNumber" value="<%= orderNumber %>">
				    <input type="radio" name="newStatus" value="0" <%= state.equals("0") ? "checked" : "" %> onchange="this.form.submit()"> 결제완료
				    <input type="radio" name="newStatus" value="1" <%= state.equals("1") ? "checked" : "" %> onchange="this.form.submit()"> 배송완료
				</form>
			</td>

		</tr>
		<%
                    }
                } else {
            %>
		<tr>
			<td colspan="5">데이터베이스 연결에 실패했습니다.</td>
		</tr>
		<%
                }
            %>
	</table>
</div>
<%@ include file="../layout/bottom.jsp"%>