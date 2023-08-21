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

<!-- 카테고리 메뉴바 -->
<%@ include file="categoryBar.jsp" %>
	<button id="registerBtn" type="button" onclick="registerFunction()">상품등록</button>
	<div class="plist-container">
	
			<!-- plist ArrayList가 비어있지 않을 때 실행할 내용 -->
			<c:if test="${not empty plist}">
				<c:forEach items="${plist}" var="dto">
			  	<div class="plist">
			  		<a class="apImg" href="ManagerController.jsp?submit=pDetailList&pno=${dto.pno}">
			  			<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
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

<script>
function registerFunction() {
	location.href = '../view/ProductRegister_view.jsp';
}
</script>

</html>