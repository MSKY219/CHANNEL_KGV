$(document).ready(function () {

    let movie_image1 = $('.movie_image1');

    movie_image1.on('change', function (e) {
        //console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {

            if (!checkExtension(e.target.files[i].name, e.target.files[i].size)) {
                movie_image1.val('');
                return false;
            }

            uploadImageFile1(e.target.files[i]); // 파일 전달
        }
    });

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

    let imageUrl1;

    function uploadImageFile1(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({

            url: '/movie/manager/banner_list/edit/' + bannerNo.val() + '/uploadImageFile',

            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data1) {
                //console.log("성공 후 반환 메시지11", data1);
                let jsonArray = JSON.parse(data1); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl1 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                //console.log("이미지 URL:", imageUrl1);
            },
            error: function (e) {
                //console.log(e);
            }
        });
    }

    // ===============================================================================

    const submitBtn = $('.bottom_Submit');
    const eventTitle = $('.enter_Title > input');
    const enterUrl = $('.enter_url > input');
    const bannerNo = $('.bannerNo');
    const hiddenImg = $('.hiddenImg');

    submitBtn.on('click', (e) => {

        // 이미지 변경이 없을 경우
        if ($('.movie_image1').val() == "") {

            //console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image1').val());
            imageUrl1 = hiddenImg.val();

            //console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl1);

        }
        // 이미지를 변경 할 경우
        // 기존 로직을 그대로 사용한다.
        // 이미지 삭제는 고려하지 않음. 반드시 이미지는 들어가야 함.





        e.preventDefault();
        //console.log("제목 : " + eventTitle.val());
        //console.log("URL : " + enterUrl.val());
        //console.log("이미지 : " + imageUrl1);
        //console.log("숨겨진 이미지 URL : " + hiddenImg.val());
        //console.log("배너 번호 : " + bannerNo.val());

        if (!eventTitle.val()) {
            alert('제목이 입력되지 않았습니다.');
            eventTitle.focus();
            e.preventDefault();
            return false;
        };

        $.ajax({

            url: "/movie/manager/banner_list/edit/" + bannerNo.val() + "/edit",
            data: {
                title: eventTitle.val()
                , url: enterUrl.val()
                , movieImg1: imageUrl1
                , bannerNo: bannerNo.val()

            },
            type: "POST",
            success: function (result) {
                if (result > 0) {

                    alert("배너 수정 성공");
                    let url = "/movie/manager/banner_list";

                    window.location.href = url;
                } else {
                    alert("배너 수정 실패");
                    window.location.reload();
                }
            },

            error: function () {
                //console.log("에러 발생으로 인해 배너 수정 실패");
            }
        });
    });


});


function readURL(input) {

    if (input.files && input.files[0]) {

        const reader = new FileReader();

        reader.onload = function (e) {

            $('#imgSize')[0].src = e.target.result;

        };

        reader.readAsDataURL(input.files[0]);

    } else {

        $('#imgSize')[0].src = "";

    }
}