<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> MAIN </title>
	<link rel="stylesheet" href="../css/main.css">
</head>
<%@ include file="/layout/top.jsp" %>

	<!-- Slideshow container -->
	<div class="slideshow-container">
	
	  <!-- Full-width images with number and caption text -->
	  <div class="mySlides fade">
	    <img src="../image/img1.jpg" style="width:100%">
	  </div>
	
	  <div class="mySlides fade">
	    <img src="../image/img2.jpg" style="width:100%">
	  </div>
	
	  <div class="mySlides fade">
	    <img src="../image/img3.jpg" style="width:100%">
	  </div>
	
	  <!-- Next and previous buttons -->
	  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	  <a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
	<br>
	
	<!-- The dots/circles -->
	<div style="text-align:center">
	  <span class="dot" onclick="currentSlide(1)"></span>
	  <span class="dot" onclick="currentSlide(2)"></span>
	  <span class="dot" onclick="currentSlide(3)"></span>
	</div>
	
	<h1>BEST ITEM</h1>
	<div class="button-container">
		<button class="more-button" onclick="goProductView()">+ 더보기</button>
	</div>
	<div class="plist-container">
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>	  		  
	</div>
	
	<h1>NEW ITEM</h1>
	<div class="button-container">
		<button class="more-button" onclick="goProductView()">+ 더보기</button>
	</div>
	<div class="plist-container">
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>상품정보</p>
	  		<input type="hidden" id="pno">
	  	</div>	  		  
	</div>
	
	<script src="../js/test.js"></script>

<%@ include file="/layout/bottom.jsp" %>
