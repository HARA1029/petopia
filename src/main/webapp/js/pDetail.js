/* 상품수량 증가&감소 */
var minusBtn = document.getElementById("minus");
var plusBtn = document.getElementById("plus");
var pCount = document.getElementById("count"); //주문할 상품 수량
var stock = parseInt(document.getElementById("stock").value); //상품재고수량
var tCount = document.getElementById("totalcount"); //충 구매수량(이건 보여주는것만)

/* 상품수량 감소 */
minusBtn.addEventListener("click", function() {
	pCount.value--;
	if(pCount.value<1) {
		alert("최소 구매 수량은 1개 입니다.");
		pCount.value=1;
		pCount.focus();
	}
	tCount.textContent=pCount.value;//증가,감소 보여주는 구매수량도 바로 적용
});

/* 상품수량 증가 */
plusBtn.addEventListener("click", function() {
	pCount.value++;
	if(pCount.value > stock) {
		alert("재고가 부족합니다.");
		--pCount.value;
		pCount.focus();
	}
	tCount.textContent=pCount.value;
}); 

var uno = document.getElementById("uno").value; //회원번호
var pno = document.getElementById("pno").value; //상품번호

/* 장바구니 담기  */
function AddFuction() {
	alert("장바구니로 이동");
	location.href = '../Controller/UserController.jsp?submit=addCart&uno='+uno+'&pno='+pno+'&count='+pCount.value;
}

/* 상품수정  */
function modifyFunction() {
	//var mpno = document.getElementById("pno").value; //상품번호
	location.href = '../Controller/ManagerController.jsp?submit=pModify_veiw&pno='+pno;
}

/* 상품 삭제 */
function delectFunction() {
	var dimg = document.getElementById("dimg").value; //상품이미지
	var confirmation = confirm("삭제하시겠습니까?");
				    
  // 사용자의 선택에 따라 다른 동작을 수행합니다.
  if (confirmation) {
  	location.href = '../Controller/ManagerController.jsp?submit=delete&pno='+pno +"&dimg=" + dimg;
  } else {
  	location.reload();//페이지 새로고침
  }
}

//주의사항(이게 먼저와야됨)
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}


/* 상품이미지 선택시 보여주기 */
let slideIndex = 1;
showSlides(slideIndex);

function currentSlide(n) {
  showSlides(slideIndex = n); 
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("demo");
  let captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  //captionText.innerHTML = dots[slideIndex-1].alt;
}