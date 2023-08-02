$(document).ready(function () {
  $(".fid").hover(
    function () {
      // Mouse enter, remove border top and left of fid
      $(".fpw").css({
        "border-top": "none",
        "border-right": "none",
        "border-bottom": "1px solid #FFC400",
        color: "white",
      });
    },
    function () {
      // Mouse leave, revert the css of fid to original
      $(".fpw").css({
        "border-top": "1px solid #FFC400",
        "border-right": "1px solid #FFC400",
        "border-bottom": "none",
        color: "#FFC400",
      });
    }
  );
});

const checkObj = {
  userPw: false,
  userPwConfirm: false,
  userNick: false,
  cNumber: false,
  sendEmail: false, // 인증번호 발송 체크
};

// 비밀번호 찾기 인풋값들
const userEmail = document.getElementById("userEmail");
const userName = document.getElementById("userName");
const userBirth = document.getElementById("userBirth");

// 인증하기버튼
const sendBtn = document.getElementById("sendBtn");

// 타이머
const cMessage = document.getElementById("cMessage");
let checkInterval; // setInterval을 저장할 변수
let min = 2;
let sec = 59;

// 인증받기 버튼을 눌렀을때
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
  if (userEmail.value.length == 0) {
    alert("이메일을 기입해주세요");
    userEmail.focus();

    return false;
  }
  var cMessage = document.getElementById("cMessage");
  cMessage.style.backgroundColor = "rgb(32,32,32)";

  // 인풋 3개(이름,생년월일,이메일 아이디가 제대로 되어있는지 확인하기)
  $.ajax({
    url: "checkUser",
    data: {
      userName: userName.value,
      userBirth: userBirth.value,
      userEmail: userEmail.value,
    },
    type: "GET",

    success: function (result) {
      if (result > 0) {
        $.ajax({
          url: "sendEmail",
          data: { userEmail: userEmail.value },
          type: "GET",
          success: function (result) {
            alert("인증번호가 발송되었습니다.");
            checkObj.sendEmail = true;
          },
          error: function () {},
        });

        cMessage.innerText = "3:00"; // 초기값 3분
        min = 2;
        sec = 59; // 분, 초 초기화

        cMessage.classList.remove("confirm");
        cMessage.classList.remove("error");

        // 변수에 저장해야지 멈출 수 있음
        checkInterval = setInterval(function () {
          if (sec < 10) sec = "0" + sec;
          cMessage.innerText = min + ":" + sec;

          if (Number(sec) === 0) {
            min--;
            sec = 59;
          } else {
            sec--;
          }

          if (min === -1) {
            // 만료
            cMessage.classList.add("error");
            cMessage.innerText = "fail";
            cMessage.style.color = "red";

            clearInterval(checkInterval); // checkInterval 반복을 지움
          }
        }, 1000); // 1초 지연 후 수행
      } else {
      }
    },
    error: function () {
      alert("이름,생년월일,이메일이 올바르지 않습니다");
    },
  });
});

const cNumber = document.getElementById("cNumber");
const cBtn = document.getElementById("cBtn");

// 인증번호 인풋에 값을 적었을때
cNumber.addEventListener("input", function () {

  // 1. 인증번호 받기 버튼이 클릭되어 이메일 발송되었는지 확인
  if (checkObj.sendEmail) {
    // 2. 입력된 인증번호가 6자리가 맞는지 확인
    if (cNumber.value.length == 6) {
      $.ajax({
        url: "checkNumber",
        data: {
          cNumber: cNumber.value,
          userEmail: userEmail.value,
        },
        type: "GET",
        success: function (result) {
          // 1 : 인증번호 일치 O, 시간 만족O
          // 2 : 인증번호 일치 O, 시간 만족X
          // 3 : 인증번호 일치 X
          if (result == 1) {
            clearInterval(checkInterval); // 타이머 멈춤

            cMessage.innerText = "success";
            cMessage.style.color = "greenyellow";
            cMessage.classList.add("confirm");
            cMessage.classList.remove("error");

            
            checkObj.cNumber = true;


          } else if (result == 2) {
            alert("만료된 인증 번호 입니다.");
          } else {
            alert("인증 번호가 일치하기 않습니다.");
          }
        },

        error: function () {},

      });
    } else {
      alert("인증번호를 정확하게 입력해주세요.");
      cNumber.focus();
      checkObj.cNumber = false;
    }
  } else {
    // 인증번호를 안받은 경우
    alert("인증번호 받기 버튼을 먼저 클릭해주세요.");
  }
});

function goChangPw() {
  if (checkObj.cNumber == true) {
    let url = "pwChange";
    window.location.href = url;
  } else {
    alert("필수기입항목들이 기입되지 않았습니다");
  }
}
