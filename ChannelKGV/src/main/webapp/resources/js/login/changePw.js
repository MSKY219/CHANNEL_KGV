const userPw = document.getElementById("userPw");
const userPwConfirm = document.getElementById("userPwConfirm");
const pwMessage = document.getElementById("pwMessage");

const checkObj = {
  userPw: false,
};

userPw.addEventListener("input", function () {
  if (userPw.value.lengh == 0) {
    pwMessage.innerText =
      "영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 작성해주세요.";
  }
  const regExp = /^[\w!@#_-]{6,20}/;
  if (regExp.test(userPw.value)) {
    // 정규표현식 통과
    if (userPwConfirm.value.length == 0) {
      pwMessage.innerText = "유효한 비밀번호 형식입니다.";
      pwMessage.classList.add("confirm");
      pwMessage.classList.remove("error");
    } else {
      checkPw();
    }
  } else {
    // 유효하지않은 상태
    pwMessage.innerText =
      "영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 작성해주세요.";
    pwMessage.classList.add("error");
    pwMessage.classList.remove("confirm");
  }
});

userPwConfirm.addEventListener("input", checkPw);

function checkPw() {
  // 비밀번호 일치 검사
  const regExp = /^[\w!@#_-]{6,20}$/;
  if (userPw.value == userPwConfirm.value) {
    if (regExp.test(userPw.value)) {
      pwMessage.innerText = "";
      pwMessage.classList.add("confirm");
      pwMessage.classList.remove("error");

      checkObj.userPw = true;
    } else {
      pwMessage.innerText =
        "영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 작성해주세요.";
      pwMessage.classList.add("error");
      pwMessage.classList.remove("confirm");
    }
  } else {
    pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
    pwMessage.classList.add("error");
    pwMessage.classList.remove("confirm");
  }
}

function PwChangeValidate() {
  if (!checkObj.userPw) {
    alert("비밀번호가 조건에 부합하지 않습니다, 비밀번호를 재설정 해주세요.");
    return false;
  } else {
    return true;
  }
}
