
$(document).ready(function () {
    // ===============================================================================

    // 이미지 등록 
    let storeImage = $('#storeImage')


    storeImage.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {

            if (!checkExtension(e.target.files[i].name, e.target.files[i].size)) {
                storeImage.val('');
                return false;
            }


        }
        uploadImageFile1(e.target.files[i]); // 파일 전달
    });

    let imageUrl1;

    function uploadImageFile1(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: 'store_add/uploadImageFile',
            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data1) {
                // console.log("성공 후 반환 메시지11", data1);
                let jsonArray = JSON.parse(data1); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl1 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                // console.log("이미지 URL:", imageUrl1);
            },
            error: function (e) {
                // console.log(e);
            }
        });
    }



    let storeImageBig = $('#storeImageBig')

    storeImageBig.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {
            if (!checkExtension(e.target.files[i].name, e.target.files[i].size)) {
                storeImageBig.val('');
                return false;
            }
        }
        uploadImageFile2(e.target.files[i]); // 파일 전달
    });


    let imageUrl2;

    function uploadImageFile2(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: 'store_add/uploadImageFile',
            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data2) {
                // console.log("성공 후 반환 메시지22", data2);
                let jsonArray = JSON.parse(data2); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl2 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                // console.log("이미지 URL:", imageUrl2);
            },
            error: function (e) {
                // console.log(e);
            }
        });
    }



    let regex = new RegExp("(.*?\.(png|jpg|gif|jpeg)$)");
    let maxSize = 5000000; // 5MB 제한

    function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
        }
        if (!regex.test(fileName)) {
            alert("해당 종류 파일은 업로드 안됨.\n PNG, JPG, GIF, JPEG 만 가능합니다.");
            return false;
        }
        return true;
    };






    // ===============================================================================
    // 유효성검사 기능





    let nameCheck = false;

    const titleRegex = /^[가-힣|a-z|A-Z|0-9|{1,}$/()\s]+$/;

    $("#storeName").on("input", function () {
        if (titleRegex.test($(this).val())) {

            // console.log($(this).val());
            $.ajax({
                url: "store_add/NameDupCheck",
                data: { "storeName": $(this).val() },
                type: "GET",
                success: function (result) {
                    if (result == 1) {
                        $("#storeNameMessage").text("중복!");
                        nameCheck = false;
                    } else {
                        $("#storeNameMessage").text("유효!");
                        nameCheck = true;
                    }
                },
                error: function () {
                    // console.log("에러 발생");
                }
            });
        } else {
            $("#storeNameMessage").text("적절하지 않은 이름입니다!");
            nameCheck = false;
        }
    });







    $('.bottom_Submit').on("click", function (e) {

        // console.log('저장버튼이 눌림.');



        if (!$("#storeCategory").val()) {
            alert('선택되지 않았습니다.');
            $("#storeCategory").focus();
            e.preventDefault();
            return;
        }
        else if (!$("#storeName").val()) {
            alert('상품 이름이 입력되지 않았습니다.');
            $("#storeName").focus();
            e.preventDefault();
            return;
        }
        else if (nameCheck === false) {
            alert('상품 이름이 중복되었습니다.');
            $("#storeName").focus();
            e.preventDefault();
            return;
        }
        else if (!$("#storeDesc").val()) {
            alert('상품 설명이 입력되지 않았습니다.');
            $("#storeDesc").focus();
            e.preventDefault();
            return;
        }
        else if (!$("#storePrice").val()) {
            alert('상영 가격이 입력되지 않았습니다.');
            $("#storePrice").focus();
            e.preventDefault();
            return;
        }
        else if (!$("#storeStock").val()) {
            alert('제한 개수가 입력되지 않았습니다.');
            $("#storeStock").focus();
            e.preventDefault();
            return;
        }
        else if (!$("#storeImage").val()) {
            alert('이미지가 입력되지 않았습니다.');
            $("#storeImage").focus();
            e.preventDefault();
            return;
        }
        else if (!$("#storeImageBig").val()) {
            alert('빅 이미지가 입력되지 않았습니다.');
            $("#storeImageBig").focus();
            e.preventDefault();
            return;
        }


        $.ajax({
            url: "store_add/addStore",
            data: {
                "storeCategory": $("#storeCategory").val()
                , "storeName": $("#storeName").val()
                , "storeDesc": $("#storeDesc").val()
                , "storePrice": $("#storePrice").val()
                , "storeStock": $("#storeStock").val()
                , "storeImage": imageUrl1
                , "storeImageBig": imageUrl2

            },
            type: "POST",
            success: function (result) {
                if (result > 0) {
                    alert("스토어 물품 등록 성공");
                    window.location.reload();
                    let url = "/movie/manager/store_list";
                    window.location.href = url;
                } else {
                    alert("스토어 물품 등록 실패");

                }
            },

            error: function () {
                // console.log("에러 발생으로 인해 등록 실패");
            }
        });


        // console.log("상품 카테고리 : " + $("#storeCategory").val());
        // console.log("상품 이름 : " + $("#storeName").val());
        // console.log("상품 설명 : " + $("#storeDesc").val());
        // console.log("상품 가격 : " + $("#storePrice").val());
        // console.log("개수제한 : " + $("#storeStock").val());
        // console.log("상품 이미지 : " + $("#storeImage").val());
        // console.log("상품 이미지 : " + imageUrl1);
        // console.log("상품 빅 이미지 : " + imageUrl2);


    });




});

