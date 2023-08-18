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
<title>Insert title here</title>
<style>

table {
	border: 10px solid blue;
}

.cart-table {
	margin: 0 auto;
	margin-top: 10%;
  width: 1300px;
}
.img-td {
	width: 150px;
	height: 150px;
}
.cart-list {
	width: 1000px;
	height: 100%;
}

.cart-check {
	border: 5px solid green;
	text-align : center;
	width:75px;
}

.cart-delete {
	border: 5px solid green;
	text-align : center;
	width:75px;
}
</style>
</head>
<body>
<table class="cart-table">

	<!-- 목록1개 이걸 돌리기 -->
  <tr>
	  <td class="img-td" style="border:5px solid red"></td>
		<td class="product-table">
	      <table class="cart-list">
	        <tr>
	          <td>상품명</td>
	        </tr>
	        <tr>
	          <td>상품가격</td>
	        </tr>
	        <tr>
	          <td>수량</td>
	        </tr>
	        <tr>
	          <td>총주문가격</td>
	        </tr>
	      </table>
		</td>
		<td class="cart-check">
       <input type="checkbox">
    </td>
     <td class="cart-delete">
       <button>삭제</button>
    </td>
  </tr>
  
  
</table>
</body>
</html>