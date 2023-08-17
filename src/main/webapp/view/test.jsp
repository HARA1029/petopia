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
<title>상품상세정보</title>
<!-- 아이콘 사용 링크 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<style>
/* 맨위 상품이미지, 주문선택 공간*/
.Detail-row {
	/* border : 10px solid blue; */
	margin : 0 auto;
	/* height : 650px; */
}

.Detail-row:after {
  content: "";
  display: table;
  clear: both;
  /* margin : 10px; */
}

/* 상품 이미지 */
.column1 {
	border : 5px solid red;
	width: 500px;
  height: 500px;
	position: relative;
  float: left;
  margin : 2% 0 0 7%;
  /* object-fit:cover; */
}

/* 상품 구매 선택 */
.column2 {
	/* border : 2px solid red; */
  float: right;
  width: 500px;
  height: 500px; 
  display: flex;
  flex-direction: column;
  margin : 2% 7% 0 0;
}

.column2 > h2 {
	width:100%;
	height:10%;
	/* border:5px solid red; */
	text-align : left;
	font-size : 45px;
	/* padding : 25px 0; */
}

.dprice {
	/* border : 5px solid black; */
	width : 100%;
	height : 20%;
	padding : 20% 0 0 0;
	font-size : 25px;
	font-weight: bold; /* 글씨를 진하게 만듦 */
}

.c2 { /* 상품명 체크박스 상품가격  */
	/* border : 5px solid black; */
	width : 100%;
	height : 20%;
  align-items: center; /* 수직 가운데 정렬 */
}

.count::-webkit-inner-spin-button,
.count::-webkit-outer-spin-button {
	-webkit-appearance: none;
	appearance: none;
}
.count {
	width:30px;
  text-align: center; /* 텍스트를 가운데 정렬합니다. */
}
.c2-items {
	display: flex;
}

.material-symbols-outlined {
	cursor: pointer; /* 커서 모양을 손가락으로 설정 */
}

.totoal-price {
		/* border : 5px solid black; */
		width : 100%;
		height : 20%;
		padding : 30px 0 0 0; 
}

/* 버튼 */
.dbtn-group {
	/* border : 5px solid black; */
	width : 100%;
/* 	bottom : 0; */
}
.dbtn-group .dbtn {
  background-color: lightcoral; /* Green */
  width:50%;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
  bottom : 0:
}

#dbtn1 {
background-color : white;
color : lightcoral;
}

.Detail-container1 {
  /* background-color: #333; */
	margin : 7%;
  overflow: auto;
  white-space: nowrap;
  /* padding: 10px; */
  display: flex;
  flex-direction: column;
  
}

.Detail-container1 img {
  /* padding: 10px; */
  margin: 0 auto;
  margin-top : 3%;
  margin-bottom : 3%;
  vertical-align: middle;
  align-items: center; 
}


/* Style the 주의사항 */
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.collapsible:after {
  content: '\002B';
  color: white;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}

.content {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
  .column {
    width: 100%; 
    
  }
}

<!-- ------------ -->


.mySlides img {
	/* width:100%;
	height:100%; */
	object-fit:cover;
}

.column img {
	vertical-align: middle;
	width : 100%;
 	height : 100px;
}

/* Hide the images by default */
.mySlides {/* 
  display: none; */
  width:100%;
  height:100%;
  object-fit:cover;
}

.mySlides img {
	width:100%;
	height:100%;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 20%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

</style>
</head>
<body>
<!-- top -->
<%@ include file="/layout/top.jsp" %>

<!-- 카테고리 메뉴바 -->
<%@ include file="categoryBar.jsp" %>

<div style="margin:0 10%;">

	<div class="Detail-row"><!-- display:flex -->
	 	<div class="column1">	 	
	 		<div class="mySlides">
		    <div class="numbertext">1 / 5</div>
		    <img class="img1" src="../image/상세정보/샤워기1.jpg" >
  		</div>

		  <div class="mySlides">
		    <div class="numbertext">2 / 5</div>
		    <img class="img1" src="../image/상세정보/샤워기2.jpg" >
		  </div>
		
		  <div class="mySlides">
		    <div class="numbertext">3 / 5</div>
		    <img class="img1" src="../image/상세정보/샤워기3.jpg" >
		  </div>
		    
		  <div class="mySlides">
		    <div class="numbertext">4 / 5</div>
		    <img class="img1" src="../image/상세정보/샤워기4.jpg" >
		  </div>
		
		  <div class="mySlides">
		    <div class="numbertext">5 / 5</div>
		    <img class="img1" src="../image/상세정보/샤워기5.jpg" >
		  </div>
    
		  <a class="prev" onclick="plusSlides(-1)">❮</a>
		  <a class="next" onclick="plusSlides(1)">❯</a>


		  <div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../image/상세정보/샤워기1.jpg" onclick="currentSlide(1)" alt="The Woods">
		    </div>
		    
		    <div class="column">
		      <img class="demo cursor" src="../image/상세정보/샤워기2.jpg" onclick="currentSlide(2)" alt="Cinque Terre">
		    </div>
		    
		    <div class="column">
		      <img class="demo cursor" src="../image/상세정보/샤워기3.jpg" onclick="currentSlide(3)" alt="Mountains and fjords">
		    </div>
		    
		    <div class="column">
		      <img class="demo cursor" src="../image/상세정보/샤워기4.jpg" onclick="currentSlide(4)" alt="Northern Lights">
		    
		    </div>
		    
		    <div class="column">
		      <img class="demo cursor" src="../image/상세정보/샤워기5.jpg" onclick="currentSlide(5)" alt="Nature and sunrise">
		    </div>
		    
		  </div>
	 	
	 	</div>
	 	
	  <div class="column2">
	  	
	  	<h2 style="margin:0 auto;">상품명</h2>
	  	
	  	<p class="dprice">10,000원</p>
	  	
	  	<hr>
	  	
	  	<div class="c2">
		  	<b class="c2-items">상품명</b>
		  	<div class="c2-items">
		  		<span class="material-symbols-outlined">indeterminate_check_box</span>
					<input class="count" type="number" value="1">
					<span class="material-symbols-outlined">add_box</span>
					<span class="material-symbols-outlined">disabled_by_default</span>
		  	</div>
		  	<b class="c2-items">상품가격</b>
	  	</div>
	  	
	  	
	  	<p class="totoal-price">총 상품 금액(수량)</p>
	  	
	  	
	  	<div class="dbtn-group">
		  	<button id="dbtn1" class="dbtn">ADD TO CART</button>
		  	<button class="dbtn">BUY NOW</button>
			</div>
	  </div>
	  
	</div>
	
	<div class="Detail-container1">
	  <img src="../image/상세정보/샤워기1.jpg" alt="jpg1" width="600" height="400">
	  <img src="../image/상세정보/샤워기2.jpg" alt="jpg2" width="600" height="400">
	  <img src="../image/상세정보/샤워기3.jpg" alt="jpg3" width="600" height="400">
	  <img src="../image/상세정보/샤워기4.jpg" alt="jpg4" width="600" height="400">
	  <img src="../image/상세정보/샤워기5.jpg" alt="jpg5" width="600" height="400">
	</div>
	
	<div class="Detail-container2">
	  <button class="collapsible">DELIVERY</button>
		<div class="content">
			<p>
		  배송 방법 : 택배<br>
		  배송 지역 : 전국지역<br>
		  배송 비용 : 무료<br>
		  배송 기간 : 3일 ~ 7일<br>
		  배송 안내 :<br>
		  ※배송기간 : 평일 오전 9시 30분 이전 결제 완료된 주문건은 오전 당일 출고를 원칙으로 하며,<br>
		  평일 오전 9시 30분 이후~ 오후 1시 30분 이전 결제 완료된 주문건은 오후 당일 출고를 원칙으로 도와드리고 있습니다.<br>
		  오후 1시 30분 이후 주문건의 경우, 익영업일 순차적으로 출고 진행되오니 참고 부탁드립니다. <br>
		  아울러 배송은 평균 1~3일 정도 소요되며, 제주도 및 도서산간 지역의 경우 배송이 다소 지연될 수 있는 점 양해 부탁드립니다.<br>
		  </p>  
		</div>
		
		<button class="collapsible">EXCHANGE & RETURN</button>
		<div class="content">
			<p>
				<b>교환 및 반품이 가능한 경우</b><br>
				- 상품을 인도받은 날로부터 7일 이내에 한해 계약에 관한 청약 철회가 가능합니다.<br>
				- 공급받으신 상품 및 용역의 내용이 표시. 광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3개월 이내, 그 사실을 알게 된 날로부터 30일 이내<br>
			
				<b>교환 및 반품이 불가능한 경우</b><br>
				- 고객님의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외<br>
				- 포장을 개봉하였거나 포장이 훼손되어 상품 가치가 상실된 경우<br>
			   (예:'개봉 시 교환/환불 불가 스티커'를 훼손한 경우, 제품 단 상자가 훼손되어 상품가치가 상실된 경우)<br>
				- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br>
			  (단, 화장품 등의 경우 시용제품을 제공한 경우에 한 합니다.)<br>
				- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br>
			  (자세한 내용은 CS센터의 Q&A 게시판을 이용해 주시기 바랍니다.)<br><br>
			
				※ 단순 변심으로 인한 교환, 반품하실 경우 상품 반송 비용은 고객님께서 부담하셔야 합니다. (색상 및 사이즈 교환 등 포함)
			</p>  
		</div>
	</div>

</div>


<!-- bottom -->
<%@ include file="/layout/bottom.jsp" %>

<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}

///////////////////
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("demo");
  let captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
</body>
</html>