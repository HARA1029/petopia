<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>

<!-- OrderInfo.css -->
<link rel="stylesheet" type="text/css" href="../css/OrderInfo.css">

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>
<!-- nav -->
<%@ include file="../layout/nav.jsp" %>

<div class="OrderInfo-container">
	<h2 style="text-align : center">주문 내역</h2>
	
	<table class="orderInfo-table">
		
		<tr class="title-tr">
			<th>주문번호</th>
			<th>구매내역</th>
			<th>총 주문금액</th>
			<th>주문일</th>
			<th>주문상태</th>
			<th>배송메시지</th>
			<th>주문상세내역</th>
		</tr>
		
		<c:if test="${not empty orderList}">
		<c:forEach items="${orderList}" var="orderList">
			
			<tr class="content-tr">
				<td>${orderList.ono}</td>
				<td>${orderList.title}</td>
				<td><fmt:formatNumber value="${orderList.total}" type="number" pattern="###,###,###원"/></td>
				<td>${orderList.orderdate}</td>
				<td>${orderList.state == 0 ? "결제완료" : "배송완료"}</td>
				<td>${orderList.message}</td>
				<td>
					<form action="../Controller/UserController.jsp" method="post">
						<input type="hidden" name="ono" value="${orderList.ono}"/>
						<input type="hidden" name="Submit" value="OrderDetailInfo"/>
						<button id="odBtn" type="submit">상세내역</button>
					</form>
				</td>
			</tr>
			
		</c:forEach>
		</c:if>
		
		<c:if test="${empty orderList}">
			<tr class="content-tr">
				<td colspan="6" style="text-align: center;">주문내역이 없습니다..</td>
			</tr>
		</c:if>
		
	</table>

</div>

<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>
</html>