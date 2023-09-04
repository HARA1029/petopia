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
<!-- 상품수정 css -->
<link rel="stylesheet" type="text/css" href="../css/ProductModify.css">

<title>상품수정페이지</title>

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>

<!-- 객체를 JSTL 변수에 할당 -->
<c:set var="product" value="${product}" />

<div class="p_modify-container">
  
  <form class="p_modifyForm" action="../Controller/ManagerController.jsp?Submit=pModify&oldImg=${product.img}&cateno=${product.cateno}" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="pno" value="${product.pno }"/>
  	<input type="hidden" id="imgName" name="img" />
  	
  	<label>상품명 : ${product.pname} &nbsp;&nbsp;
  				 카테고리 : ${product.cateno == 1 ? '목욕' 
					  		 : product.cateno == 2 ? '배변/위생'
					  		 : product.cateno == 3 ? '미용/케어'
					  		 : product.cateno == 4 ? '홈/리빙'
					  		 : product.cateno == 5 ? '산책/놀이'
					  		 : product.cateno == 6 ? '간식/영양제' 
					  		 : '의류악세서리'}
  	</label><br><br>
  
  	<label>상품사진</label><br>
  	
  
  	<c:forEach items="${mpImg}" var="mpImg" varStatus="loop">
	  	
	  	<div class="img-container">
	  		<img src="../image/${product.cateno == 1 ? '목욕' 
										  			: product.cateno == 2 ? '배변위생'
										  			: product.cateno == 3 ? '미용케어'
										  			: product.cateno == 4 ? '홈리빙'
										  			: product.cateno == 5 ? '산책놀이'
										  			: product.cateno == 6 ? '간식영양제' 
										  			: '의류악세서리'}/${mpImg}" style="width:100%; height:100%;"/>
	  	</div>
  	
  	</c:forEach>
  	
  	<div class="file-container">
	  		<input multiple="multiple" id="inputImg" type="file" name="img" required/>
	  </div>
	  	
  	<div id="preview" class="preview" ></div>
  
    <br><br>
    
    <label>상품가격 :  <fmt:formatNumber value="${product.price}" type="number" pattern="###,###,###원"/></label>
    <input type="number" id="p_price" name="price" placeholder="1,000~100,000" value="${product.price}" required><br>
		
		
    <label>상품재고 : <fmt:formatNumber value="${product.stock}" type="number" pattern="###,###,###개"/></label>
    <select id="p_stock" class="stock" onchange="stockSelect()">
      <option value="0">직접입력</option>
      <option value="10">10</option>
      <option value="20">20</option>
      <option value="30">30</option>
    </select>
    <input id="p_stock_input" type="number" name="stock" value="${product.stock}" required><br>
		
		<label>판매여부 : ${product.sell==1 ? '판매중' : '판매중지'}</label>
		<select id="sell" name="sell" >
      <option value="1">판매중</option>
      <option value="0">판매중지</option>
    </select>
   	
  	<br>
    
    <input class="p_modify" type="submit" value="수정" />
    
  </form>
</div>

<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

<!-- 상품수정 js -->
<script src="../js/ProductModify.js"></script>

</html>