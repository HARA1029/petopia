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

<title>주문페이지</title>

<!-- order_view.css -->
<link rel="stylesheet" type="text/css" href="../css/Order.css">

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>

<h1 id="order-title">ORDER</h1>

<form id="orderForm" action="../Controller/UserController.jsp?Submit=order" method="post">
	<div class="order-container">
			
			<h3 class="orderInfo-title">주문내역</h3>
			
				<table class="order-table">
						
						<tr id="info-title">
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>	
							<th>합계</th> 
						</tr>
						
						<!-- 이부분을 forEach로 반복 -->
						<c:forEach items="${cartdto}" var="dto">
							
							<input type="hidden" name="cno" value="${dto.cno}" /> <!-- 장바구니번호 주문하면 삭제 -->
							<input type="hidden" name="pno" value="${dto.pno}" /> <!-- 상품번호 -->
							<input type="hidden" name="uno" value="${dto.uno}" /> <!-- 회원번호 -->
							
							<tr>
								
								<td>
									<img id="oimage" src="../image/${dto.img}" />
								</td>
								
								<td>${dto.pname}
										<input type="hidden" name="pname" value="${dto.pname}" />
								</td>
							
								
								<td><fmt:formatNumber value="${dto.price}" type="number" pattern="###,###,###원"/></td>
								
								<td>${dto.count}
										<input name="count" type="hidden" value="${dto.count}" />
								</td>
								
								<td><fmt:formatNumber value="${dto.count * dto.price}" type="number" pattern="###,###,###원"/>
										<input name="price" type="hidden" value="${dto.count * dto.price}" /> <!-- 각 상품 구매금액 -->
								</td>
							
							</tr>
					</c:forEach>
						
				</table>
				
				<!-- 상품 총 구매금액 + 배송비 -->
				<div id="order-intfo">
					<span id="order-price"></span> + <span id="del"></span> = <span id="total-price"></span>
					<input type="hidden" name="total" id="total" /> <!-- 총 구매금액 -->
				</div>
			
			<Button id="order-button" type="button" onclick="orderFunction()">주문</Button>
			
	</div>

	<!-- 주문자 정보 -->
	<div class="customerInfo-container">
		
		<h3 class="orderInfo-title">주문자 정보</h3>
		
		<c:set value="${customer}" var="cdto" />
		
		<!-- 회원 등급 -->
		<input id="grade" name="grade" type="hidden" value="${cdto.grade}" />
				
		<table class="customerInfo-table">
			<tr>
				<th>주문하시는분</th>
				<td>${cdto.uname}</td>
			</tr>
				
			<tr>
				<th>휴대전화</th>
				<td>${cdto.tel}</td>
			</tr>
				
			<tr>
				<th>이메일</th>
				<td>${cdto.mail}</td>
			</tr>
				  
			<tr>
				<th>받는 주소</th>
				<td>${cdto.addr}</td>
			</tr>
				  
			<tr>
				<th>배송 메시지</th>
				<td>
					<textarea name="message" id="message" rows="5" cols="50" placeholder="요청사항을 입력해주세요.(50자 이내)"></textarea>
				</td>
			</tr>
		</table>
		
	</div>
</form>

<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

<!-- 주문페이지 js -->
<script src="../js/Order.js"></script>


</html>