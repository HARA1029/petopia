document.addEventListener("DOMContentLoaded", function() {
    const editButtons = document.querySelectorAll(".edit-btn");
    const modalRows = document.querySelectorAll(".modal-row");
    const maxBytes = 100; // 최대 바이트 수

    let originalText = {}; // 기존 텍스트를 저장할 객체

    // 페이지 로드 시에는 모든 모달 폼을 숨깁니다.
    modalRows.forEach(row => {
        row.style.display = "none";
    });

    editButtons.forEach(button => {
        button.addEventListener("click", function() {
            const rno = this.getAttribute("data-rno");
            const modalRow = document.querySelector(`.modal-row[data-rno="${rno}"]`);
            const textarea = modalRow.querySelector(".review-textarea");

            // 기존 텍스트를 저장
            originalText[rno] = textarea.value;

            // 모든 모달 폼을 숨긴 후 선택한 모달 폼만 보이도록 설정합니다.
            modalRows.forEach(row => {
                row.style.display = "none";
            });
            modalRow.style.display = "table-row";

            // 수정 버튼 클릭 시 리뷰 내용의 바이트 길이를 표시
            const charCount = modalRow.querySelector(".char-count");
            const currentCount = charCount.querySelector(".current-count");
            const text = textarea.value;
            const byteCount = getByteCount(text);
            currentCount.textContent = byteCount;
        });
    });

    modalRows.forEach(modalRow => {
        const closeButton = modalRow.querySelector(".close-btn");
        const rno = modalRow.getAttribute("data-rno");
        const textarea = modalRow.querySelector(".review-textarea");

        closeButton.addEventListener("click", function() {
            const text = textarea.value;
            const charCount = modalRow.querySelector(".char-count");
            const currentCount = charCount.querySelector(".current-count");

            // 기존 내용 복원
            if (originalText.hasOwnProperty(rno)) {
                textarea.value = originalText[rno];
                const byteCount = getByteCount(text);
                currentCount.textContent = byteCount;
            }

            modalRow.style.display = "none";
        });

        const charCount = modalRow.querySelector(".char-count");
        const currentCount = charCount.querySelector(".current-count");

        textarea.addEventListener("input", function() {
            const text = textarea.value;
            const byteCount = getByteCount(text);

            currentCount.textContent = byteCount;

            if (byteCount > maxBytes) {
                charCount.style.color = "red";
                textarea.value = cutTextToMaxBytes(text, maxBytes); // 초과된 부분 잘라내기
                alert('최대 100Byte까지만 입력 가능합니다.');
            } else {
                charCount.style.color = "black";
            }
        });
    });

    function getByteCount(text) {
        const blob = new Blob([text]);
        return blob.size;
    }

    function cutTextToMaxBytes(text, maxBytes) {
        let totalBytes = 0;
        let result = '';

        for (let i = 0; i < text.length; i++) {
            const char = text.charAt(i);
            const charBytes = getByteCount(char);

            if (totalBytes + charBytes > maxBytes) {
                break;
            }

            result += char;
            totalBytes += charBytes;
        }

        return result;
    }
    
    const updateButtons = document.querySelectorAll(".update-btn");
    updateButtons.forEach(button => {
        button.addEventListener("click", function(e) {
            //e.preventDefault(); // 폼의 기본 동작 막음

            var result = confirm("수정하시겠습니까?");
            if (result) { 
                alert("수정이 완료되었습니다.");
                document.updateForm.action = "myList.jsp";
       				  document.updateForm.submit();
            } else {
                alert("수정이 취소되었습니다.");
                // 폼 제출을 막기 위해 아무 동작도 하지 않음
            }
        });
    });

});