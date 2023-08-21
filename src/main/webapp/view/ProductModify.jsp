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
  <form class="p_modifyForm" action="../Controller/ManagerController.jsp?submit=pModify&oldImg=${product.img}" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="pno" value="${product.pno }"/>
  	
  	<label>상품명 : ${product.pname}</label><br><br>
  	<label>상품사진</label><br>
  	<div class="img-container">
  		<img src="../image/${product.img}" style="width:100%;"/>
  		<input id="inputImg" type="file" name="img" onchange="previewImage()"/>
  		<img id="preview" src="#" alt="이미지 미리 보기" style="display:none; width:100%;"/>
  	</div>
    
    <label>상품가격 :  <fmt:formatNumber value="${product.price}" type="number" pattern="###,###,###원"/></label>
    <input type="text" id="p_price" name="price" placeholder="1,000~100,000" value="${product.price}">

    <label>상품재고 : <fmt:formatNumber value="${product.stock}" type="number" pattern="###,###,###개"/></label>
    <select id="p_stock" class="stock" onchange="stockSelect()">
      <option value="0">직접입력</option>
      <option value="10">10</option>
      <option value="20">20</option>
      <option value="30">30</option>
    </select>
    <input id="p_stock_input" type="text" name="stock" value="${product.stock}">

    <label>카테고리 : ${product.cateno}</label>
    <select id="p_cateno" class="cateno" name="cateno">
      <option value="1">목욕</option>
      <option value="2">배변/위생</option>
      <option value="3">미용/케어</option>
      <option value="4">홈/리빙</option>
      <option value="5">산책/놀이</option>
      <option value="6">간식/영양제</option>
      <option value="7">의류/악세서리</option>
    </select>
  
    <input class="p_modify" type="submit" value="수정">
  </form>
</div>

<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

<!-- 상품수정 js -->
<script src="../js/ProductModify.js"></script>

</html>