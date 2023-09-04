document.addEventListener('DOMContentLoaded', function() {
	
	var id = document.getElementById("id").value
	
	var registerBtn = document.getElementById("registerBtn");

	if (id === "kosa") {
	    // id 값이 "kods(관리자)"일 때 버튼을 보이게 설정
	    registerBtn.style.display = "block";
	} else {
	    // 그 외의 경우 버튼을 숨김
	    registerBtn.style.display = "none";
	}
	
});

function registerFunction() {
	location.href = '../view/ProductRegister_view.jsp';
}