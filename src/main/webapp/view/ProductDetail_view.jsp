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

<!-- pDetail.css -->
<link rel="stylesheet" href="../css/ProductDetail.css">
<!-- 아이콘 사용 링크 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>

<!-- top -->
<%@ include file="../layout/top.jsp" %>

<!-- 아이디 -->
<input id="id" type="hidden" value="<%=sessionID%>">


<div style="margin:0 10%;">

	<!-- 객체를 JSTL 변수에 할당 -->
	<c:set value="${product}" var="product" />
	
	<input id="stock" type="hidden" value="${product.stock}" /><!-- 상품재고 -->
	<input id="dimg" type="hidden" value="${product.img}" /> <!-- 상품이미지 -->
	<input id="dcateno" type="hidden" value="${product.cateno}" /> <!-- 카테고리번호 -->
	<input id="pno" type="hidden" value="${product.pno}"> <!-- 상품번호 -->
	<input id="userid" type="hidden" value="<%=sessionID%>"> <!-- 회원아이디 이걸로 회원번호 찾기 -->
	
	<div id="modifyContainer" class="btn-container" style="text-align:right; margin-top:35px;">
 		<button id="modify" type="button" onclick="modifyFunction()">상품수정</button>
		<button id="delete" type="button" onclick="delectFunction()">상품삭제</button>
	</div>
	
	<div id="nosold" class="Detail-row"><!-- display:flex -->
	 	
	 	<div class="column1">	 	
	 	
	 		<c:forEach items="${pImg}" var="pImg" varStatus="loop">
		 		<div class="mySlides">
			    <img class="img1" src="../image/${product.cateno == 1 ? '목욕' 
																	  			: product.cateno == 2 ? '배변위생'
																	  			: product.cateno == 3 ? '미용케어'
																	  			: product.cateno == 4 ? '홈리빙'
																	  			: product.cateno == 5 ? '산책놀이'
																	  			: product.cateno == 6 ? '간식영양제' 
																	  			: '의류악세서리'}/${pImg}" alt="사진없음" >
	  		</div>
  		</c:forEach>
			
		  <div class="row">
		  	<c:forEach items="${pImg}" var="pImg" varStatus="loop">
		    <div class="column">
		      <img class="demo cursor"  src="../image/${product.cateno == 1 ? '목욕' 
																	  			: product.cateno == 2 ? '배변위생'
																	  			: product.cateno == 3 ? '미용케어'
																	  			: product.cateno == 4 ? '홈리빙'
																	  			: product.cateno == 5 ? '산책놀이'
																	  			: product.cateno == 6 ? '간식영양제' 
																	  			: '의류악세서리'}/${pImg}" alt="사진없음" 
																	  			onclick="currentSlide(${loop.index + 1})">
		    </div>
		    </c:forEach>
		  </div>
	 	
	 	</div>
		
	  <div class="column2">
	  	
	  	<h2 style="margin:0 auto;">${product.pname}</h2>
	  	
	  	<p class="dprice"><fmt:formatNumber value="${product.price}" type="number" pattern="###,###,###원"/></p>
	  	
	  	<hr>
	  	
	  	<div class="c2">
		  	<b class="c2-items">${product.pname}</b><br>
		  	<!-- 상품 수량 버튼 -->
		  	<div class="c2-items">
		  		<span id="minus" class="material-symbols-outlined">indeterminate_check_box</span>
					<input id="count" name="count" class="count" type="number" value="1"> <!-- 주문 상품수량 이 값을 전송-->
					<span id="plus" class="material-symbols-outlined">add_box</span>
		  	</div><br>
		  	<b class="c2-items"><fmt:formatNumber value="${product.price}" type="number" pattern="###,###,###원"/></b>
	  	</div>
	  	
	  	
	  	<p class="totoal-price">총 상품 금액(수량) 
	  		<fmt:formatNumber value="${product.price}" type="number" pattern="###,###,###원"/>
	  		(<span id="totalcount">1</span>개)
 	  	</p> 
	  	
	  	<!-- 품절 혹은 판매중지 -->
	  	<c:if test="${product.stock == 0 || product.sell==0}">
		  	<div id="dbtn1" class="dbtn-group">
		  		<button type="button">일시 품절</button>
		  	</div>
	  	</c:if>
			
			<!-- 품절 x and 판매중 -->
	  	<c:if test="${product.stock > 0 && product.sell==1}">
		  	<div id="dbtn2" class="dbtn-group">
			  	<button id="addCart" class="dbtn" type="button" onclick="AddFuction('<%=sessionID%>')">ADD TO CART</button>
			  	<button id="order" class="dbtn" type="button" onclick="OrderFunction('<%=sessionID%>')">BUY NOW</button>
				</div>
			</c:if>
	  </div>
	  	
	</div>
	
	<div class="Detail-container1">
	  <img src="../image/상세정보/1_샤워기.jpg" alt="jpg1" width="500" height="500">
	  <img src="../image/상세정보/2_샤워기.jpg" alt="jpg2" width="500" height="500">
	  <img src="../image/상세정보/3_샤워기.jpg" alt="jpg3" width="500" height="500">
	  <img src="../image/상세정보/4_샤워기.jpg" alt="jpg4" width="500" height="500">
	  <img src="../image/상세정보/5_샤워기.jpg" alt="jpg5" width="500" height="500">
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
	</div><br><br>
	
	<!-- 리뷰 테이블 -->
	<div class="review-container">
		
		<table class="review-table">
		
			<tr class="review-th">
				<th>리뷰번호</th>
				<th>회원번호</th>
				<th>리뷰내용</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach items="${reviewList}" var="reviewList">	
				<tr class="review-tr">
					<td>${reviewList.rno}</td>
					<td>${reviewList.uno}</td>
					<td>${reviewList.content}</td>
					<td>${reviewList.nowdate}</td>
				</tr>
				
				<c:forEach items="${reviewList.reply}" var="reply">	
					<tr class="reply-tr">
						<td colspan="1">관리자</td>
						<td colspan="2" style="text-align:left; padding-left:50px;">
							ㄴRE&nbsp;&nbsp;${reply.content}
						</td>
						<td>${reply.nowdate}</td>
					</tr>
				</c:forEach>
			</c:forEach>
			
		</table>
	</div>

</div>



<!-- bottom -->
<%@ include file="../layout/bottom.jsp" %>

<!-- 상품상세 js -->
<script src="../js/ProductDetail.js"></script>

</html>