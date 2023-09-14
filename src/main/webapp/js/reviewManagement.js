document.addEventListener("DOMContentLoaded", function() {
	const answerButtons = document.querySelectorAll(".answer-btn");
	const modalRows = document.querySelectorAll(".modal-row");
	const maxBytes = 100; // 최대 바이트 수

	// 페이지 로드 시에는 모든 모달 폼을 숨깁니다.
	modalRows.forEach(row => {
		row.style.display = "none";
	});

	answerButtons.forEach(button => {
		button.addEventListener("click", function() {
			const rno = this.getAttribute("data-rno");
			const modalRow = document.querySelector(`.modal-row[data-rno="${rno}"]`);
			const textarea = modalRow.querySelector(".review-textarea");


			// 모든 모달 폼을 숨긴 후 선택한 모달 폼만 보이도록 설정합니다.
			modalRows.forEach(row => {
				row.style.display = "none";
			});
			modalRow.style.display = "table-row";

		});
	});

	modalRows.forEach(modalRow => {
		const closeButton = modalRow.querySelector(".close-btn");
		const rno = modalRow.getAttribute("data-rno");
		const textarea = modalRow.querySelector(".reply-textarea");

		closeButton.addEventListener("click", function() {

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

	const updateButton = document.querySelectorAll(".update-btn");

	updateButton.forEach(button => {
		button.addEventListener("click", function(event) {
			const isConfirmed = confirm("등록하시겠습니까?");
			if (isConfirmed) {
				alert("등록이 완료되었습니다.");
			}
			else{
				event.preventDefault(); 
				alert("등록이 취소되었습니다.");
			}
		});
	});

	const deleteButton = document.querySelectorAll(".delete-btn");

	deleteButton.forEach(button => {
		button.addEventListener("click", function(event) {
			const isConfirmed = confirm("삭제 하시겠습니까?");
			if (isConfirmed) {
				
				alert("삭제가 완료되었습니다.");
			}
			else{
				event.preventDefault(); 
				alert("삭제가 취소되었습니다.");
			}
		});
	});

});