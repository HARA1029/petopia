//폼전송
function orderFunction() {
		var confirmation = confirm("주문 하시겠습니까?");
		
		if(confirmation) {
			document.getElementById("orderForm").submit();
		}
		else{
			location.reload(); //페이지 새로고침
		}
}

//상품만 총 구매금액
var prices = document.getElementsByName('price'); //각 상품의 개수*가격
var totalPrice = 0; //배송비를 제외한 총 상품의 가격

for (var i = 0; i < prices.length; i++) { //상품의 가격이 여러개일 경우 하나씩 받아서 합계 구하기
	 totalPrice += parseInt(prices[i].value);
}

//숫자를 "###,###,###" 형식으로 포맷
var formattedTotalPrice = totalPrice.toLocaleString('en-US');

// 주문 가격을 내부 HTML에 설정
var orderPriceElement = document.getElementById('order-price');
orderPriceElement.innerHTML = '상품구매금액 : ' + formattedTotalPrice;

//배송비
var grade = document.getElementById("grade").value;

var del = grade=='A' ? 0 : (grade=='B' ? 1000 : 2000);

var delprice = del.toLocaleString('en-US');

//배송비 내부 HTML에 설정
document.getElementById('del').innerHTML = '배송비 : ' + delprice;

//상품 총 구매금액 + 배송비 total-price
var totalOrder = totalPrice + del;

//###,###,### 형식
var totalOrderPrice = totalOrder.toLocaleString('en-US');

//내부 HTML에 설정
document.getElementById('total-price').innerHTML = '합계 : ' + totalOrderPrice;

//최종 구매금액 input에 설정
document.getElementById("total").value=totalOrder;