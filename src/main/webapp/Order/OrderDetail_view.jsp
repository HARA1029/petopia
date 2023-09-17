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
<title>주문 상세 내역</title>

<!-- 카테고리 메뉴바 css -->
<link rel="stylesheet" type="text/css" href="../css/OrderDetail.css" />

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>
<!-- nav -->
<%@ include file="../layout/nav.jsp" %>

<div class="OrderDetail-container">
		<c:forEach items="${odList}" var="odList">
			
			<div class="product-card">
			
			  <div class="pImg">
			    <img id="pimg" src="../image/${odList.img}" alt="이미지">
			  </div>
			  
			  <div class="description">
			    <h1>${odList.pname}</h1>
			    <p>주문번호 ${odList.dno}</p>
			    <p>판매가 : <fmt:formatNumber value="${odList.price}" type="number" pattern="###,###,###원"/></p>
			    <p>결제금액/${odList.count}개 : 
			    	<fmt:formatNumber value="${odList.price * odList.count}" type="number" pattern="###,###,###원"/>
			    	</p>
			  </div>
			  
			  <div class="reviewButton">
			  	<!-- 리뷰가 작성안한 상품만 리뷰작성버튼 보이게하기 0이 미작성 -->
					<c:if test="${odList.reviewcheck == 0}">
				  	<button id="reviewregister" onclick="modalOpenFunction('${odList.pno}','<%=sessionID%>','${odList.dno}')">리뷰 작성</button>
					</c:if>
			  </div>
							
			</div><br>
		</c:forEach>

</div>

<!-- The Modal -->
<div id="review-myModal" class="review-modal">

  <!-- Modal content -->
  <form action="../Controller/UserController.jsp">
  <div class="review-modal-content">
    <div class="review-modal-header">
      <span class="close">&times;</span>
      <h2>리뷰 작성</h2>
    </div>
    <div class="review-modal-body">
    	<textarea name="reviewContent" id="reviewtext" rows="5" cols="50" placeholder="리뷰를 작성해주세요.(20자 이내)"></textarea>
    </div>
    <div class="review-modal-footer">
    	<input type="hidden" value="reviewRegister" name="Submit"/> <!-- 리뷰작성 controller로 들어가기 위한 조건 값 -->
    	<input id="userId" type="hidden" name="uId" value=""/> <!-- 회원아이디 -->
    	<input id="productNo" type="hidden" name="pNo" value=""/> <!--  상품번호 -->
    	<input id="detailNo" type="hidden" name="dNo" value="" /><!-- 주문 상세 번호 -->
      <input id="review-register-btn" type="submit" value="등록">
    </div>
  </div>
	</form>
</div>
<script>
// Get the modal
var modal = document.getElementById("review-myModal");

// Get the button that opens the modal
var btn = document.getElementById("reviewregister");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];


function modalOpenFunction(productNo, userId, detailNo) {
	document.getElementById("userId").value= userId;
	document.getElementById("productNo").value= productNo;
	document.getElementById("detailNo").value= detailNo;
	modal.style.display = "block";

}
/*
// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}
*/

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

</html>