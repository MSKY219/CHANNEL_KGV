$(document).ready(function () {


    const movieNo = $('#movieNo');


    // 이미지 등록 테스트1 ========================================
    let movie_image1 = $('.movie_image1');

    movie_image1.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

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
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit/uploadImageFile",
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



    // 이미지 등록 테스트2 ========================================
    let movie_image2 = $('.movie_image2');

    movie_image2.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {
            uploadImageFile2(e.target.files[i]); // 파일 전달
        }
    });

    let imageUrl2;

    function uploadImageFile2(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit/uploadImageFile",
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
    // 이미지 등록 테스트3 ========================================
    let movie_image3 = $('.movie_image3');

    movie_image3.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {
            uploadImageFile3(e.target.files[i]); // 파일 전달
        }
    });

    let imageUrl3;

    function uploadImageFile3(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit/uploadImageFile",
            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data3) {
                // console.log("성공 후 반환 메시지33", data3);
                let jsonArray = JSON.parse(data3); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl3 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                // console.log("이미지 URL:", imageUrl3);
            },
            error: function (e) {
                // console.log(e);
            }
        });
    }
    // 이미지 등록 테스트4 ========================================
    let movie_image4 = $('.movie_image4');

    movie_image4.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {
            uploadImageFile4(e.target.files[i]); // 파일 전달
        }
    });

    let imageUrl4;

    function uploadImageFile4(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit/uploadImageFile",
            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data4) {
                // console.log("성공 후 반환 메시지44", data4);
                let jsonArray = JSON.parse(data4); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl4 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                // console.log("이미지 URL:", imageUrl4);
            },
            error: function (e) {
                // console.log(e);
            }
        });
    }
    // 이미지 등록 테스트5 ========================================
    let movie_image5 = $('.movie_image5');

    movie_image5.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {
            uploadImageFile5(e.target.files[i]); // 파일 전달
        }
    });

    let imageUrl5;

    function uploadImageFile5(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit/uploadImageFile",
            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data5) {
                // console.log("성공 후 반환 메시지55", data5);
                let jsonArray = JSON.parse(data5); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl5 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                // console.log("이미지 URL:", imageUrl5);
            },
            error: function (e) {
                // console.log(e);
            }
        });
    }
    // 이미지 등록 테스트6 ========================================
    let movie_image6 = $('.movie_image6');

    movie_image6.on('change', function (e) {
        // console.log(e.target.files); // 파일 목록 출력

        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = 0; i < e.target.files.length; i++) {
            uploadImageFile6(e.target.files[i]); // 파일 전달
        }
    });

    let imageUrl6;

    function uploadImageFile6(file) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit/uploadImageFile",
            type: "POST",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data6) {
                // console.log("성공 후 반환 메시지66", data6);
                let jsonArray = JSON.parse(data6); // JSON 문자열을 파싱하여 배열로 변환
                let imageObject = jsonArray[0]; // 배열의 첫 번째 요소 선택
                imageUrl6 = imageObject[""]; // 빈 키에 해당하는 이미지 URL 선택
                // console.log("이미지 URL:", imageUrl6);
            },
            error: function (e) {
                // console.log(e);
            }
        });
    }

    // ===============================================================================
    // 장르 추가 기능 및 슬라이드
    let genre_Arr = [];
    const movie_Genre = $('.movie_Genre');
    const movie_genre_slide = $('.movie_genre_slide > div');

    movie_genre_slide.on('click', (e) => {
        e.preventDefault();
        // alert((e.currentTarget).innerText);
        const newDiv = document.createElement('div');
        const addText = $(e.currentTarget).text();
        const delBtn = '<div class="deleteBtn"><i class="fa-solid fa-xmark fa-2xs"></i></div>';
        const clickCount = movie_Genre.children().length;

        if ($.inArray($(e.currentTarget).text(), genre_Arr) == -1) {
            if (clickCount >= 5) {
                alert('5개만 선택 가능합니다.');
                return false;
            } else {
                newDiv.append(addText);
                newDiv.classList.add('added');
                newDiv.innerHTML += delBtn;
                movie_Genre.append(newDiv);
                genre_Arr.push(addText)
                // console.log("추가된 값은 : " + addText);
            }
        } else {
            alert('같은 값은 추가 할 수 없습니다.');
            return false;
        }
        // console.log("clickCount : " + clickCount);
        // console.log(genre_Arr);
    });

    // 배열에서 삭제
    movie_Genre.on('click', '.added', (e) => {
        e.stopPropagation();
        const clickedText = $(e.currentTarget).text();

        for (let i = 0; i < genre_Arr.length; i++) {
            if (genre_Arr[i] === clickedText) {
                genre_Arr.splice(i, 1);
                // console.log("제거된 값은 : " + clickedText);
                break;
            }
        }
        // console.log(genre_Arr);
        $(e.currentTarget).remove();
    });

    // 상영 영화 슬라이드 토글
    const Genre_Items = $('.Genre_Items');

    movie_Genre.on('click', (e) => {
        e.stopPropagation();
        Genre_Items.toggle();
        level_slide.hide();
    });
    Genre_Items.on('click', (e) => {
        e.stopPropagation();
        Genre_Items.toggle();
        level_slide.hide();
    });

    $(document).on('click', () => {
        Genre_Items.hide();
    });

    // ===============================================================================
    // 관람등급 추가 기능 및 슬라이드
    let level_Arr = [];
    const movie_level = $('.movie_level');
    const movie_level_slide = $('.movie_level_slide > div');

    movie_level_slide.on('click', (e) => {
        e.preventDefault();
        // alert((e.currentTarget).innerText);
        const newDiv = document.createElement('div');
        const addText = $(e.currentTarget).text();
        const delBtn = '<div class="deleteBtn"><i class="fa-solid fa-xmark fa-2xs"></i></div>';
        const clickCount = movie_level.children().length;

        if ($.inArray($(e.currentTarget).text(), level_Arr) == -1) {
            if (clickCount >= 1) {
                alert('1개만 선택 가능합니다.');
                return false;
            } else {
                newDiv.append(addText);
                newDiv.classList.add('added');
                newDiv.innerHTML += delBtn;
                movie_level.append(newDiv);
                level_Arr.push(addText)
                // console.log("추가된 값은 : " + addText);
            }
        } else {
            alert('같은 값은 추가 할 수 없습니다.');
            return false;
        }
        // console.log("clickCount : " + clickCount);
        // console.log(level_Arr);
    });

    // 배열에서 삭제
    movie_level.on('click', '.added', (e) => {
        e.stopPropagation();
        const clickedText = $(e.currentTarget).text();

        for (let i = 0; i < level_Arr.length; i++) {
            if (level_Arr[i] === clickedText) {
                level_Arr.splice(i, 1);
                // console.log("제거된 값은 : " + clickedText);
                break;
            }
        }
        // console.log(level_Arr);
        $(e.currentTarget).remove();
    });

    // 상영 영화 슬라이드 토글
    const level_slide = $('.level_Items');

    movie_level.on('click', (e) => {
        e.stopPropagation();
        level_slide.toggle();
        Genre_Items.hide();
    });
    level_slide.on('click', (e) => {
        e.stopPropagation();
        level_slide.toggle();
        Genre_Items.hide();
    });

    $(document).on('click', () => {
        level_slide.hide();
    });

    // ===============================================================================
    // 유효성검사 기능

    let confirmBtn = $('.bottom_Submit');

    let movie_title = $('.movie_title');

    let movie_director = $('.movie_director');

    let movie_cast = $('.movie_cast');

    let movie_time = $('.movie_time');
    // 상영시간 숫자만 입력 정규식
    movie_time.on('change', (e) => {
        let timeCheck = /^[0-9]{1,3}$/;
        if (!movie_time.val().match(timeCheck)) {
            movie_time.val('');
            alert('3자리 이하의 숫자만 입력하세요.');
            e.preventDefault();
            return false;
        }
    });

    let movie_country = $('.movie_country');
    // 제작국가 한글만 입력 정규식
    movie_country.on('change', (e) => {
        let korCheck = /([^가-힣ㄱ-ㅎㅏ-ㅣ])/;
        if (movie_country.val().match(korCheck)) {
            movie_country.val('');
            alert('한글만 입력해주세요.');
            e.preventDefault();
            return false;

        }
    });


    let movie_releseDate = $('.movie_releseDate');

    let movie_image = $('.movie_image');

    let movie_story = $('.movie_story');
    const hiddenImg1 = $('.hiddenImg1');
    const hiddenImg2 = $('.hiddenImg2');
    const hiddenImg3 = $('.hiddenImg3');
    const hiddenImg4 = $('.hiddenImg4');
    const hiddenImg5 = $('.hiddenImg5');
    const hiddenImg6 = $('.hiddenImg6');


    // level_Arr
    // genre_Arr

    confirmBtn.on('click', (e) => {
        e.preventDefault();
        // 이미지 변경이 없을 경우
        // 이미지를 변경 할 경우
        // 기존 로직을 그대로 사용한다.
        // 이미지 삭제는 고려하지 않음. 반드시 이미지는 들어가야 함.

        // 메인 이미지
        if ($('.movie_image1').val() == "") {

            // console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image1').val());
            imageUrl1 = hiddenImg1.val();

            // console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl1);

        }

        // 추가 이미지 1
        if ($('.movie_image2').val() == "") {

            // console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image2').val());
            imageUrl2 = hiddenImg2.val();

            // console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl2);

        }

        // 추가 이미지 2
        if ($('.movie_image3').val() == "") {

            // console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image3').val());
            imageUrl3 = hiddenImg3.val();

            // console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl3);

        }

        // 추가 이미지 3
        if ($('.movie_image4').val() == "") {

            // console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image4').val());
            imageUrl4 = hiddenImg4.val();

            // console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl4);

        }

        // 추가 이미지 4
        if ($('.movie_image5').val() == "") {

            // console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image5').val());
            imageUrl5 = hiddenImg5.val();

            // console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl5);

        }

        // 추가 이미지 5
        if ($('.movie_image6').val() == "") {

            // console.log("이미지 변경 X 시 기존 값 : " + $('.movie_image6').val());
            imageUrl6 = hiddenImg6.val();

            // console.log("이미지를 변경하지 않아 숨겨진 값을 추가함. : " + imageUrl6);

        }

        if (!movie_title.val()) {
            alert('제목이 입력되지 않았습니다.');
            movie_title.focus();
            e.preventDefault();
            return false;
        };
        if (!movie_director.val()) {
            alert('감독이 입력되지 않았습니다.');
            movie_director.focus();
            e.preventDefault();
            return false;
        };
        if (!movie_cast.val()) {
            alert('출연진이 입력되지 않았습니다.');
            movie_cast.focus();
            e.preventDefault();
            return false;
        };
        if (!movie_time.val()) {
            alert('상영 시간이 입력되지 않았습니다.');
            movie_time.focus();
            e.preventDefault();
            return false;
        };
        if (!movie_country.val()) {
            alert('제작국가가 입력되지 않았습니다.');
            movie_country.focus();
            e.preventDefault();
            return false;
        };
        if (!movie_releseDate.val()) {
            alert('개봉일이 입력되지 않았습니다.');
            movie_releseDate.focus();
            e.preventDefault();
            return false;
        };
        if (level_Arr.length == 0) {
            alert('관람 등급이 선택되지 않았습니다.');
            e.preventDefault();
            level_slide.toggle();
            // window.location.reload();
            return false;
        };
        if (genre_Arr.length == 0) {
            alert('장르가 선택되지 않았습니다.');
            Genre_Items.toggle();
            // window.location.reload();
            e.preventDefault();
            return false;
        };
        if (!$('.movie_story').val()) {
            alert('줄거리를 입력하지 않았습니다.');
            movie_story.focus();
            e.preventDefault();
            return false;
        };

        const movieNo = $('#movieNo');

        // console.log('저장버튼이 눌림.');
        // console.log("Uploader : " + $("input[name=movieUploader]").val());
        // console.log("영화 제목 : " + movie_title.val());
        // console.log("감독 : " + movie_director.val());
        // console.log("출연진 : " + movie_cast.val());
        // console.log("상영 시간 : " + movie_time.val());
        // console.log("제작 국가 : " + movie_country.val());
        // console.log("개봉일 : " + movie_releseDate.val());
        // console.log("메인 이미지 : " + imageUrl1);
        // console.log("추가 이미지1 : " + imageUrl2);
        // console.log("추가 이미지2 : " + imageUrl3);
        // console.log("추가 이미지3 : " + imageUrl4);
        // console.log("추가 이미지4 : " + imageUrl5);
        // console.log("추가 이미지5 : " + imageUrl6);
        // console.log("줄거리 : " + $('.movie_story').val());
        // console.log("관람 등급 : " + level_Arr);
        // console.log("장르 : " + genre_Arr);

        // 등록된 영화 ajax
        // console.log("영화등록 AJAX");
        $.ajax({
            url: "/movie/manager/movie_list/edit/" + movieNo.val() + "/movie_edit",
            data: {
                "movieTitle": movie_title.val(),
                "movieDirector": movie_director.val(),
                "movieCast": movie_cast.val(),
                "movieRuntime": movie_time.val(),
                "movieNation": movie_country.val(),
                "movieOpen": movie_releseDate.val(),
                "movieImg1": imageUrl1,
                "movieImg2": imageUrl2,
                "movieImg3": imageUrl3,
                "movieImg4": imageUrl4,
                "movieImg5": imageUrl5,
                "movieImg6": imageUrl6,
                "mgNo": JSON.stringify(level_Arr),
                "genreName": JSON.stringify(genre_Arr),
                "movieContent": $('.movie_story').val(),
                "movieUploader": $("input[name=movieUploader]").val()
            },
            type: "POST",
            dataType: "json",

            success: function (result) {
                // console.log(result);
                // 등록 완료 : 1
                // 등록 실패 : 0
                if (result > 0) {
                    console.log("영화 수정 완료");
                    window.alert("영화 수정 성공")
                    let url = "/movie/manager/movie_list";
                    window.location.href = url;
                } else {
                    // console.log("영화 수정 실패");
                }
            },
            error: function () {
                window.alert("영화 수정 실패")
                // console.log("영화 수정 ajax 실패");
            }
        })
    });

});