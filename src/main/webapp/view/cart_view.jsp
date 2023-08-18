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
.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.cart-img {
	width : 50px;
	height : 50px;
  /* padding: 10px;
  background: dodgerblue;
  color: white;
 */  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.cart-submit {
  background-color: lightcoral;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.cart-submit:hover {
  opacity: 1;
}
</style>
</head>
<body>

<form class="cart-form" action="#" style="max-width:500px;margin:0 auto">
  
  <h2>장바구니</h2>
  
  <div class="input-container">
    <img src="../image/상세정보/1_샤워기.jpg" class="cart-img">
    <input class="input-field" type="text" placeholder="Username" name="usrnm">
  </div>

  <div class="input-container">
    <img src="../image/상세정보/1_샤워기.jpg" class="cart-img">
    <input class="input-field" type="text" placeholder="Email" name="email">
  </div>
  
  <div class="input-container">
    <img src="../image/상세정보/1_샤워기.jpg" class="cart-img">
    <input class="input-field" type="password" placeholder="Password" name="psw">
  </div>

  <button class="cart-submit" type="submit" class="btn">주문</button>
</form>


</body>
</html>