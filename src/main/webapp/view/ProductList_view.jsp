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
<title>상품목록</title>

<!-- productList.css -->
<link rel="stylesheet" href="../css/productList.css"> 

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>


<!-- top -->
<%@ include file="../layout/top.jsp" %>
<input id="id" type="hidden" value="<%=sessionID%>">
				       
<!-- 카테고리 메뉴바 -->
<%@ include file="categoryBar.jsp" %>

	<br><button id="registerBtn" type="button" onclick="registerFunction()">상품등록</button>
	<div class="plist-container">
	
			<!-- plist ArrayList가 비어있지 않을 때 실행할 내용 -->
			<c:if test="${not empty plist}">
				<c:forEach items="${plist}" var="dto">
			  	<div class="plist">
			  		<a class="apImg" href="ManagerController.jsp?Submit=ProductDetail&pno=${dto.pno}">
			  			<img name="pimg" id="pimg" class="pImg" src="../image/${dto.cateno == 1 ? '목욕' 
																															  			: dto.cateno == 2 ? '배변위생'
																															  			: dto.cateno == 3 ? '미용케어'
																															  			: dto.cateno == 4 ? '홈리빙'
																															  			: dto.cateno == 5 ? '산책놀이'
																															  			: dto.cateno == 6 ? '간식영양제' 
																															  			: '의류악세서리'}/${dto.img}" alt="None" />
			  		</a>
			  		<p>${dto.pname} : <fmt:formatNumber value="${dto.price}" type="number" pattern="###,###,###원"/></p>
			  		<input type="hidden" id="pno" value="${dto.pno}">
			  	</div>
			  </c:forEach>
		  </c:if>
	  
	  <!-- plist ArrayList가 비어있을 때 실행할 내용 -->
	  <c:if test="${empty plist}">
	    <div class="sold">
				<p>상품이 준비중입니다......</p>
			</div>
		</c:if>
		  
	</div>



<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

<!-- ProductList js -->
<script src="../js/ProductList.js"></script>

</html>