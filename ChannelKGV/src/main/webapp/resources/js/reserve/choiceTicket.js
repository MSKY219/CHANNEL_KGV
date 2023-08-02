let totalCount = 0;
let choiceCount = 0;

let adultCount = 0;
let youthCount = 0;
let seniorCount = 0;
let specialCount = 0;
let sweetCount = 0;

let seatArray = [];
let countArray = [];
let choiceArray = [];
let ageArray = [0, 0, 0, 0];

let priceArray = [];
let totalPrice = 0;

let maxRow;
let maxColumn;
let aisle;
let space;

let selectedSeatArray = [];
let impairedSeatArray = [];
let sweetSeatArray = [];

let rowArr;
let rowWidth;

let alphabet = 'ABCDEFGHIJKLMNOPQLSTUVWXYZ';
let weeks = ['일', '월', '화', '수', '목', '금', '토'];

$.ajax({
  url: "loadPlay",
  data: {},
  type: "GET",
  success: function (userPlay) {
    updateScreenSection(userPlay);
  },
  error: function () {
    // console.log("페이지 로딩 중 에러 발생");
  }
});

function updatePriceAjax() {
  $.ajax({
    url: "updatePrice",
    data: { "partialCountArray": JSON.stringify(partialCountArray) },
    type: "POST",
    success: function (priceMap) {
      for (let i = 0; i <= priceMap.countArray.length; i++) {
        $("#price_calc > div").eq(i).find(".age_price").html(priceMap.priceArray.at(i));
        $("#price_calc > div").eq(i).find(".age_pick").html(priceMap.countArray.at(i));
      }
      $("#total_price").html(priceMap.totalPrice);
      // console.log(priceMap);
    },
    error: function () {
      // console.log("페이지 로딩 중 에러 발생");
    }
  });
}


function checkTicketAjax() {
  $.ajax({
    url: "checkTicket",
    data: { "countArray": JSON.stringify(countArray), "seatArray": JSON.stringify(seatArray) },
    type: "POST",
    success: function (url) {
      if (url != 'fail') {
        location.href = url;
      } else {
        updateSeatAjax();
      }
    },
    error: function () {
      // console.log("티켓 검사 중 에러 발생");
    }
  });

}



function updateSeatAjax() {
  $.ajax({
    url: "loadPlay",
    data: {},
    type: "GET",
    success: function (userPlay) {
      $('.seat').empty();
      updateScreenSection(userPlay);
      alert("해당 좌석은 이미 예매된 좌석입니다.");
    },
    error: function () {
      // console.log("페이지 로딩 중 에러 발생");
    }
  });
}


function updateScreenSection(userPlay) {
  // console.log(userPlay);

  updateScreen(userPlay);
  updateRunTime(userPlay);
  decideWidth();

  for (let k = 1; k <= maxRow; k++) {
    $(`#seat_area > div:nth-child(${k}) > div:first-child`).text(alphabet[k - 1]);
  }

  ageArray = [0, 0, 0, 0];
  totalCount = 0;
  $(".age_count").html(0);

  changeRoom();
  updateSpecialSeat();

  updateCount();
  updateSeatSection();
  updateCountArray();
  resetPriceSection();

}


// 1. 좌석 커스터마이징

// 상영관 정보 업데이트

function updateScreen(userPlay) {
  // console.log(userPlay.screen);
  maxRow = userPlay.screen.screenRow;
  maxColumn = userPlay.screen.screenCol;
  aisle = JSON.parse(userPlay.screen.screenAisle);
  space = JSON.parse(userPlay.screen.screenSpace);
  selectedSeatArray = JSON.parse(userPlay.play.playBookSeat);
  sweetSeatArray = JSON.parse(userPlay.screen.screenSweet);
  impairedSeatArray = JSON.parse(userPlay.screen.screenImpaired);

  rowArr = Array.from({ length: maxRow }, () => maxColumn);
}


// 영화 시간 업데이트

function updateRunTime(userPlay) {
  let up_start = new Date(userPlay.play.playStart);
  let up_end = new Date(userPlay.play.playEnd);
  $('#movie_detail').find('#up_year').html(up_start.getFullYear() + "년");
  $('#movie_detail').find('#up_month').html((up_start.getMonth() + 1) + "월");
  $('#movie_detail').find('#up_date').html(up_start.getDate() + "일");
  $('#movie_detail').find('#up_day').html(weeks[up_start.getDay()] + "요일");

  $('#movie_detail').find('#start_hour').html(String(up_start.getHours()).padStart(2, "0") + "시");
  $('#movie_detail').find('#start_minute').html(String(up_start.getMinutes()).padStart(2, "0") + "분 &#126;");

  if (up_start.getDate() == up_end.getDate()) {
    $('#movie_detail').find('#end_hour').html(String(up_end.getHours()).padStart(2, "0") + "시");
  } else {
    $('#movie_detail').find('#end_hour').html((up_end.getHours() + 24) + "시");
  }

  $('#movie_detail').find('#end_minute').html(String(up_end.getMinutes()).padStart(2, "0") + "분");
  $('#movie_detail').find('#end_minute').html(String(up_end.getMinutes()).padStart(2, "0") + "분");
}


// 스크린과 좌석 영역의 전체 길이 설정

function decideWidth() {

  // 좌석의 가로 크기(width)는 25px, 좌석 간의 가로 공간(margin)은 5.98px
  rowWidth = 25 * (maxColumn) + 5.98 * (maxColumn - 1);

  // 스크린과 좌석 영역의 전체 길이 설정

  $('#screen_area').css('width', `calc(${rowWidth}px + 1px)`);
  $('#seat_area').css('width', `calc(${rowWidth}px)`);

}



function changeRoom() {

  for (let r = 1; r <= maxRow; r++) {
    aisle.forEach(c => plusAisle(r, c));
  }

  for (let key in space) {
    space[key].forEach(v => plusSpace(key, v));
  }


  for (let k = 1; k <= maxRow; k++) {
    let i = 1;
    let j = 1;
    let seat;
    let num;

    while (i <= rowArr[k - 1]) {
      seat = $(`#seat_area > div:nth-child(${k}) > a:nth-of-type(${j})`);
      if (!seat.hasClass('aisle')) {
        num = document.createElement("span");
        num.innerText = i++;
        if (!seat.hasClass('space')) {
          $(seat).append(num);
          $(seat).attr('data-seat', alphabet[k - 1] + (i - 1));
        }
      }
      j++;
    }
  }

}



function plusAisle(r, c) {
  $(`#seat_area > div:nth-child(${r}) > a:nth-of-type(${c})`).removeClass('seat');
  $(`#seat_area > div:nth-child(${r}) > a:nth-of-type(${c})`).addClass('aisle');
}

function plusSpace(r, c) {
  $(`#seat_area > div:nth-child(${r}) > a:not('.aisle'):nth-of-type(${c})`).removeClass('seat');
  $(`#seat_area > div:nth-child(${r}) > a:not('.aisle'):nth-of-type(${c})`).addClass('space');
}



function updateSpecialSeat() {

  selectedSeatArray.forEach(item => {
    $(`#seat_area > div > a[data-seat=${item}]`).addClass('selected');
  });

  impairedSeatArray.forEach(item => {
    $(`#seat_area > div > a[data-seat=${item}]`).addClass('impared');
  });

  sweetSeatArray.forEach(item => {
    $(`#seat_area > div > a[data-seat=${item}]`).addClass('sweet');
  });

}



// 2. 인원 선택

// 2-E1) 플러스 버튼을 클릭하면??

$('.plus_btn').click(function () {

  let ageIndex = $(this).closest("li").index();
  let count = ageArray[ageIndex];

  if (totalCount < 8) {
    // 총합이 8 미만이라면
    // 해당 버튼 왼쪽의 숫자가 증가함
    // 총합이 증가함
    // 일련의 함수들이 작동함
    $(this).prev().text(count + 1);
    ageArray[ageIndex] = count + 1;
    totalCount++;
    updateCount();
    updateSeatSection();
    updateCountArray();
    resetPriceSection();
  } else {
    alert("최대 8명까지 선택할 수 있습니다.");
  }
});


// 2-E2) 마이너스 버튼을 클릭하면??

$('.minus_btn').click(function () {
  let ageIndex = $(this).closest("li").index();
  let count = ageArray[ageIndex];

  if (count > 0) {
    // 해당 버튼 오른쪽의 숫자가 0보다 크다면
    // 그 숫자가 감소하며, 총합도 감소함
    // 일련의 함수들이 작동함
    $(this).next().text(count - 1);
    ageArray[ageIndex] = count - 1;
    totalCount--;
    updateCount();
    updateSeatSection();
    updateCountArray();
    resetPriceSection();
  }
});


// 2-F1) 선택 인원 초기화


function updateCount() {
  // 연령별 선택인원이 다시 변경됨
  // 선택 중인 좌석들이 모두 없어짐
  adultCount = ageArray[0];
  youthCount = ageArray[1];
  seniorCount = ageArray[2];
  specialCount = ageArray[3];

  $('#seat_area > div > a').removeClass("selecting");
  choiceCount = 0;
  seatArray = [];
}


// 좌석 선택

let seatNo;

$('.seat').on("click", function (e) {
  if (!$(this).hasClass('aisle') && !$(this).hasClass('space') && !$(this).hasClass('selected')) {
    seatNo = alphabet[$(this).closest("div").index()] + ($(this).prevAll(".seat, .space").length + 1);

    if ($(this).hasClass("selecting")) {
      // console.log($(this).hasClass("selecting"));
      $(this).removeClass("selecting");
      choiceCount--;
      seatArray = seatArray.filter((element) => element !== seatNo);
      updateSeatSection();
      updatePriceSection();
    }

    else if ((totalCount > choiceCount) && !($(e.target).hasClass("selecting"))) {
      $(this).addClass("selecting");
      choiceCount++;
      seatArray.push(seatNo);
      seatArray.sort((a, b) => sortSeat(a, b));
      updateSeatSection();
      updatePriceSection();
    }
  }
})


// [함수] 좌석번호 정렬

// A8 - A9 - A10 순으로 나열하고 싶은데, 숫자가 문자열로 인식되어 이상한 결과가 나온다.
// 그래서 문자열부터 비교하고, 문자열이 같다면 숫자 부분만 비교하도록 만들자.

function sortSeat(a, b) {
  if (a.substr(0, 1) > b.substr(0, 1)) return 1;
  else if (a.substr(0, 1) < b.substr(0, 1)) return -1;
  else {
    if (Number(a.substring(1)) < Number(b.substring(1))) return -1;
  }
}


// [함수] 좌석 정보창 업데이트

function updateSeatSection() {
  $('#seat_code > div').empty();

  for (let i = 0; i < seatArray.length; i++) {
    if (i == 0) {
      $('#seat_code > div:first-child').append(seatArray[i]);
    } else if (i <= 3) {
      $('#seat_code > div:first-child').append(", " + seatArray[i]);
    } else if (i == 4) {
      $('#seat_code > div:first-child').append(",");
      $('#seat_code > div:last-child').append(seatArray[i]);
    } else {
      $('#seat_code > div:last-child').append(", " + seatArray[i]);
    }
  }
}



// 선택 배열 초기화

function updateCountArray() {
  countArray = [];

  for (let i = 0; i < adultCount; i++) {
    countArray.push(0);
  }

  for (let i = 0; i < youthCount; i++) {
    countArray.push(1);
  }

  for (let i = 0; i < seniorCount; i++) {
    countArray.push(2);
  }

  for (let i = 0; i < specialCount; i++) {
    countArray.push(3);
  }

}



// 가격 계산 업데이트

let countSet;
let elementCount;
let partialCountArray;

for (let i = 0; i < priceArray.length; i++) {
  $(`#price_calc > div:nth-child(${i + 1}) > div > span:first-child`).text(priceArray[i]);
}

function updatePriceSection() {

  $("#price_calc > div").css('display', 'none');
  totalPrice = 0;

  partialCountArray = countArray.slice(0, choiceCount);
  countSet = new Set(partialCountArray);

  countSet.forEach(i => {
    $(`#price_calc > div:nth-child(${i + 1})`).css('display', 'flex');
  });

  updatePriceAjax();

  if (choiceCount > 0) {
    $("#price_calc > div:last-child").css('display', 'flex');
  } else {
    $("#price_calc > div:last-child").css('display', 'none');
  }

}


function resetPriceSection() {
  $("#price_calc > div").css('display', 'none');
}



// 결제하기

$("#summary").on("click", function (e) {
  // 조건 1 : 인원의 합계만큼 좌석 선택 완료 && 1명 이상 선택
  // countArray와 seatArray를 넘긴다.
  if (totalCount == choiceCount && totalCount > 0) {

    function ask(question, yes, no) { // 등록 후 찜 목록 이동 여부 물어보기.
      if (confirm(question)) {
        yes(); // 찜 목록 이동 희망
        checkTicketAjax();
      } else {
        e.preventDefault();
        no(); // 거부 시, 메인 화면에 계속 머물기
      }
    };
    ask( // function ask() 용 질의 구문
      "3분 이내에 결제하지 않으면 예매가 취소됩니다. 결제하시겠습니까?",
      (ask) => alert("결제 페이지로 이동합니다."),
      (ask) => alert("취소 버튼을 누르셨습니다.")
    );
  }
  
  if(totalCount == 0) {
    alert("1명 이상 선택해주세요.");
  } else if(totalCount > choiceCount) {
    alert("총 인원만큼 좌석을 선택하지 않았습니다.");
  }
  
  
})





