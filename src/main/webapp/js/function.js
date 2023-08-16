function loginerror1() {
    alert('로그인에 실패하였습니다.');
    location.href = 'login.jsp';
}

function loginerror2() {
    alert('없는 ID 입니다.');
    location.href = 'login.jsp';
}

function goLogin() {
      window.location.href = "login.jsp";
}
    
function goMain() {
      window.location.href = "main.jsp";
}