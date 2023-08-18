function editId() {
    alert('아이디는 수정 불가능합니다.');
    location.href = 'edit.jsp';
    id.foucs();
}
function editName() {
    alert('이름은 개명한 경우만 수정 가능합니다.');
    location.href = 'edit.jsp';
    uname.foucs();
}

function editGrade() {
    alert('등급은 수정 불가능합니다.');
    location.href = 'edit.jsp';
    grade.foucs();
}

function checkAndUpdate() {
    var u_mail = document.editForm.mail.value;
    var u_addr = document.editForm.addr.value;
    var u_tel = document.editForm.tel.value;
    var original_mail = '<%= sessionMail %>';
    var original_addr = '<%= sessionAddr %>';
    var original_tel = '<%= sessionTel %>';
    
     if (u_mail === original_mail && u_addr === original_addr && u_tel === original_tel) {
        // 변경된 내용 없음
        alert("변경된 내용이 없습니다.");
        return false; // 폼 제출 취소
    }
    
    if(document.editForm.value === "") {
			alert("모든 칸을 채워주세요.")
	}

    return confirm("변경된 내용을 저장하시겠습니까?");
  
}


