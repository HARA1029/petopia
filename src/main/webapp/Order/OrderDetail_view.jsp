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
<title>주문 상세 내역</title>

<!-- 카테고리 메뉴바 css -->
<link rel="stylesheet" type="text/css" href="../css/OrderDetail.css" />

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>
<!-- nav -->
<%@ include file="../layout/nav.jsp" %>

<div class="OrderDetail-container">
		<c:forEach items="${odList}" var="odList">
			<div class="product-card">
			  
			  <div class="pImg">
			    <img id="pimg" src="../image/${odList.img}" alt="이미지">
			  </div>
			  
			  <div class="description">
			    <h1>${odList.pname}</h1>
			    <p>주문번호 ${odList.dno}</p>
			    <p>판매가 : ${odList.price}</p>
			    <p>결제금액/${odList.count}개 : 
			    	<fmt:formatNumber value="${odList.price * odList.count}" type="number" pattern="###,###,###원"/>
			    	</p>
			  </div>
			
			</div><br><br>
		</c:forEach>

</div>
<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

</html>