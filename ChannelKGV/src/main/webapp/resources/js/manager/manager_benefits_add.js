$(document).ready(function () {
    $('#summernote').summernote({
        toolbar: [
            //글씨 사이즈, 폰트 선택
            ['fontsize', ['fontsize', 'fontname']],
            //정렬 
            ['para', ['ul', 'ol', 'paragraph']],
            //글씨체 굵게, 기울임, 밑줄, 지우기, 색상
            ['style', ['bold', 'italic', 'underline', 'clear', 'color']],
            //글씨 취소선, 위에, 아래
            ['font', ['strikethrough', 'superscript', 'subscript']],
            // 되돌리기, 되살리기
            ['undo', ['undo', 'redo']],
            // 이미지
            ['picture', ['picture']],
            // 테이블, 코드 뷰
            ['table', ['table', 'codeview']],
            //줄 높이 
            ['height', ['height']]],
        height: 450, // 에디터 높이 
        minHeight: null, // 최소 높이 
        maxHeight: null, // 최대 높이 
        lang: "ko-KR", //한글 설정 
        placeholder: '최대 2048자까지 쓸 수 있습니다', //placeholder 설정 
        disableResizeEditor: true,
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부

        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {
            onImageUpload: function (files, editor, welEditable) {

                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadImageFile(files[i], this);
                }
            }
        }
    });
    const jsonArray = [];

    function uploadImageFile(file, el) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: 'benefits_add/uploadImageFile',
            type: "POST",
            enctype: 'multipart/form-data',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                var json = JSON.parse(data);
                $(el).summernote('editor.insertImage', json["url"]);
                jsonArray.push(json["url"]);
                jsonFn(jsonArray);
            },
            error: function (e) {
                //console.log(e);
            }
        });
    }

    function jsonFn(jsonArray) {
        //console.log(jsonArray);
    }


    // 이벤트 이미지 등록 // 기존거 재활용함.



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
            url: 'benefits_add/uploadImage',
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
    // 날짜 비교

    let startDate = $('.start_date');
    let endDate = $('.end_date');
    let getCurrentDate = new Date();
    let currentDate = getCurrentDate.getFullYear() + "-" + ('0' + (getCurrentDate.getMonth() + 1)).slice(-2) + "-" + getCurrentDate.getDate();
    // ('0' + (getCurrentDate.getMonth() + 1)).slice(-2) 을 사용하는 이유
    // -> 앞에 0을 추가해준 상태로 출력하면, 011월 012월 같은 혼종이 나오기 때문에, 뒤에서 두자리만 자르게끔 한다.

    // 상영 종료일
    endDate.on('change', () => {

        let startValue = startDate.val(); // 시작일의 값
        let endValue = endDate.val(); // 종료일의 값

        let startArray = startValue.split('-');
        let endArray = endValue.split('-');

        // 월은 01월, 02월 같이 0부터 시작하므로 1을 뺀다.
        let checkStartDate = new Date(startArray[0], startArray[1] - 1, startArray[2]);
        let checkEndDate = new Date(endArray[0], endArray[1] - 1, endArray[2]);


        if (checkStartDate.getTime() > checkEndDate.getTime()) {
            alert('종료일은 시작일보다 빠를 수 없습니다.');
            $('.end_date').val("");
            return false;
        }

        if (!startDate.val()) {
            alert('시작일을 먼저 선택해 주세요.');
            $('.end_date').val("");
        }
    });

    // 상영 시작일
    startDate.on('change', () => {

        let currentValue = currentDate;
        let startValue = startDate.val(); // 시작일의 값

        let currentArray = currentValue.split('-');
        let startArray = startValue.split('-');

        // 월은 01월, 02월 같이 0부터 시작하므로 1을 뺀다.
        let checkCurrentDate = new Date(currentArray[0], currentArray[1] - 1, currentArray[2]);
        let checkStartDate = new Date(startArray[0], startArray[1] - 1, startArray[2]);

        if (checkStartDate.getTime() < checkCurrentDate.getTime()) {
            alert('시작일은 오늘 (' + currentDate + ') 보다 빠를 수 없습니다.');
            $('.start_date').val("");
            return false;
        }
    });

    // ===============================================================================

    const submitBtn = $('.bottom_Submit');
    const benefitsTitle = $('.enter_Title > input');
    const textArea = $('#summernote');

    submitBtn.on('click', (e) => {
        e.preventDefault();
        //console.log("제목 : " + benefitsTitle.val());
        //console.log("혜택 시작일 : " + startDate.val());
        //console.log("혜택 종료일 : " + endDate.val());
        //console.log("본문 내용 : " + textArea.val());
        //console.log("이미지 : " + imageUrl1);

        if (!benefitsTitle.val()) {
            alert('제목이 입력되지 않았습니다.');
            benefitsTitle.focus();
            e.preventDefault();
            return false;
        };

        if (!startDate.val()) {
            alert('혜택 시작일이 선택되지 않았습니다.');
            startDate.focus();
            e.preventDefault();
            return false;
        };

        if (!endDate.val()) {
            alert('혜택 종료일이 선택되지 않았습니다.');
            endDate.focus();
            e.preventDefault();
            return false;
        };

        if (!textArea.val()) {
            alert('내용이 입력되지 않았습니다.');
            textArea.focus();
            e.preventDefault();
            return false;
        };
        if (!$('.movie_image1').val()) {
            alert('메인 이미지를 등록하지 않았습니다.');
            imageUrl1.focus();
            e.preventDefault();
            return false;
        };

        $.ajax({
            url: "benefits_add/write_Event",
            data: {
                "title": benefitsTitle.val()
                , "start": startDate.val()
                , "end": endDate.val()
                , "content": textArea.val()
                , "movieImg1": imageUrl1
            },
            type: "POST",
            success: function (result) {
                if (result > 0) {
                    alert("혜택 등록 성공");
                    let url = "/movie/manager/benefits_list";
                    window.location.href = url;
                } else {
                    alert("혜택 등록 실패");
                    window.location.reload();
                }
            },

            error: function () {
                //console.log("에러 발생으로 인해 등록 실패");
            }
        });
    });









});