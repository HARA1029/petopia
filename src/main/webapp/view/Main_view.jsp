<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<!-- 카테고리 메뉴바 css -->
<link rel="stylesheet" type="text/css" href="../css/categorybar.css">


<style>
/* Reset some default styles */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
}
  
/* Set up the main layout */
.wrapper {
  position: relative;
  min-height: 100vh;
  box-sizing: border-box;
}

/* Header styles */
header {
  background-color: #333;
  color: white;
  /* padding: 20px; */
  text-align: center;
  border-bottom: 1px solid #999;
}
  
/* Content styles */
.content {
  padding: 3% 7%;
  box-sizing: border-box;
  border : 5px solid blue;
}
  
/* Footer styles */
footer {
  background-color: #333;
  color: white;
  padding: 20px;
  text-align: center;
  position: absolute;
  bottom: 0;
  width: 100%;
}
</style>

</head>
<body>
<div class="wrapper">
	<!-- 헤더 카테고리 메뉴바 -->
	<header>
		<%@ include file="categoryBar.jsp" %>
	</header>
	
	<!-- 본문 내용 -->
	<div class="content">
		<%@ include file="pDetail_view.jsp" %>
	</div>
	
	<!-- 푸터 -->
	<footer>
		<p>푸터입니다.</p>
		<p>푸터입니다.</p>
		<p>푸터입니다.</p>
	</footer>
</div>

</body>
</html>