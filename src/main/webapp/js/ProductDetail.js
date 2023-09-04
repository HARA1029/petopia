document.addEventListener('DOMContentLoaded', function() {
	
	var userid = document.getElementById("id").value
	
	var modifyContainer = document.getElementById("modifyContainer")
	

	if (userid === "kosa") {
	    // userid 값이 "kosa"일 때 버튼을 보이게 설정
	    modifyContainer.style.display = "block";
	} else {
	    // 그 외의 경우 버튼을 숨김
	    modifyContainer.style.display = "none";
	}
	
});

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

/* 상품 수량 직접 입력했을 때 */
document.getElementById("count").addEventListener("change", function() {
    var inputValue = parseInt(this.value); // 입력값을 정수로 변환

    if (inputValue > stock) {
      alert("재고가 부족합니다.");
      this.value = 1; // 입력값을 1로 리셋
    }
});

//var userid = document.getElementById("userid").value; //회원아이디
var pno = document.getElementById("pno").value; //상품번호

/* 장바구니 담기  */
function AddFuction(id) {
	
	alert(id); /*지울거************************************/
	
	if(id==="null") {
		alert("로그인을 먼저해주세요.");
		return;
	}
	else {
		var confirmation = confirm("장바구니 이동로 이동하시겠습니까?");
		
		if(confirmation) {
			location.href = '../Controller/UserController.jsp?Submit=addCart&id='+id+'&pno='+pno+'&count='+pCount.value;
		}
		else{
			location.reload(); //페이지 새로고침
		}
	}
}

/* 바로 주문하기 */
function OrderFunction(id) {
	
	if(id==="null") {
		alert("로그인을 먼저해주세요.");
		return;
	}
	
	else{
		confirmation = confirm("바로 주문하시겠습니까?");
		
		if(confirmation) {
			location.href = '../Controller/UserController.jsp?Submit=orderView&dir=0&id='+id+'&pno='+pno+'&count='+pCount.value;
		}
		else{
			location.reload(); //페이지 새로고침
		}	
	}
	
}

/* 상품수정  */
function modifyFunction() {
	var mpno = document.getElementById("pno").value; //상품번호
	location.href = '../Controller/ManagerController.jsp?Submit=pModify_veiw&pno='+mpno;
}

/* 상품 삭제 */
function delectFunction() {
	
	var dimg = document.getElementById("dimg").value; //상품이미지
	var dcateno = document.getElementById("dcateno").value; //카테고리 번호
	var confirmation = confirm("삭제하시겠습니까?" + dcateno);
				    
  // 사용자의 선택에 따라 다른 동작을 수행합니다.
  if (confirmation) {
  	location.href = '../Controller/ManagerController.jsp?Submit=delete&pno='+pno +"&dimg=" + dimg + "&cateno=" + dcateno;
  } else {
  	location.reload();//페이지 새로고침
  }
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
  //let captionText = document.getElementById("caption");
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