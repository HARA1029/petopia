var Submit = document.getElementById("Submit");

/* 체크한 상품만 주문페이지 이동 */
function orderFunction() {
	Submit.value = "orderView";
	document.getElementById("cart-form").submit(); //폼 전송
}

/* 체크한 상품만 삭제 */
function deleteFunction() {
	Submit.value = "delete";
	document.getElementById("cart-form").submit(); //폼 전송
}