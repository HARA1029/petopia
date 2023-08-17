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
<link rel="stylesheet" href="../css/productList.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<script>
// 실행할 함수
function myFunction() {
  var size = ${plist.size()};
  if (size === 0) {
    document.querySelector('.sold').style.display = 'block'; // 상품이 준비중일 때 보이도록 설정
  }
  else {
	  document.querySelector('.sold').style.display = 'none';
  }
}

//이미지 요소를 선택합니다.
var pImg = document.getElementById("pimg");
var pNo = document.getElementById("pno").value;

//이미지 클릭 시 이벤트 핸들러를 추가합니다.
pImg.addEventListener("click", function() {
	alert("이동");
 // 이동할 페이지의 URL을 지정합니다.
 var url = "../Controller/ManagerController.jsp?submit=detail&pno="+pNo;
 
 // 페이지를 이동합니다.
 window.location.href = url;
});

// DOMContentLoaded 이벤트 리스너를 사용하여 페이지 내용이 로드되면 myFunction() 실행
document.addEventListener("DOMContentLoaded", myFunction);
</script>

<!-- top -->
<%@ include file="/layout/top.jsp" %>

<!-- 카테고리 메뉴바 -->
<%@ include file="categoryBar.jsp" %>

	<div class="plist-container">
		<c:forEach items="${plist}" var="dto">
	  	<div class="plist">
	  		<img name="pimg" id="pimg" class="pImg" src="../image/${dto.img}" alt="None" />
	  		<p>${dto.pname} : <fmt:formatNumber value="${dto.price}" type="number" pattern="###,###,###원"/></p>
	  		<input type="hidden" id="pno" value="${dto.pno}">
	  	</div>
	  </c:forEach>
	  
	  <div class="sold">
			<p>상품이 준비중입니다......</p>
		</div>
		  
	</div>



<!-- bottom -->
<%@ include file="/layout/bottom.jsp" %>
</body>
</html>