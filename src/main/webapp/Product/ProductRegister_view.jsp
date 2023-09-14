<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상품등록</title>
<link rel="stylesheet" href="../css/ProductRegister.css">

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>


	<div class="register-container">
	
			<h1 class="registerTitle">상품 등록</h1>
	
			<div class="register-content">
		
		  <form action="../Controller/ManagerController.jsp?Submit=register&cno=" method="post" id="rForm" enctype="multipart/form-data">
		  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label" for="p_name">상품 이름</label>
			    </div>
			    <div class="r-col-75">
			      <input type="text" class="pname" id="p_name" name="pname" placeholder="상품명.." required>
			      <b><span id="p_name1"></span></b>
			    </div>
			  </div>
			  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label" for="p_price">상품 가격</label>
			    </div>
			    <div class="r-col-75">
			      <input type="number" class="price" id="p_price" name="price" placeholder="1,000~100,000" required>
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
			      <input id="p_stock_input" type="number" name="stock" required>
			   </div>
			  </div>
			  
			  <div class="registerRow">
			    <div class="r-col-25">
			      <label class="r-label">상품 사진</label>
			    </div>
			    <div class="r-col-75">
			      <input multiple="multiple" id="p_img" type="file" name="img" onclick="fileNameFunction()" required> <!-- multiple="multiple" -->
			    	<br><span id="ImgError"></span>
			    	<input type="text" id="Img" name="Img" style="border:none; color:green;" readonly/>
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