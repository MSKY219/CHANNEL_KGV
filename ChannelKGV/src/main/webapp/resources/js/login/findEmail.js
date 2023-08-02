$(document).ready(function () {
  $(".fpw").hover(
    function () {
      // Mouse enter, remove border top and left of fid
      $(".fid").css({
        "border-top": "none",
        "border-left": "none",
        "border-bottom": "1px solid #FFC400",
        color: "white",
      });
    },
    function () {
      // Mouse leave, revert the css of fid to original
      $(".fid").css({
        "border-top": "1px solid #FFC400",
        "border-left": "1px solid #FFC400",
        "border-bottom": "none",
        color: "#FFC400",
      });
    }
  );
});

const checkObj = {
  // 인증번호 발송 체크
};

// 비밀번호 인풋값들
const userName = document.getElementById("userName");
const userBirth = document.getElementById("userBirth");
const userTel = document.getElementById("userTel");
// 인증하기버튼
const sendBtn = document.getElementById("sendBtn");

// 아이디 찾기 버튼을 눌렀을때
sendBtn.addEventListener("click", function () {
  if (userName.value.length == 0) {
    alert("이름을 기입해주세요");
    userName.focus();

    return false;
  }
  if (userBirth.value.length == 0) {
    alert("생년월일을 기입해주세요");
    userBirth.focus();

    return false;
  }
  if (userTel.value.length == 0) {
    alert("전화번호를 기입해주세요");
    userTel.focus();

    return false;
  }
});

// $(document).ready(function() {
//     var message = "${message}"; // Flash 속성 값 가져오기
//     if (message) {
//         alert(message); // 알림 창 표시
//     }
// });
