document.addEventListener("DOMContentLoaded", function() {
    const form = document.forms["signupForm"];
    const checkIdButton = document.getElementById("checkId");
    let isIdChecked = false;
    
    // 아이디 중복 버튼 처리
    checkIdButton.addEventListener("click", function() {
        const idInput = form.querySelector("input[name='id']");
        const id = idInput.value.trim();

        if (!/^[a-zA-Z0-9]{2,8}$/.test(id)) {
            alert("아이디는 2자에서 8자 사이여야 합니다.");
            idInput.focus();
            return;
        }

        // AJAX를 사용하여 서버에 아이디 중복 확인 요청 보내기
        const xhr = new XMLHttpRequest();
        xhr.open("GET", "../Controller/controller.jsp?action=checkID&id=" + id, true);
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
    
    // 비밀번호 & 비밀번호 확인 일치 처리
    var pwInput = document.getElementById("pw");
	var pw2Input = document.getElementById("pw2");
	var passwordMismatchMsg = document.getElementById("passwordMismatch");
	
	pw2Input.addEventListener("keyup", function () {
	    if (pwInput.value === pw2Input.value) {
	        passwordMismatchMsg.style.display = "none";
	    } else {
	        passwordMismatchMsg.style.display = "block";
	    }
	});
	
	// 가입하기 눌렀을 때 처리
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

        /// 이메일 검증
		const emailInput = form.querySelector("input[name='mail1']");
		const emailInput2 = form.querySelector("input[name='mail2']");
		const email1 = emailInput.value.trim();
		const email2 = emailInput2.value.trim();
		const email = email1 + "@" + email2;
		
		const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (!emailPattern.test(email)) {
		    alert("유효한 이메일 주소를 입력해주세요.");
		    emailInput.focus();
		    event.preventDefault();
		    return;
		}

        // 전화번호 검증
		const telInput1 = form.querySelector("select[name='tel1']");
		const telInput2 = form.querySelector("input[name='tel2']");
		const telInput3 = form.querySelector("input[name='tel3']");
		const tel1 = telInput1.value;
		const tel2 = telInput2.value.trim();
		const tel3 = telInput3.value.trim();
		
		if (!tel1) {
		    alert("전화번호 첫 번째 부분을 선택해주세요.");
		    telInput1.focus();
		    event.preventDefault();
		    return;
		}
		
		if (!/^[0-9]{3,4}$/.test(tel2)) {
		    alert("유효한 전화번호 형식을 입력해주세요. (3자리 또는 4자리)");
		    telInput2.focus();
		    event.preventDefault();
		    return;
		}
		
		if (!/^[0-9]{4}$/.test(tel3)) {
		    alert("유효한 전화번호 형식을 입력해주세요. (4자리)");
		    telInput3.focus();
		    event.preventDefault();
		    return;
		}

    });

});

// 이메일 셀렉트에서 설정한 값으로 변경하기
function changeEmailDomain(selectElement) {
    var emailInput2 = document.getElementsByName("mail2")[0];
    var selectedDomain = selectElement.value;
    
    if (selectedDomain === "직접입력") {
        emailInput2.value = "";
    } else {
        emailInput2.value = selectedDomain;
    }
}

// 주소 API 사용
function click_searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }

                var fullAddress = addr;
                if (extraAddr !== '') {
                    fullAddress += extraAddr;
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = fullAddress;
                document.getElementById("addr2").value = ''; // 상세 주소 필드 초기화
            }
        }).open();
    }
