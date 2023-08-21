<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상품등록</title>
<link rel="stylesheet" href="../css/register.css">

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>


	<div class="register-container">
	
			<h1 class="registerTitle">상품 등록</h1>
	
			<div class="register-content">
		
		  <form action="../Controller/ManagerController.jsp?submit=register" method="post" id="rForm" enctype="multipart/form-data">
		  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label" for="p_name">상품 이름</label>
			    </div>
			    <div class="r-col-75">
			      <input type="text" class="pname" id="p_name" name="pname" placeholder="상품명..">
			      <b><span id="p_name1"></span></b>
			    </div>
			  </div>
			  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label" for="p_price">상품 가격</label>
			    </div>
			    <div class="r-col-75">
			      <input type="text" class="price" id="p_price" name="price" placeholder="1,000~100,000">
			    </div>
			  </div>
			  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label" for="p_stock">상품 재고</label>
			    </div>
			    <div class="r-col-75">
			      <select id="p_stock" class="stock" onchange="stockSelect()">
			      	<option value="0">직접입력</option>
			        <option value="10">10</option>
			        <option value="20">20</option>
			        <option value="30">30</option>
			      </select>
			      <input id="p_stock_input" type="text" name="stock">
			   </div>
			  </div>
			  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label">상품 사진</label>
			    </div>
			    <div class="r-col-75">
			      <input id="p_img" type="file" name="img">
			    </div>
			  </div>
			  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label">카테 고리</label>
			    </div>
			    <div class="r-col-75">
			      <select id="p_cateno" class="cateno" name="cateno">
			      	<option value="1">목욕</option>
			        <option value="2">배변/위생</option>
			        <option value="3">미용/케어</option>
			        <option value="4">홈/리빙</option>
			        <option value="5">산책/놀이</option>
			        <option value="6">간식/영양제</option>
			        <option value="7">의류/악세서리</option>
			      </select>
			    </div>
			  </div> <br>
			  
			  <div class="registerRow">
			  	<button type="button" id="registerBtn" class="rbutton" >등록</button>
			  </div>
		  
		  </form>
			
			
		</div>
		
	</div>


<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

<!-- 상품등록 js -->
<script src="../js/ProductRegister.js"></script>
</html>