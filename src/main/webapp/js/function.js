//login
function loginerror1() {
    alert('로그인에 실패하였습니다.');
    location.href = 'login.jsp';
}

function loginerror2() {
    alert('없는 ID 입니다.');
    location.href = 'login.jsp';
}

// 회원가입 완료 후 버튼
function goLogin() {
      window.location.href = "login.jsp";
}
    
function goMain() {
      window.location.href = "main.jsp";
}

// 공지 삭제 alert
function deleteNotice(event) {
	event.preventDefault();
	
	var result = confirm("삭제하시겠습니까?");
	
	if(result){
		alert("삭제가 완료되었습니다.");
		document.noticeDeleteForm.action = "/petopia/Controller/controller.jsp";
		document.noticeDeleteForm.submit();
	} else{
		alert("삭제가 취소되었습니다.");
		
	}
}