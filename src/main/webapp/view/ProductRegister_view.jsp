<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상품등록</title>
<link rel="stylesheet" href="../css/register.css">

</head>

<body>
<!-- top -->
<%@ include file="/layout/top.jsp" %>

<main>
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
			  	<!--
			    <input id="registerBtn" class="rbutton" type="button" name="submit" value="등록">
			  	-->
			  	<button id="registerBtn" class="rbutton" onclick="">등록</button>
			  </div>
		  
		  </form>
			
			
		</div>
		
	</div>
</main>

<!-- bottom -->
<%@ include file="/layout/bottom.jsp" %>

<script>
//전체적인 모든요소 체크(이게 최종적으로 true가 되어야 제출가능) + 아이디 중복체크까지
var formcheck = false;

//상품중복체크 버튼을 클릭하면 이벤트로 중복체크하는 function 만들기
var Inputpname = document.getElementById("p_name");
var Inputpname1 = document.getElementById("p_name1");

//상품을 다시입력하려고 하는순간 무조건 false로 제출못하게함
Inputpname.addEventListener("input", function() {
	formcheck = false;
}); 

Inputpname.addEventListener("blur", function() {
	
	if (!Inputpname.value) {
				Inputpname1.style.color = "red";
				Inputpname1.innerHTML ="상품명을 입력하지 않았습니다.";
				Inputpname.focus();
				formcheck = false;//중복체크하고 지웠을경우 다시 중복체크하게 false로 하기
        return;
  }
	
	//상품중복체크 전 form도 같이 제출되는 거 막기
	//event.preventDefault(); // 기본 동작(폼 제출) 막기
	
	//ajax로 상품중복체크
	var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
  xhr.open("POST", "../Controller/ManagerController.jsp", true); // POST 메서드로 "check.jsp"에 연결
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // 요청 헤더 설정
  
  xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) { // 요청 상태 확인
          if (xhr.status === 200) { // 요청이 성공했을 때
																			//HTTP 상태 코드 중 200은 "OK"를 나타내는 상태 코드
							var result = parseInt(xhr.responseText); // 받은 값을 숫자로 변환
              
							if (result === 0) {
								Inputpname1.style.color = "red";
            	  	Inputpname1.innerHTML ="이미 존재하는 상품입니다.";
                  Inputpname.value = ""; // 입력 내용 지우기
                  Inputpname.focus(); // 입력 필드에 포커스 이동
                  return;
              } else if (result === 1) {
	            	  Inputpname1.style.color = "green";
            	  	Inputpname1.innerHTML ="등록 가능한 상품입니다.";
            	  	formcheck = true; //다음으로 입력된값이 없는게 있는지 확인하기 위해 true로 변경           	  	
            	  	return;
              } else {
                  alert("오류가 발생했습니다.");
              }
          } else {
              alert("오류가 발생했습니다.");
          }
      }
  };
  
  var formData = "pname="+ Inputpname.value + "&submit=pCheck"; // 상품명과 중복체크를 실행키기기 위한 값만 전송
  xhr.send(formData); // 생성한 폼 데이터를 서버로 전송
	
});

//입력된 상품이 있는지 없는지 체크
var registerBtn = document.getElementById("registerBtn");

//폼 제출 버튼 클릭
registerBtn.addEventListener("click", function() {
	
		if(formcheck) {
			
				var Inputprice = document.getElementById("p_price");
				var Inputstock = document.getElementById("p_stock_input");
				var Inputimg = document.getElementById("p_img");
				
				if (!Inputprice.value) { 
			        alert("상품가격을 입력하지 않았습니다.");
			        Inputprice.focus();
			        return;
			  }
				if (!Inputstock.value) { 
			        alert("상품재고를 입력하지 않았습니다.");
			        Inputstock.focus();
			        return;
			  }
				if (!Inputimg.value) { 
			        alert("상품이미지를 업로드하지 않았습니다.");
			        Inputimg.focus();
			        return;
			  }
				
				else {
					
					var confirmation = confirm("등록하시겠습니까?");
				    
			    // 사용자의 선택에 따라 다른 동작을 수행합니다.
			    if (confirmation) {
			    	alert("등록성공");
			    	document.getElementById("rForm").submit();
			    } else {
			    	document.getElementById("rForm").reset();
			    	Inputpname1.innerHTML ="";
			    	formcheck = false;
			    	return;
			    }
				}
		}
		
		else { //무조건 상품중복체크가 먼저
			alert("상품중복체크를 해주세요.")
			Inputpname.focus(); //버튼에 focus가는 걸로 수정
			event.preventDefault(); // 기본 동작(폼 제출) 막기
			return;
		}
});

//재고 선택 메서드
function stockSelect() {
    var select = document.getElementById("p_stock");
    var Inputstock = document.getElementById("p_stock_input");

    if (select.value === "0") {
        // "직접입력" 선택 시 입력란 표시
        Inputstock.value="";
        Inputstock.focus();
    } else {
    	Inputstock.value = select.value;
    }
}

</script>
</body>
</html>

<!--페이지 로드 시 실행
window.onload = function() {
    // 버튼에 표시되는 텍스트 변경
    document.getElementById("submitButton").value = "등록";
};
-->