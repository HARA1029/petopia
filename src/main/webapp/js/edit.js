function editId() {
    alert('아이디는 수정 불가능합니다.');
    // location.href = 'edit.jsp'; // 주석 처리하여 페이지 이동 방지
    document.editForm.id.focus(); // 포커스 설정
}

function editName() {
    alert('이름은 개명한 경우만 수정 가능합니다.');
    // location.href = 'edit.jsp'; // 주석 처리하여 페이지 이동 방지
    document.editForm.uname.focus(); // 포커스 설정
}

function editGrade() {
    alert('등급은 수정 불가능합니다.');
    // location.href = 'edit.jsp'; // 주석 처리하여 페이지 이동 방지
    document.editForm.grade.focus(); // 포커스 설정
}

function checkAndUpdate() {
    const u_pw = document.editForm.pw.value;
    const u_mail = document.editForm.mail.value;
    const u_addr = document.editForm.addr.value;
    const u_tel = document.editForm.tel.value;

    const original_mail = document.getElementById("mail").getAttribute("value");
    const original_addr = document.getElementById("addr").getAttribute("value");
    const original_tel = document.getElementById("tel").getAttribute("value");

    if (u_pw === "") {
        alert("비밀번호를 입력하세요.");
        document.editForm.pw.focus(); // 포커스 설정
        return false;
    }

    if (u_mail === "" || u_addr === "" || u_tel === "") {
        alert("빈 칸을 입력하세요.");
        return false;
    } else if (u_mail === original_mail && u_addr === original_addr && u_tel === original_tel) {
        alert("변경된 내용이 없습니다.");
        return false;
    }

    return confirm("변경된 내용을 저장하시겠습니까?");
}
