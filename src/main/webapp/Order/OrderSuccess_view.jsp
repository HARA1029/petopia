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
<title>주문 성공</title>
<link rel="stylesheet" href="../css/OrderSuccess.css" />

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>
<%String userName = (String) session.getAttribute("userName"); %>

<div class="orderSucess-container">
	<c:set value="${order}" var="order" />
	<c:set value="${custominfo}" var="custominfo" />
	
	<h1 style="text-align:center">주문 완료</h1><br><br>
	
	<div class="orderSucess-container1">
		<b class="userName"><%=userName%></b>님, 주문하신<br>
		소중한 상품을 곧 보내드릴게요!. 
	</div><br><br>
	
	<div class="orderSucess-container2">
	  <h2>고객등급 : <b class="grade">&nbsp;${custominfo.grade.equals('A') ? "대형견" 
	  													 : custominfo.grade.equals('B') ? "중형견" : "소형견" } &nbsp;</b>&nbsp;&nbsp;${cusdto.uname}</h2>
	  <p>${custominfo.uname} | ${custominfo.tel}</p>
	  <p>${custominfo.addr}</p>
	  <p style="color:#AAAAAA;">${order.message}</p>
	</div>
	
	<div class="orderSucess-container3">
		<form action="../Controller/UserController.jsp?Submit=OrderDetailInfo" method="post">
		<span style="float:left;">총 결제 <b style="font-size:20px;">
		<fmt:formatNumber value="${order.total}" type="number" pattern="###,###,###원"/></b></span> 
		<input type="hidden" name="ono" value="${order.ono}" />
		<button type="submit" class="orderInfo-Btn">주문내역</button>
		</form>
	</div>
</div>

<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>
</html>