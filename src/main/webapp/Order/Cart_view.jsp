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
<!-- cart.css -->
<link rel="stylesheet" type="text/css" href="../css/Cart.css">
<title>장바구니</title>

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>

<h1 style="text-align:center; padding: 5% 0 0 0;">장바구니</h1>
<hr style="width:300px;">

<form id="cart-form" action="../Controller/UserController.jsp" method="post">
	<input id="cartsize" type="hidden" value="${size}"/>
	<table class="cart-table">
		<!-- 목록1개 이걸 돌리기 -->
		<c:forEach items="${cartlist}" var="cart">
	  <tr style="border : 5px solid black;">
		  <td class="img-td">
		  	 <img src="../image/${cart.img}" class="cart-img" style="width:100%;">
		  </td>
			<td class="product-table" style="border-bottom : 1px solid gray;">
		      <table class="cart-list">
		        <tr>
		          <td>상품명 : ${cart.pname}</td>
		        </tr>
		        <tr>
		          <td>상품가격 : <fmt:formatNumber value="${cart.price}" type="number" pattern="###,###,###원"/></td>
		        </tr>
		        <tr>
		          <td>수량 : <fmt:formatNumber value="${cart.count}" type="number" pattern="###,###,###개"/></td>
		        </tr>
		        <tr>
		          <td>총주문가격 : <fmt:formatNumber value="${cart.price * cart.count}" type="number" pattern="###,###,###원"/></td>
		        </tr>
		      </table>
			</td>
			<td class="cart-check">
	       <input id="productCheck" type="checkbox" value= "${cart.cno}" name="cno"/>
	    </td>
	  </tr>
	  </c:forEach>
	</table>
	<div class="orderBtn">
		<input type="hidden" name="id" value="<%=sessionID%>" /> <!-- 회원 아이디 -->
		<input type="hidden" name="dir" value="1"/> <!-- 1은 장바구니 통한 주문(0은 바로 주문) -->
		<button id="order" type="button" onclick="orderFunction()">주문</button>
	  <button id="delete" type="button" onclick="deleteFunction()">삭제</button>
	  <input  id="Submit" name="Submit"  type="hidden">
	</div>
</form>

<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>
<!-- 장바구니 js -->
<script src="../js/Cart.js"></script>

</html>