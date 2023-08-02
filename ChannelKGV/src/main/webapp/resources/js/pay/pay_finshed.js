let bookNo = $("#bookNo").val();
let weeks = ["일", "월", "화", "수", "목", "금", "토"];

$.ajax({
  url: "loadPlay",
  data: {},
  type: "GET",
  success: function (userPlay) {
    updateRunTime(userPlay);
  },
  error: function () {
    // console.log("페이지 로딩 중 에러 발생");
  },
});

function updateRunTime(userPlay) {
  let up_start = new Date(userPlay.play.playStart);
  let up_end = new Date(userPlay.play.playEnd);
  $("#movie_detail")
    .find("#up_year")
    .html(up_start.getFullYear() + "년");
  $("#movie_detail")
    .find("#up_month")
    .html(up_start.getMonth() + 1 + "월");
  $("#movie_detail")
    .find("#up_date")
    .html(up_start.getDate() + "일");
  $("#movie_detail")
    .find("#up_day")
    .html(weeks[up_start.getDay()] + "요일");

  $("#movie_detail")
    .find("#start_hour")
    .html(String(up_start.getHours()).padStart(2, "0") + "시");
  $("#movie_detail")
    .find("#start_minute")
    .html(String(up_start.getMinutes()).padStart(2, "0") + "분 &#126;");

  if (up_start.getDate() == up_end.getDate()) {
    $("#movie_detail")
      .find("#end_hour")
      .html(String(up_end.getHours()).padStart(2, "0") + "시");
  } else {
    $("#movie_detail")
      .find("#end_hour")
      .html(up_end.getHours() + 24 + "시");
  }

  $("#movie_detail")
    .find("#end_minute")
    .html(String(up_end.getMinutes()).padStart(2, "0") + "분");
  $("#movie_detail")
    .find("#end_minute")
    .html(String(up_end.getMinutes()).padStart(2, "0") + "분");
}


document.addEventListener("DOMContentLoaded", function() {
  var codeElement = document.querySelector(".codeNo span");
  codeElement.classList.add("pointer");
  codeElement.addEventListener("click", function() {
    var code = codeElement.textContent.trim();

    navigator.clipboard.writeText(code).then(function() {
      alert("예매 코드 번호가 복사되었습니다.");
    }, function() {
      alert("예매 코드 번호 복사에 실패했습니다.");
    });
  });
});

