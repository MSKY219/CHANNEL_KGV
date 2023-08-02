/* signUp.js */

// 유효성 검사 여부를 기록할 객체 생성
const checkObj = {
    "userEmail": false,
    "cNumber": false,
    "userPw": false,
    "userPwConfirm": false,
    "userNick": false,
    "userName": false,
    "userBirth": false,
    "userGender": false,
    "userTel": false,
    "sendEmail": false   // 인증번호 발송 체크

};



// 전화번호 유효성 검사
const userTel = document.getElementById("userTel");
const telMessage = document.getElementById("telMessage");


userTel.addEventListener("input", function () {

    // 입력이 되지 않은 경우
    if (userTel.value.length == 0) {

        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
        telMessage.classList.remove("confirm", "error");

        checkObj.userTel = false;
        return;

    }

    // 연락처 정규식
    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if (regExp.test(userTel.value)) { // 유효한 경우

        $.ajax({

            url: "telDupCheck",

            data: { "userTel": userTel.value },

            type: "GET",

            success: function (result) {


                if (result == 1) { //중복 o
                    telMessage.innerText = "이미 사용 중인 전화번호 입니다.";
                    telMessage.classList.add("error");
                    telMessage.classList.remove("confirm");

                    checkObj.userTel = false;

                } else { //중복 x
                    telMessage.innerText = "";
                    telMessage.classList.add("confirm");
                    telMessage.classList.remove("error");

                    checkObj.userTel = true;

                }
            },

            error: function () {

                //console.log("에러 발생");
            }

        });





    } else { // 유효하지 않은 경우
        telMessage.innerText = "연락처 형식이 올바르지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");

        checkObj.userTel = false;
    }
});


// 이메일 유효성 검사
const userEmail = document.getElementById("userEmail");
const emailMessage = document.querySelector("#emailMessage");

userEmail.addEventListener("input", function () {

    // 입력이 되지 않은 경우
    if (userEmail.value.length == 0) {
        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");

        checkObj.userEmail = false;


        return;
    }

    const regExp = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+){1,3}$/;

    // const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

    if (regExp.test(userEmail.value)) { // 유효한 경우


        $.ajax({

            url: "emailDupCheck",

            data: { "userEmail": userEmail.value },

            type: "GET",

            success: function (result) {


                if (result == 1) { //중복 o
                    emailMessage.innerText = "이미 사용 중인 이메일 입니다.";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");

                    checkObj.userEmail = false;

                } else { //중복 x
                    emailMessage.innerText = "";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");

                    checkObj.userEmail = true;

                }
            },

            error: function () {

                // console.log("에러 발생");
            }

        });



    } else {

        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        checkObj.userEmail = false;

    }

});




// 닉네임 유효성 검사
const userNick = document.getElementById("userNick");
const nicknameMessage = document.getElementById("nicknameMessage");

userNick.addEventListener("input", function () {

    // 입력되지 않은 경우
    if (userNick.value.length == 0) {
        nicknameMessage.innerText = "영어/숫자/한글 2~10글자 사이로 작성해주세요.";
        nicknameMessage.classList.remove("confirm", "error");

        checkObj.userNick = false;
        return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,10}$/;

    if (regExp.test(userNick.value)) { // 유효한 경우







        $.ajax({
            url: "nicknameDupCheck",
            data: { "userNick": userNick.value },
            type: "GET",

            success: function (result) {

                if (result == 0) {
                    nicknameMessage.innerText = "";
                    nicknameMessage.classList.add("confirm");
                    nicknameMessage.classList.remove("error");

                    checkObj.userNick = true;


                } else {
                    nicknameMessage.innerText = "이미 사용중인 닉네임 입니다.";
                    nicknameMessage.classList.add("error");
                    nicknameMessage.classList.remove("confirm");
                    checkObj.userNick = false; // 유효 O 기록

                }
            },

            error: function () {
                // console.log("에러 발생");
            }




        });



    } else {
        nicknameMessage.innerText = "영어/숫자/한글 2~10글자 사이로 작성해주세요.";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");

        checkObj.userNick = false;

    }

});



// 이름 유효성 검사
const userName = document.getElementById("userName");
const nameMessage = document.getElementById("nameMessage");

userName.addEventListener("input", function () {

    // 입력되지 않은 경우
    if (userName.value.length == 0) {
        nameMessage.innerText = "한글 2~10글자 사이로 작성해주세요.";
        nameMessage.classList.remove("confirm", "error");

        checkObj.userName = false;
        return;
    }

    const regExp = /^[가-힣]{2,10}$/;

    if (regExp.test(userName.value)) { // 유효한 경우



        $.ajax({
            url: "nameDupCheck",
            data: { "userName": userName.value },
            type: "GET",

            success: function (result) {


                if (result == 0) {
                    nameMessage.innerText = "";
                    nameMessage.classList.add("confirm");
                    nameMessage.classList.remove("error");

                    checkObj.userName = true;

                } else {
                    nameMessage.innerText = "이미 사용중인 이름입니다.";
                    nameMessage.classList.add("error");
                    nameMessage.classList.remove("confirm");

                    checkObj.userName = false;


                }

            },
            error: function () {
                //  console.log("에러 발생");
            }

        });


    } else {
        nameMessage.innerText = "한글 2~10글자 사이로 작성해주세요.";
        nameMessage.classList.add("error");
        nameMessage.classList.remove("confirm");

        checkObj.userName = false;
    }

});


/* 성별 유효성검사 */
const userGender = document.getElementById("userGender");
const selMessage = document.getElementById("selMessage");
userGender.addEventListener("change", function () {

    if (userGender.value == "") {


        selMessage.innerText = "필수 선택입니다.";
        selMessage.classList.add("error");
        selMessage.classList.remove("confirm");

        checkObj.userGender = false;

    } else {

        selMessage.innerText = "";
        checkObj.userGender = true;


    }


})


/* 생년월일 유효성 검사 */

const userBirth = document.getElementById("userBirth");
const birMessage = document.getElementById("birMessage");

userBirth.addEventListener("input", function () {

    if (this.value.length == 0) {


        birMessage.innerText = "생년월일을 입력해주세요.";
        birMessage.classList.remove("confirm", "error");

        checkObj.userBirth = false;
        return;


    }
    if (this.value.length == 8) {
        if (checkBirthday(this.value)) {
            checkObj.userBirth = true;



        } else {
            checkObj.userBirth = false;

        }
    }
});



function checkBirthday(dateStr) {
    let year = Number(dateStr.substr(0, 4));
    let month = Number(dateStr.substr(4, 2));
    let day = Number(dateStr.substr(6, 2));
    let today = new Date(); // 날짜 변수 선언
    let yearNow = today.getFullYear();
    let adultYear = yearNow - 15;
    let postYear = 1900;


    if (year < postYear) {
        birMessage.innerText = "도민준 되십니까?";
        birMessage.classList.add("error");
        birMessage.classList.remove("confirm");
        return false;
    }

    if (year > yearNow) {
        birMessage.innerText = "미래는 어떤 세상인가요?";
        return false;
    }
    if (year > adultYear) {
        birMessage.innerText = adultYear + "년생 이전 출생자만 등록 가능합니다.";
        return false;
    }
    if (month < 1 || month > 12) {
        birMessage.innerText = "달은 1월부터 12월까지 입력 가능합니다.";
        return false;
    }
    if (day < 1 || day > 31) {
        birMessage.innerText = "일은 1일부터 31일까지 입력가능합니다.";
        return false;
    }
    if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
        birMessage.innerText = month + "월은 31일이 존재하지 않습니다.";
        return false;
    }
    if (month == 2) {
        let isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        if (day > 29 || (day == 29 && !isleap)) {
            birMessage.innerText = year + "년 2월은 " + day + "일이 없습니다.";
            return false;
        }
    }
    birMessage.innerText = "";
    return true;
};







// 비밀번호 유효성 검사
const userPw = document.getElementById("userPw");
const userPwConfirm = document.getElementById("userPwConfirm");
const pwMessage = document.getElementById("pwMessage");

userPw.addEventListener("input", function () {

    if (userPw.value.length == 0) {
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 작성해주세요.";
        pwMessage.classList.remove("confirm", "error");

        checkObj.userPw = false;
        return;
    }

    const regExp = /^[\w!@#_-]{6,20}$/;

    if (regExp.test(userPw.value)) { // 비밀번호 유효


        checkObj.userPw = true;



        if (userPwConfirm.value.length == 0) {
            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        } else {
            checkPw();
        }

    } else {
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 작성해주세요.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.userPw = false;
    }
});


// 비밀번호 확인 유효성 검사


userPwConfirm.addEventListener("input", checkPw);



function checkPw() { // 비밀번호 일치 검사


    const regExp = /^[\w!@#_-]{6,20}$/;

    if (userPw.value == userPwConfirm.value) {

        if (regExp.test(userPw.value)) {
            pwMessage.innerText = "";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

            checkObj.userPwConfirm = true;
        } else {
            pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 작성해주세요.";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");

            checkObj.userPwConfirm = false;
        }

    } else {
        pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.userPwConfirm = false;
    }
}








// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate() {


    let str;

    for (let key in checkObj) {


        if (!checkObj[key]) {

            switch (key) {
                case "userEmail": str = "이메일이"; break;
                // case "sendEmail": str = "이메일 인증번호 발송이12"; break;
                case "cNumber": str = "이메일 인증번호가 "; break;
                case "userPw": str = "비밀번호가"; break;
                case "userPwConfirm": str = "비밀번호 확인이"; break;
                case "userNick": str = "닉네임이"; break;
                case "userName": str = "이름이"; break;
                case "userBirth": str = "생년월일이"; break;
                case "userGender": str = "성별이"; break;
                case "userTel": str = "전화번호가"; break;

            }

            str += " 유효하지 않습니다.";

            alert(str);

            document.getElementById(key).focus();

            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}



const sendBtn = document.getElementById("sendBtn");
const cMessage = document.getElementById("cMessage");
let checkInterval; // setInterval을 저장할 변수
let min = 4;
let sec = 59;

sendBtn.addEventListener("click", function () {

    // 입력이 되지 않은 경우
    if (userEmail.value.length == 0) {
        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");


    }




    if (checkObj.userEmail) { // 유효한 이메일이 작성되어 있을 경우에만 메일 보내기


        $.ajax({
            url: "sendEmail",
            data: { "userEmail": userEmail.value },
            type: "GET",
            success: function (result) {
                //  console.log("이메일 발송 성공");
                // console.log(result);

                // 인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkObj에 기록
                checkObj.sendEmail = true;
                console.log(checkObj.sendEmail);

            },
            error: function () {
                //  console.log("이메일 발송 실패")



            }
        });




        cMessage.innerText = "5:00"; // 초기값 5분
        min = 4;
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

            if (min === -1) { // 만료
                cMessage.classList.add("error");
                cMessage.innerText = "인증번호가 만료되었습니다.";

                clearInterval(checkInterval); // checkInterval 반복을 지움
            }

        }, 1000); // 1초 지연 후 수행


        alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");


        // return;


    } else {

        alert("유효한 이메일을 작성해주세요.");


        // return ;
    }



    //console.log(checkObj.sendEmail);









});


// 인증번호 확인 클릭시에 대한 동작
const cNumber = document.getElementById("cNumber");
const cBtn = document.getElementById("cBtn");



cBtn.addEventListener("click", function () {




    // 1. 인증번호 받기 버튼이 클릭되어 이메일 발송되었는지 확인
    if (checkObj.sendEmail) {


        // 2. 입력된 인증번호가 6자리가 맞는지 확인
        if (cNumber.value.length == 6) { // 6자리 맞음

            $.ajax({
                url: "checkNumber",
                data: {
                    "cNumber": cNumber.value,
                    "userEmail": userEmail.value
                },
                type: "GET",
                success: function (result) {

                    // 1 : 인증번호 일치 O, 시간 만족O
                    // 2 : 인증번호 일치 O, 시간 만족X
                    // 3 : 인증번호 일치 X

                    if (result == 1) {

                        clearInterval(checkInterval); // 타이머 멈춤

                        cMessage.innerText = "인증되었습니다.";
                        cMessage.classList.add("confirm");
                        cMessage.classList.remove("error");
                        checkObj.cNumber = true;

                    } else if (result == 2) {
                        alert("만료된 인증 번호 입니다.");

                        checkObj.cNumber = false;

                    } else { // 3
                        alert("인증 번호가 일치하기 않습니다.");

                        checkObj.cNumber = false;
                    }


                },

                error: function () {
                    //   console.log("이메일 인증 실패")
                }
            });



        } else { // 6자리 아님
            alert("인증번호를 정확하게 입력해주세요.");
            cNumber.focus();
            checkObj.cNumber = false;
        }

    } else { // 인증번호를 안받은 경우
        alert("인증번호 받기 버튼을 먼저 클릭해주세요.");

    }

});



/* 카카오 주소 API */
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {

            var roadAddr = data.roadAddress; // 도로명 주소 변수


            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;

            document.getElementById("sample4_detailAddress").readOnly = false;
        }
    }).open();
}





