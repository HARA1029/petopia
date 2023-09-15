var Submit = document.getElementById("Submit");

var checkboxes = document.querySelectorAll('input[id="productCheck"]');
// 체크박스 요소들의 상태를 확인하고 체크된 개수를 저장할 변수를 초기화합니다.
var checkedCount = 0;

/* 체크한 상품만 주문페이지 이동 */
function orderFunction() {

	checkedCount = 0;
	
	// 모든 체크박스 요소를 반복하면서 체크된 것들을 세어봅니다.
	for (var i = 0; i < checkboxes.length; i++) {
	    if (checkboxes[i].checked) {
	        checkedCount++;
	    }
	}
	
	if(checkedCount == 0) {
		alert("주문할 상품이 없습니다.");
	}
	else {
		Submit.value = "orderView";
		document.getElementById("cart-form").submit(); //폼 전송
	}
}

/* 체크한 상품만 삭제 */
function deleteFunction() {

	checkedCount = 0;
	
	// 모든 체크박스 요소를 반복하면서 체크된 것들을 세어봅니다.
	for (var i = 0; i < checkboxes.length; i++) {
	    if (checkboxes[i].checked) {
	        checkedCount++;
	    }
	}
	
	if(checkedCount == 0) {
		alert("삭제할 상품이 없습니다.");
	}
	else {
		Submit.value = "delete";
		document.getElementById("cart-form").submit(); //폼 전송		
	}

}