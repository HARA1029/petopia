<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 카테고리 메뉴바 css -->
<link rel="stylesheet" type="text/css" href="../css/categorybar.css">

<div class=" ">
	<div id="cgBar" class="cbtn-group" style="width:100%">
		<button class="cbtn" id="all" onclick="category('0')" style="width:12.5%">전체상품</button>
		<button class="cbtn" id="cateno1" onclick="category('1')" style="width:12.5%">목욕</button>
		<button class="cbtn" id="cateno2" onclick="category('2')" style="width:12.5%">배변/위생</button>
		<button class="cbtn" id="cateno3" onclick="category('3')" style="width:12.5%">미용/케어</button>
		<button class="cbtn" id="cateno4" onclick="category('4')" style="width:12.5%">홈/리빙</button>
		<button class="cbtn" id="cateno5" onclick="category('5')" style="width:12.5%">산책/놀이</button>
		<button class="cbtn" id="cateno6" onclick="category('6')" style="width:12.5%">간식/영양제</button>
		<button class="cbtn" id="cateno7" onclick="category('7')" style="width:12.5%">의류/악세서리</button>
	</div>
</div>

<!-- 카테고리 js -->
<script src="../js/categoryBar.js"></script>