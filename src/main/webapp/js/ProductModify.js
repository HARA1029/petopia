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
//사진선택시 바로 보여주기
function previewImage() {
    var imageInput = document.getElementById('inputImg');
    var preview = document.getElementById('preview');

    if (imageInput.files && imageInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            preview.style.display = 'block';
            preview.src = e.target.result;
        };

        reader.readAsDataURL(imageInput.files[0]);
    }
}