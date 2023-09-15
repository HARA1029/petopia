function withdrawal(e) {
    e.preventDefault(); // 폼의 기본 동작 막음

    var result = confirm("탈퇴하시겠습니까?");
    if (result == true) { 
        alert("탈퇴가 완료되었습니다.");
        //document.withdrawalForm.action = "../Controller/controller.jsp";
        document.withdrawalForm.submit();
    } else {
        alert("탈퇴가 취소되었습니다.");
        // 폼 제출을 막기 위해 아무 동작도 하지 않음
    }
}