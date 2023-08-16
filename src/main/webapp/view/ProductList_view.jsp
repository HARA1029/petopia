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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
-->
<style>
.plist {
  width: calc(20% - 40px); /* 한 줄에 5개 항목, 여백 고려 */
  margin: 10px; /* 항목 사이 간격 설정 */
}

.plist-container {
	width:90%;
	text-align : center;
	margin : 0px auto;
  display: flex; /* 플렉스 컨테이너로 설정 */
  /*border : 1px solid black;*/
  flex-wrap: wrap; /* 넘칠 경우 줄바꿈 */
  padding: 50px 10px; /* 양쪽 여백 동일하게 추가 */
}

.plist-container > div {
  background-color: #f1f1f1; /* 배경색 설정 */
  margin: 10px; /* 항목 사이 간격 설정 */
  padding: 10px; /* 내부 여백 설정 */
  font-size: 15px; /* 글꼴 크기 설정 */
}
.pImg {
	width : 100%;
}
</style>
</head>
<body>
<script>
// 실행할 함수
function myFunction() {
  var size = ${plist.size()};
  if (size === 0) {
    document.querySelector('.sold').style.display = 'block'; // 상품이 준비중일 때 보이도록 설정
  }
}

// DOMContentLoaded 이벤트 리스너를 사용하여 페이지 내용이 로드되면 myFunction() 실행
document.addEventListener("DOMContentLoaded", myFunction);
</script>

<!-- 카테고리 메뉴바 -->
<%@ include file="categoryBar.jsp" %>

<div class="plist-container">
	<c:forEach items="${plist}" var="dto">
  	<div class="plist">
  		<img class="pImg" src="../image/${dto.img}" alt="None" style="width:80%"/>
  		<p>${dto.pname} : <fmt:formatNumber value="${dto.price}" type="number" pattern="###,###,###원"/></p>
  	</div>
  </c:forEach>
</div>

<div class="sold" style="text-align:center; display:none;">
	<p>상품이 준비중입니다......</p>
</div>  

</body>
</html>