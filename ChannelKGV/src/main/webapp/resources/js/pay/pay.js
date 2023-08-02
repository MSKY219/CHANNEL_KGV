let couponDetailNo = 0;
let couponStVal = 0;
let totalCount = 0;
let couponCount = 0;
let couponSt = "";
let couponArray = [];
let usedCouponArray = [];
let tempCouponArray = [];

$(document).ready(function () {
  $(".payBtn").on("click", function () {
    var confirmMessage = "결제 하시겠습니까?";
    if (confirm(confirmMessage)) {
      requestPay();
    }
  });
});

$.ajax({
  url: "loadPay",
  data: {},
  type: "GET",
  success: function (seatCount) {
    totalCount = seatCount;
  },
  error: function () {},
});

// DOMContentLoaded 이벤트 핸들러
document.addEventListener("DOMContentLoaded", function () {
  var discountStepLi = document.querySelector(".discount_step_li.slide");
  discountStepLi.addEventListener("click", handleClick);
});

// 클릭 이벤트 핸들러
function handleClick(event) {
  var target = event.target;
  var parentLi = target.closest(".discount_step_li");
  var displayChoice = parentLi.nextElementSibling; // 다음 형제 요소

  toggleClass(displayChoice, "slide_none");
  toggleClass(parentLi, "click_change_bColor");

  setTimeout(function () {
    toggleClass(displayChoice, "slide_block");
  }, 0);
}

// toggleClass 함수 정의
function toggleClass(element, className) {
  if (element.classList.contains(className)) {
    element.classList.remove(className);
  } else {
    element.classList.add(className);
  }
}

///////////////////////////////////////////////////////////////////

// 모달
$(document).ready(function () {
  // modalClick 클래스 클릭 이벤트 처리
  $(".modalClick").click(function () {
    $(".modal").show(); // 모달 표시

    tempCouponArray = [];
  });

  // 모달 내부의 닫기 버튼 클릭 이벤트 처리
  $(".exitBtn").click(function () {
    var confirmMessage = "KGV 관람권 사용을 취소하시겠습니까?";
    if (confirm(confirmMessage)) {
      $(".ticketTable_2").empty();
      $(".modal").hide(); // 모달 숨기기
      usedCouponArray = [];
    }
  });
});

var box1 = document.querySelector(".box_1");
var modal = document.querySelector(".modal");
var isDragging = false;
var dragOffset = { x: 0, y: 0 };

box1.addEventListener("mousedown", function (event) {
  isDragging = true;
  dragOffset.x = event.clientX - modal.offsetLeft;
  dragOffset.y = event.clientY - modal.offsetTop;
});

document.addEventListener("mousemove", function (event) {
  if (isDragging) {
    modal.style.left = event.clientX - dragOffset.x + "px";
    modal.style.top = event.clientY - dragOffset.y + "px";
  }
});

document.addEventListener("mouseup", function () {
  isDragging = false;
});

box1.addEventListener("mouseenter", function () {
  document.body.style.cursor = "move";
});

box1.addEventListener("mouseleave", function () {
  document.body.style.cursor = "default";
});

///////////////////////////////////////////////////////////////////

// 관람권 코드 확인

const movieTicket = document.getElementById("movieTicket");
const ticketCode = document.getElementById("ticketCode");
movieTicket.addEventListener("click", function () {
  $.ajax({
    url: "selectTicket",
    data: {
      COUPONNO: ticketCode.value,
    },
    type: "POST",
    success: function (couponMap) {
      if (couponMap.category == "티켓") {
        if (couponArray.indexOf(ticketCode.value) == -1) {
          couponArray.push(ticketCode.value);

          couponMap.storeCouponList.forEach(function (coupon) {
            var couponStatus = coupon.couponSt === "Y" ? "미사용" : "사용";

            var cardHTML = `
              <tr style="border: 1px solid; width: 100%; height: 30px;">
                <td class="couponDetailNo" style="border: 1px solid; width: 60.5%; text-align: center;">${coupon.couponDetailNo}</td>
                <td class="couponSt" style="border: 1px solid; width: 20.5%; text-align: center;">${coupon.couponSt}</td>
                <td style="width: 17.5%; text-align: center;">
                  <button class="couponBtn" style="width: 65px;">${couponStatus}</button>
                </td>
              </tr>
            `;
            document.querySelector(".ticketTable_2").innerHTML += cardHTML;
          });
        } else {
          alert("이미 찾아온 코드입니다");
        }
      } else if (couponMap.category == null) {
        alert("존재하지 않는 코드번호 입니다");
      } else {
        alert("코드가 올바르지 않거나 찾을 수 없습니다");
      }

      ticketCode.value = ""; // 검색후 코드 인풋란 초기화
    },
    error: function () {},
  });
});

$(document).on("click", ".couponBtn", function () {
  var couponBtn = $(this);
  couponDetailNo = couponBtn.closest("tr").find(".couponDetailNo").text();
  couponSt = couponBtn.closest("tr").find(".couponSt");

  if (couponBtn.text() === "미사용") {
    var confirmMessage = "KGC 관람권을 사용하시겠습니까?";

    if (confirm(confirmMessage)) {
      couponBtn.text("사용");
      couponSt.text("N");
      couponStVal = "N";
      tempCouponArray.push(couponDetailNo);
      couponBtn
        .closest("tr")
        .find(".couponDetailNo")
        .css("background-color", "red");
    }
  }
});

$(".useBtn").on("click", function () {
  var confirmMessage = "KGC 관람권을 사용하시겠습니까?";

  if (confirm(confirmMessage)) {
    for (let i = 0; i < tempCouponArray.length; i++) {
      usedCouponArray.push(tempCouponArray[i]);
    }

    $(".discountPrice").text(usedCouponArray.length * 5000);

    let finishPrice =
      Number($(".reservePrice").text()) - usedCouponArray.length * 5000;
    $(".finshPrice").text(Math.max(finishPrice, 0));

    $(".modal").hide();
  }
});

// 결제 api 성공후에 updateCouponStatus() 이 함수를 돌려서 st 상태를 변경해야한다.
// 상태를 먼저 변경하면 안됌
function updateCouponStatus() {
  for (let i = 0; i < usedCouponArray.length; i++) {
    $.ajax({
      url: "updateTicketStatus",
      data: {
        COUPON_DETAIL_NO: usedCouponArray[i],
      },
      type: "POST",
      success: function (result) {
        if (result > 0) {
        } else {
        }
      },
      error: function () {},
    });
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
