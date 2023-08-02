$(document).ready(function () {

  const teen = $('#teen');
  const normal = $('#normal');
  const elder = $('#elder');
  const special = $('#special');
  const couple = $('#couple');

  // 청소년 가격 숫자만 입력 정규식
  teen.on('change', (e) => {
    let timeCheck = /^[0-9]+$/;
    if (!teen.val().match(timeCheck)) {
      teen.val('');
      alert('숫자만 입력하세요.');
      e.preventDefault();
      teen.focus();
      return false;
    }
  });
  // 일반 가격 숫자만 입력 정규식
  normal.on('change', (e) => {
    let timeCheck = /^[0-9]+$/;
    if (!normal.val().match(timeCheck)) {
      normal.val('');
      alert('숫자만 입력하세요.');
      e.preventDefault();
      normal.focus();
      return false;
    }
  });
  // 경로 가격 숫자만 입력 정규식
  elder.on('change', (e) => {
    let timeCheck = /^[0-9]+$/;
    if (!elder.val().match(timeCheck)) {
      elder.val('');
      alert('숫자만 입력하세요.');
      e.preventDefault();
      elder.focus();
      return false;
    }
  });
  // 우대 가격 숫자만 입력 정규식
  special.on('change', (e) => {
    let timeCheck = /^[0-9]+$/;
    if (!special.val().match(timeCheck)) {
      special.val('');
      alert('숫자만 입력하세요.');
      e.preventDefault();
      special.focus();
      return false;
    }
  });
  // 커플 가격 숫자만 입력 정규식
  couple.on('change', (e) => {
    let timeCheck = /^[0-9]+$/;
    if (!couple.val().match(timeCheck)) {
      couple.val('');
      alert('숫자만 입력하세요.');
      e.preventDefault();
      couple.focus();
      return false;
    }
  });

  const screenType = $('.play_cinema_enter');
  const chooseDay = $('.play_movie_enter');
  const chooseTime = $('.play_time_enter');
  const submitBtn = $('.bottom_Submit');


  // 값 중복 여부 확인용 AJAX
  screenType.on('change', getData);
  chooseDay.on('change', getData);
  chooseTime.on('change', getData);

  function getData() {
    const checkScreen = screenType.val();
    const checkWeek = chooseDay.val();
    const checkTime = chooseTime.val();


    if (checkScreen != null && checkWeek != null && checkTime != null) {
      //console.log("checkScreen : " + checkScreen);
      //console.log("checkWeek : " + checkWeek);
      //console.log("checkTime : " + checkTime);

      $.ajax({
        url: "manager_cinema_price/check",
        data: {
          checkScreen: checkScreen
          , checkWeek: checkWeek
          , checkTime: checkTime
        },
        type: "POST",
        success: function (result) {
          //console.log(result);
          // 중복 O : 1
          // 중복 X : 0
          if (result > 0) {
            //console.log("중복 O");
            alert('해당 가격이 이미 존재합니다!')
            submitBtn.prop('disabled', true); // 등록 버튼 비활성화
          } else {
            //console.log("중복 X");
            submitBtn.prop('disabled', false); // 등록 버튼 활성화
          }
        },
        error: function () {
          window.alert("중복 조회 실패")
          //console.log("중복 조회 실패");
        }
      })
    }
  }

  submitBtn.on('click', (e) => {

    // 상영관 종류 선택여부 확인
    if (screenType.val() == null) {
      alert('상영관 종류를 선택하지 않았습니다.');
      screenType.focus();
      e.preventDefault();
      return false;
    }
    // 주중 / 주말 선택여부 확인
    if (chooseDay.val() == null) {
      alert('주중 / 주말을 선택하지 않았습니다.');
      chooseDay.focus();
      e.preventDefault();
      return false;
    }
    // 오전 / 오후 선택여부 확인
    if (chooseTime.val() == null) {
      alert('오전 / 오후를 선택하지 않았습니다.');
      chooseTime.focus();
      e.preventDefault();
      return false;
    }

    if (!teen.val()) {
      alert('청소년 가격을 선택하지 않았습니다.');
      teen.focus();
      e.preventDefault();
      return false;
    }

    if (!normal.val()) {
      alert('일반 가격을 선택하지 않았습니다.');
      normal.focus();
      e.preventDefault();
      return false;
    }

    if (!elder.val()) {
      alert('경로 가격을 선택하지 않았습니다.');
      elder.focus();
      e.preventDefault();
      return false;
    }

    if (!special.val()) {
      alert('우대 가격을 선택하지 않았습니다.');
      special.focus();
      e.preventDefault();
      return false;
    }

    if (!couple.val()) {
      alert('커플 가격을 선택하지 않았습니다.');
      couple.focus();
      e.preventDefault();
      return false;
    }

    //console.log('상영관 종류 : ' + screenType.val());
    //console.log('주중 / 주말 : ' + chooseDay.val());
    //console.log('오전 / 오후 : ' + chooseTime.val());
    //console.log('청소년 가격 : ' + teen.val());
    //console.log('일반 가격 : ' + normal.val());
    //console.log('경로 가격 : ' + elder.val());
    //console.log('우대 가격 : ' + special.val());
    //console.log('커플 가격 : ' + couple.val());


    $.ajax({
      url: "manager_cinema_price/add",
      data: {
        screenType: screenType.val()
        , chooseDay: chooseDay.val()
        , chooseTime: chooseTime.val()
        , teen: teen.val()
        , normal: normal.val()
        , elder: elder.val()
        , special: special.val()
        , couple: couple.val()
      },
      type: "POST",
      success: function (result) {
        //console.log(result);
        // 등록 완료 : 1
        // 등록 실패 : 0
        if (result > 0) {
          //console.log("가격 등록 완료");
          window.alert("가격 등록 성공")
          let url = "/movie/manager/manager_cinemaPrice_list";
          window.location.href = url;
        } else {
          //console.log("가격 등록 실패");
        }
      },
      error: function () {
        window.alert("가격 등록 실패")
        //console.log("가격 등록 ajax 실패");
      }
    })



  });

});
