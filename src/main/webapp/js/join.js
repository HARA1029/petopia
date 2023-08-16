document.addEventListener("DOMContentLoaded", function() {
    const form = document.forms["signupForm"];
    const checkIdButton = document.getElementById("checkId");
    let isIdChecked = false;
    
    checkIdButton.addEventListener("click", function() {
        const idInput = form.querySelector("input[name='id']");
        const id = idInput.value.trim();

        if (!/^[a-zA-Z0-9]{2,8}$/.test(id)) {
            alert("아이디는 영문과 숫자로 이루어진 2자에서 8자 사이여야 합니다.");
            idInput.focus();
            return;
        }

        // AJAX를 사용하여 서버에 아이디 중복 확인 요청 보내기
        const xhr = new XMLHttpRequest();
        xhr.open("GET", "controller.jsp?action=checkID&id=" + id, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const response = xhr.responseText;
                    if (response.includes("중복된 id입니다.")) {
                        alert("중복된 아이디입니다.");
                        isIdChecked = false;
                    } else if (response.includes("사용 가능한 id입니다.")) {
                        alert("사용 가능한 아이디입니다.");
                        isIdChecked = true;
                    } else {
                        alert("서버 응답 오류");
                    }
                } else {
                    alert("서버와의 통신 중 문제가 발생했습니다.");
                }
            }
        };
        xhr.send();
    });

    form.addEventListener("submit", function(event) {
        
        // 아이디 중복 확인 버튼 실행 확인
        if (!isIdChecked) {  // 아이디 중복 확인을 하지 않았을 경우
            alert("아이디 중복 확인을 해주세요.");
            event.preventDefault();
            return;
        }
                
        // 빈 필드 검증
        const inputs = form.querySelectorAll("input[type='text'], input[type='password'], input[type='email']");

        for (const input of inputs) {
            if (input.value.trim() === "") {
                alert("모든 필드를 입력해주세요.");
                input.focus();
                event.preventDefault();
                return;
            }
        }

        // 이름 검증
        const usernameInput = form.querySelector("input[name='uname']");
        const username = usernameInput.value.trim();
        if (username.length < 2 || username.length > 6) {
            alert("사용자명은 2자에서 6자 사이여야 합니다.");
            usernameInput.focus();
            event.preventDefault();
            return;
        }

        // 아이디 검증
        const idInput = form.querySelector("input[name='id']");
        const id = idInput.value.trim();
        if (!/^[a-zA-Z0-9]{2,8}$/.test(id)) {
            alert("아이디는 영문과 숫자로 이루어진 2자에서 8자 사이여야 합니다.");
            idInput.focus();
            event.preventDefault();
            return;
        }

        // 비밀번호 검증
        const pwInput = form.querySelector("input[name='pw']");
        const password = pwInput.value.trim();
        if (!/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/.test(password)) {
            alert("비밀번호는 영문자와 숫자를 모두 포함하며 최소 8자 이상이어야 합니다.");
            pwInput.focus();
            event.preventDefault();
            return;
        }

        // 이메일 검증
        const emailInput = form.querySelector("input[name='mail']");
        const email = emailInput.value.trim();
        if (!email.includes("@")) {
            alert("유효한 이메일 주소를 입력해주세요.");
            emailInput.focus();
            event.preventDefault();
            return;
        }

        // 전화번호 검증
        const telInput = form.querySelector("input[name='tel']");
        const tel = telInput.value.trim();
        if (!/^01[0-1]-\d{3,4}-\d{4}$/.test(tel)) {
            alert("유효한 전화번호 형식을 입력해주세요. (예: 010-1234-5678)");
            telInput.focus();
            event.preventDefault();
            return;
        }
    });
});