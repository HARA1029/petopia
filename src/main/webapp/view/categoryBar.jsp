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
<script>
function category(cateno) {
	  switch (cateno) {
	    case '0':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=0';
	      break;
	    case '1':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=1';
	      break;
	    case '2':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=2';
	      break;
	    case '3':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=3';
	      break;
	    case '4':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=4';
	      break;
	    case '5':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=5';
	      break;
	    case '6':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=6';
	      break;
	    case '7':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=7';
	      break;
	    default:
	    	alert("Error");
	      break;
	  }
	}
</script>