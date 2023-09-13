//재고 선택 메서드
function stockSelect() {
    var select = document.getElementById("p_stock");
    var Inputstock = document.getElementById("p_stock_input");

    if (select.value === "0") {
        // "직접입력" 선택 시 입력란 표시
        Inputstock.value="";
        Inputstock.focus();
    } else {
    	Inputstock.value = select.value;
    }
}

//사진선택시 바로 보여주기 + 파일명 문자열 하나로 합치기
var imageInput = document.getElementById('inputImg');
var preview = document.getElementById('preview');
    
imageInput.addEventListener("blur", function() {
	
	var fileNames = ""; // 파일 이름을 저장할 배열
	
	if(imageInput.files.length > 5) {
		alert("이미지 업로드는 5개까지만 가능합니다.");
		imageInput.value="";//초기화
		//파일명 초기화
		imageInput.focus();
		
	}
	else {
		preview.innerHTML = ''; // 이미지를 미리보기하기 전에 이전 이미지를 지우기
	
    for (var i = 0; i < imageInput.files.length; i++) {
	    
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = document.createElement('img');
            img.src = e.target.result;
            img.style.width = '200px'; // 이미지 크기 조절
            img.style.height = '100%';
            img.classList.add('preview'); // 이미지에 CSS 클래스를 추가합니다.
            preview.appendChild(img);
        };
				//파일이미지 보여주기
        reader.readAsDataURL(imageInput.files[i]);
        //수정한 파일명
        fileNames += imageInput.files[i].name;
        fileNames += i == (imageInput.files.length-1) ? "" : ",";
        
    }
    
    document.getElementById("imgName").value = fileNames;//업로드할 파일명 여러개를 문자열로 합해서 db에 전송할 이미지 파일명 값에 저장
    
	}
		
});