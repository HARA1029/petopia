function editconfirm() {
    // e.preventDefault(); // 기본 동작 막음

    var enteredPassword; // 사용자로부터 비밀번호 입력 받음

    if (enteredPassword !== null) { // 사용자가 입력을 취소하지 않은 경우
        // 아래 줄을 서버에서 비밀번호 확인하는 로직으로 대체해야 합니다.
        var correctPassword = "dbPW"; // 실제 비밀번호가 저장된 변수

        if (enteredPassword === correctPassword) { 
            document.editConfirmForm.action = "controller.jsp?action=editConfirm"; // 수정 액션을 호출
            document.editConfirmForm.userPW.value = enteredPassword; // 입력한 비밀번호를 hidden 필드에 설정
            document.editConfirmForm.submit();
        } else {
            alert("비밀번호가 틀렸습니다. 다시 입력해주세요.");
            // 폼 제출을 막기 위해 아무 동작도 하지 않음
        }
    }
}
