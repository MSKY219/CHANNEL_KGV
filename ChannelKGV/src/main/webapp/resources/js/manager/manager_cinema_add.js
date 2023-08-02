$(document).ready(function () {


  // 상영관마다 정보를 초기화함 

  $('.screen input.screenDetail').attr('value', JSON.stringify({
    maxRow: 12,
    maxColumn: 24,
    aisle: [],
    space: {},
    sweet: [],
    impaired: []
  }));


  $('.screen input.screenStyle').attr('value', "일반관");
  $('.screen input.screenSeat').attr('value', 12 * 24);

  let room;
  let tempNo;
  let tempStyle;
  let tempSeat;
  let tempRoom;

  let clickCount = 0;   // 클릭하여 활성화된 좌석의 갯수
  let firstSeat = [];   // 첫번째로 클릭하여 활성화된 좌석 [x, y]
  let secondSeat = [];  // 두번째로 클릭하여 활성화된 좌석 [x, y]

  let optionArea = [];  // 통로, 공간, 특수석이 지정될 수 있는 구역
  let tempRowArr = [];  // 상영관의 x축(가로줄)마다 좌석의 수가 몇 개인지?

  let alphabet = 'ABCDEFGHIJKLMNOPQLSTUVWXYZ';
  let deleteBtn = '<button type="button" class="room_delete"><i class="fa-solid fa-ban"></i></button>';
  let screenCount = 4;

  let nameCheck = false;
  let addrCheck = false;

  // 영화관 이름 유효성 검사

  const cinemaRegex = /^[가-힣|a-z|A-Z|0-9|{1,}$]+$/;

  $("#cinemaName").on("input", function () {
    if (cinemaRegex.test($(this).val())) {
      $.ajax({
        url: "manager_cinema_add/cinemaDupCheck",
        data: { "cinemaName": $(this).val() },
        type: "GET",
        success: function (result) {
          if (result == 1) {
            $("#cinemaNameMessage").text("중복!");
            nameCheck = false;
          } else {
            $("#cinemaNameMessage").text("유효!");
            nameCheck = true;
          }
        },
        error: function () {
          //console.log("에러 발생");
        }
      });
    } else {
      $("#cinemaNameMessage").text("적절하지 않은 이름입니다!");
      nameCheck = false;
    }
  });


  // 상영관 추가 버튼

  $("#plusScreen").on("click", function () {
    let newScreen = $('.screen[data-room-no=0]').clone(true);
    newScreen.attr('data-room-no', ++screenCount);
    newScreen.find('.screenName').html(screenCount);
    $('.room_delete').remove();
    newScreen.find('.screen_btn').append(deleteBtn);
    newScreen.css('display', 'block');
    $(this).before(newScreen);
  });


  // 상영관 삭제 버튼
  $(document).on("click", '.room_delete', function () {
    if (screenCount > 4) {
      $(`.screen[data-room-no=${screenCount--}]`).remove();
    }

    if (screenCount >= 5) {
      $(`.screen[data-room-no=${screenCount}]`).find('.screen_btn').append(deleteBtn);
    }
  });



  // [이벤트] 상영관 편집 버튼을 클릭하면

  $('.screen .room_edit').on("click", function () {

    room = $(this).closest('.screen');
    tempNo = $(room).data('room-no');
    tempStyle = $(room).find('input[name="screenStyle"]').val();
    tempSeat = $(room).find('input[name="screenSeat"]').val();
    tempRoom = JSON.parse($(room).find('input[name="screenDetail"]').val());

    $('#room_no').html(tempNo);
    $('#temp_row').val(tempRoom.maxRow);
    $('#temp_column').val(tempRoom.maxColumn);
    $("#temp_type").val(tempStyle).prop("selected", true);

    createBasicRoom(tempRoom.maxRow, tempRoom.maxColumn);
    changeRoom();
    decorateSeat();
    hideSeatSetting();

    $('#room_area').css('display', 'block');
    $('#room_area').css('z-index', '3');

  });



  // [이벤트] 상영관의 타입을 변경하면

  $('#temp_type').on("input", function () {
    tempStyle = $(this).val();
  })



  // [이벤트] 상영관의 가로줄과 세로줄 수를 변경하면

  $('#edit_area .temp_rc').on("input", function () {
    tempRoom.maxRow = $('#temp_row').val();
    tempRoom.maxColumn = $('#temp_column').val();
    tempRoom.aisle = [];
    tempRoom.space = {};
    tempRoom.sweet = [];
    tempRoom.impaired = [];

    createBasicRoom(tempRoom.maxRow, tempRoom.maxColumn);
    decorateSeat();
    hideSeatSetting();
  });



  // [함수] 좌석 옵션 숨기기

  function hideSeatSetting() {
    $('#seat_option').css('display', 'none');
    $('#seat_option select').val("").prop("selected", true);
    $('#seat_option_confirm').css('display', 'none');

    clickCount = 0;
  }



  // [함수] 기본 방 만들기

  function createBasicRoom(maxRow, maxColumn) {
    let row, seat;
    tempRowArr = Array.from({ length: maxRow }, () => maxColumn);

    $('#seat_area').empty();
    clickCount = 0;

    for (let k = 1; k <= maxRow; k++) {

      row = document.createElement('div');
      eng = document.createElement('div');
      row.appendChild(eng);
      document.querySelector('#seat_area').appendChild(row);

      for (let i = 1; i <= maxColumn; i++) {

        seat = document.createElement('a');
        seat.href = "#none";

        $(seat).addClass('seat');
        $(seat).attr("data-row", k);
        $(seat).attr("data-column", i);
        $(seat).attr("data-code", null);

        seat.addEventListener("click", function () {
          clickSeat(this);
        });

        document.querySelector(`#seat_area > div:nth-child(${k})`).appendChild(seat);

      }
    }
  }



  // [함수] 기본 방에 통로, 공간 추가하기

  function changeRoom() {

    for (let r = 1; r <= tempRoom.maxRow; r++) {
      tempRoom.aisle.forEach(c => plusAisle(r, c));
    }

    for (let key in tempRoom.space) {
      tempRoom.space[key].forEach(v => plusSpace(key, v));
    }
  }



  function plusAisle(r, c) {
    $(`#seat_area > div:nth-child(${r}) > a:nth-of-type(${c})`).addClass('aisle');
  }



  function plusSpace(r, c) {
    $(`#seat_area > div:nth-child(${r}) > a:not('.aisle'):nth-of-type(${c})`).addClass('space');
  }




  // [함수] 좌석에 번호 부여하기

  function decorateSeat() {
    for (let k = 1; k <= tempRoom.maxRow; k++) {
      $(`#seat_area > div:nth-child(${k}) > div:first-child`).text(alphabet[k - 1]);
    }

    for (let k = 1; k <= tempRoom.maxRow; k++) {
      let i = 1;
      let j = 1;
      let num = 1;
      while (i <= tempRowArr[k - 1]) {
        seat = $(`#seat_area > div:nth-child(${k}) > a:nth-of-type(${j})`);
        if (!seat.hasClass('aisle')) {
          num = i++;
          if (!seat.hasClass('space')) {
            $(seat).text(num);
            $(seat).attr('data-code', alphabet[k - 1] + (i - 1));
          }
        }
        j++;
      }
    }

    tempSeat = $("[data-code]").length;
    tempRoom.sweet.forEach(s => $(`[data-code=${s}]`).addClass('sweet'));

  }



  // [함수] 좌석을 클릭하면

  function clickSeat(s) {

    if (clickCount == 0) {
      $('.seat').removeClass('option');
      clickSeatZero(s);
    }

    else if (clickCount == 1) {
      $('.seat').removeClass('option');
      clickSeatOne(s, $(s).data('row'), $(s).data('column'));
      createOptionArea();
    }

    else {
      clickSeatTwo(s);
    }

  }



  // [조건부 함수] 클릭 카운트가 0일 때 좌석을 클릭하면

  function clickSeatZero(s) {
    $('#seat_option').css('display', 'flex');
    $(s).addClass('clicked');

    firstSeat = [$(s).data('row'), $(s).data('column')];
    clickCount++;
  }



  // [조건부 함수] 클릭 카운트가 1일 때 좌석을 클릭하면

  function clickSeatOne(s, n0, n1) {

    if ((n0 != firstSeat[0]) || (n1 != firstSeat[1])) {
      secondSeat = [n0, n1];
      $(s).addClass('clicked');
      clickCount++;
    } else {
      firstSeat = [];
      $(s).removeClass('clicked');
      hideSeatSetting();
    }

  }



  // [조건부 함수] 클릭 카운트가 2일 때 좌석을 클릭하면

  function clickSeatTwo(s) {
    let presentSeat = [$(s).data('row'), $(s).data('column')];

    if (JSON.stringify(presentSeat) === JSON.stringify(firstSeat)) {
      firstSeat = secondSeat;
      secondSeat = [];

      $(s).removeClass('clicked');
      $('.seat').removeClass('option');

      $('#seat_option select').val("").prop("selected", true);
      $('#seat_option_confirm').css('display', 'none');
      clickCount--;
    }

    if (JSON.stringify(presentSeat) === JSON.stringify(secondSeat)) {
      secondSeat = [];

      $(s).removeClass('clicked');
      $('.seat').removeClass('option');

      $('#seat_option select').val("").prop("selected", true);
      $('#seat_option_confirm').css('display', 'none');
      clickCount--;
    }

  }



  // [조건부 함수] 옵션이 적용되는 구역 만들기

  let min0, min1, max0, max1;

  function createOptionArea() {
    min0 = Math.min(firstSeat[0], secondSeat[0]);
    max0 = Math.max(firstSeat[0], secondSeat[0]);

    min1 = Math.min(firstSeat[1], secondSeat[1]);
    max1 = Math.max(firstSeat[1], secondSeat[1]);

    optionArea = [];

    for (let i = min0; i <= max0; i++) {
      for (let j = min1; j <= max1; j++) {
        optionArea.push([i, j]);
      }
    }

  }



  // [이벤트] 좌석 옵션창을 선택하면

  $('#seat_option select').on("input", function () {
    $('.seat_detail').css('display', 'none');
    $('.seat').removeClass('option')

    if ($(this).val() == '통로 만들기') {
      createTempAisle();
    }

    else if ($(this).val() == '통로 없애기') {
      deleteTempAisle();
    }

    else if ($(this).val() == '공간 만들기') {
      createTempSpace();
    }

    else if ($(this).val() == '공간 없애기') {
      deleteTempSpace();
    }

    else if (['스위트석 지정', '장애인석 지정'].indexOf($(this).val()) != '-1') {
      createTempSpecial();
    }

    else if ($(this).val() == '특수석 해제') {
      deleteTempSpecial();
    }

    if ($(this).val() != '') {
      $('#seat_option_confirm').css('display', 'flex');
    }

  });



  // [조건부 함수] 임시 통로 만들기

  function createTempAisle() {

    if (clickCount == 1) {
      for (let i = 1; i <= tempRoom.maxRow; i++) {
        $(`#seat_area > div:nth-child(${i}) > a:not('.clicked'):nth-of-type(${firstSeat[1]})`).addClass('option');
      }
    }

    else if (clickCount == 2) {
      for (let i = 1; i <= tempRoom.maxRow; i++) {
        for (let j = min1; j <= max1; j++) {
          $(`#seat_area > div:nth-child(${i}) > a:not('.clicked'):nth-of-type(${j})`).addClass('option');
        }
      }
    }

  }



  // [조건부 함수] 임시 통로 없애기

  function deleteTempAisle() {

    if (clickCount == 1) {
      for (let i = 1; i <= tempRoom.maxRow; i++) {
        $(`#seat_area > div:nth-child(${i}) > a.aisle:not('.clicked'):nth-of-type(${firstSeat[1]})`).addClass('option');
      }
    }

    else if (clickCount == 2) {
      for (let i = 1; i <= tempRoom.maxRow; i++) {
        for (let j = min1; j <= max1; j++) {
          $(`#seat_area > div:nth-child(${i}) > a.aisle:not('.clicked'):nth-of-type(${j})`).addClass('option');
        }
      }
    }

  }




  // [조건부 함수] 임시 공간 만들기

  function createTempSpace() {

    if (clickCount == 1) {
      if ($(".clicked").hasClass("aisle")) {
        $('#seat_option select').val("").prop("selected", true);
        alert("통로입니다.");
      }
    }

    else if (clickCount == 2) {
      for (let i = min0; i <= max0; i++) {
        for (let j = min1; j <= max1; j++) {
          $(`#seat_area > div:nth-child(${i}) > a:not('.aisle, .clicked'):nth-of-type(${j})`).addClass('option');
        }
      }
    }
  }



  // [조건부 함수] 임시 공간 없애기

  function deleteTempSpace() {
    if (clickCount == 2) {
      for (let i = min0; i <= max0; i++) {
        for (let j = min1; j <= max1; j++) {
          $(`#seat_area > div:nth-child(${i}) > a.space:not('.clicked'):nth-of-type(${j})`).addClass('option');
        }
      }
    }
  }



  // [조건부 함수] 임시 특수석 만들기

  function createTempSpecial() {
    if (clickCount == 1) {
      if ($(".clicked").hasClass("aisle") || $(".clicked").hasClass("space")) {
        $('#seat_option select').val("").prop("selected", true);
        alert("특수석으로 지정할 수 없습니다.");
      }
    }

    else if (clickCount == 2) {
      for (let i = min0; i <= max0; i++) {
        for (let j = min1; j <= max1; j++) {
          $(`#seat_area > div:nth-child(${i}) > a:not('.aisle, .space, .clicked'):nth-of-type(${j})`).addClass('option');
        }
      }
    }
  }

  function deleteTempSpecial() {

  }


  // [이벤트] 설정 적용 버튼 누르기

  $('#seat_option_confirm').on("click", function () {

    if ($('#seat_option select').val() == '통로 만들기') {
      removeSpace();
      createAisle();
    }

    else if ($('#seat_option select').val() == '통로 없애기') {
      deleteAisle();
    }

    else if ($('#seat_option select').val() == '공간 만들기') {
      createSpace();
    }

    else if ($('#seat_option select').val() == '공간 없애기') {
      deleteSpace();
    }

    else if ($('#seat_option select').val() == '스위트석 지정') {
      createSweet();
    }

    else if ($('#seat_option select').val() == '장애인석 지정') {

    }

    else if ($('#seat_option select').val() == '특수석 해제') {

    }

    createBasicRoom(tempRoom.maxRow, tempRoom.maxColumn);
    changeRoom();
    decorateSeat();
    hideSeatSetting();

  });



  // [조건부 함수] 통로 만들기

  function createAisle() {

    if (clickCount == 1) {
      tempRoom.aisle.push(firstSeat[1]);
      tempRoom.aisle.sort((a, b) => a - b);
    }

    else if (clickCount == 2) {
      for (let i = min1; i <= max1; i++) {
        tempRoom.aisle.push(i);
      }

      tempRoom.aisle = Array.from(new Set(tempRoom.aisle));
      tempRoom.aisle.sort((a, b) => a - b);
    }
  }



  // [조건부 함수] 통로 없애기


  function deleteAisle() {
    if (clickCount == 1) {
      tempRoom.aisle = tempRoom.aisle.filter(function (data) {
        return data != firstSeat[1];
      });
    }

    else if (clickCount == 2) {
      tempRoom.aisle = tempRoom.aisle.filter(function (data) {
        return (data < min1) || (data > max1);
      });
    }
  }



  // [조건부 함수] 공간 만들기

  function createSpace() {

    if (clickCount == 1) {

      if (!(firstSeat[0] in tempRoom.space)) {
        tempRoom.space[firstSeat[0]] = [];
      }

      tempRoom.space[firstSeat[0]].push(firstSeat[1]);

      tempRoom.space[firstSeat[0]] = Array.from(new Set(tempRoom.space[firstSeat[0]]));
      if (tempRoom.space[firstSeat[0]].length == 0) {
        delete tempRoom.space[firstSeat[0]];
      }
    }

    else if (clickCount == 2) {
      for (let i = min0; i <= max0; i++) {
        if (!(i in tempRoom.space)) {
          tempRoom.space[i] = [];
        }

        for (let j = min1; j <= max1; j++) {
          if (tempRoom.aisle.indexOf(j) == '-1') {
            tempRoom.space[i].push(j);
          }

        }

        tempRoom.space[i] = Array.from(new Set(tempRoom.space[i]));
        if (tempRoom.space[i].length == 0) {
          delete tempRoom.space[i];
        }
      }
    }
  }



  // [조건부 함수] 공간 없애기

  function deleteSpace() {

    if (clickCount == 1) {
      tempRoom.space[firstSeat[0]] = tempRoom.space[firstSeat[0]].filter(function (data) {
        return data != firstSeat[1];
      });
    }

    else if (clickCount == 2) {
      for (let i = min0; i <= max0; i++) {
        if ((i in tempRoom.space)) {
          tempRoom.space[i] = tempRoom.space[i].filter(function (data) {
            return (data < min1) || (data > max1);
          });
        }
      }
    }

  }


  // [조건부 함수] 공간 위에 통로를 덮어씌우기

  function removeSpace() {
    if (clickCount == 1) {
      for (let key in tempRoom.space) {
        tempRoom.space[key] = tempRoom.space[key].filter(function (data) {
          return data != firstSeat[1];
        });
      }
    }

    else if (clickCount == 2) {
      for (let key in tempRoom.space) {
        tempRoom.space[key] = tempRoom.space[key].filter(function (data) {
          return (data < min1) || (data > max1);
        });
      }

    }
  }


  // [조건부 함수] 스위트석 만들기

  function createSweet() {

    if (clickCount == 1) {
      let s = $(".clicked");

      if (!($(s).hasClass("aisle")) && !($(s).hasClass("space"))) {
        tempRoom.sweet.push($(s).data('code'));
      }
    }

    else if (clickCount == 2) {

      for (let i = min0; i <= max0; i++) {
        for (let j = min1; j <= max1; j++) {
          let s = $(`#seat_area > div:nth-child(${i}) > a:nth-of-type(${j})`);

          if (!($(s).hasClass("aisle")) && !($(s).hasClass("space"))) {
            tempRoom.sweet.push($(s).data('code'));
          }

          if ($(s).hasClass("impaired")) {
            tempRoom.impaired = tempRoom.impaired.filter(function (data) {
              return data != $(s).data('code');
            });
          }

        }
      }
    }

    tempRoom.sweet = Array.from(new Set(tempRoom.sweet));

    tempRoom.sweet.forEach(s => {

    });

  }



  // 확인 버튼 

  $('#room_confirm').on("click", function () {
    $(room).find('.screenType').html(tempStyle);
    $(room).find('input[name="screenStyle"]').attr('value', tempStyle);
    $(room).find('input[name="screenSeat"]').attr('value', tempSeat);
    $(room).find('input[name="screenDetail"]').attr('value', JSON.stringify(tempRoom));

    $('#room_area').css('display', 'none');
    $('#room_area').css('z-index', '0');

  });


  // 리셋 버튼

  $('#room_reset').on("click", function () {

    $('#temp_row').val(12);
    $('#temp_column').val(24);
    $("#temp_type").val("일반관").prop("selected", true);

    tempStyle = "일반관";
    tempSeat = 12 * 24;

    tempRoom.maxRow = 12;
    tempRoom.maxColumn = 24;
    tempRoom.aisle = [];
    tempRoom.space = {};
    tempRoom.sweet = [];
    tempRoom.impaired = {};

    createBasicRoom(tempRoom.maxRow, tempRoom.maxColumn);
    decorateSeat();
    hideSeatSetting();

  });


  // 취소 버튼

  $('#room_cancle').on("click", function () {
    $('#room_area').css('display', 'none');
    $('#room_area').css('z-index', '0');
  });


  // submit 함수

  $('.bottom_Submit').on("click", function () {

    if ($('#cinemaRoadAddress').val().length > 0) {
      addrCheck = true;
    }

    if (nameCheck == false) {
      alert("이름이 유효하지 않습니다.");
    } else if (addrCheck == false) {
      alert("주소가 유효하지 않습니다.");
    } else if (nameCheck && addrCheck) {
      $(this).attr("type", "submit");
      $('#cinemaAddForm').submit();
    }

  })

  // 우클릭 이벤트 해제

  window.oncontextmenu = function () {
    return false;
  }

});



// 상단의 ready() 함수 안에 넣지 마세요.
/* 카카오 주소 API */

function searchDaumAddress() {
  new daum.Postcode({
    oncomplete: function (data) {
      $('#cinemaPostCode').val(data.zonecode);
      $("#cinemaRoadAddress").val(data.roadAddress);
      $("#cinemaDetailAddress").val("");
      $("#cinemaDetailAddress").attr("readOnly", false);
    }
  }).open();
}