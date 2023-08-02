function zoomIn(event) {
  event.target.style.transform = "scale(1.05)"; //1.2배 확대
  event.target.style.zIndex = 1;
  event.target.style.transition = "all 0.5s"; // 속도
}
function zoomOut(event) {
  event.target.style.transform = "scale(1)";
  event.target.style.zIndex = 0;
  event.target.style.transition = "all 0.5s";
}

$(document).ready(function () {
  var swiper = new Swiper(".swiper-container", {
    slidesPerView: 2,

    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },

    touchMoveStopPropagation: false,
    touchReleaseOnEdges: false,
    threshold: 20, // 일정 거리를 조절하는 값
    on: {
      touchEnd: function () {
        if (this.snapIndex === this.previousIndex) {
          swiper.slideTo(this.snapIndex);
        }
      },
    },
    autoplay: {
      delay: 10000,
      disableOnInteraction: false,
    },
    loop: true,
  });
  swiper.el.addEventListener("mouseenter", function () {
    swiper.autoplay.stop();
  });
  swiper.el.addEventListener("mouseleave", function () {
    swiper.autoplay.start();
  });
});

$(document).ready(function () {
  $(".qesform").on("submit", function (e) {
    var input = $('input[name="keyword"]').val().trim();
    var regex = /^[A-Za-z가-힣]{2,}$/;
    var entityRegex =
      /<[^>]*>|&[a-zA-Z0-9#]+;|&lt;br&gt;|<br>|br|nb|bs|sp|nbs|bsp/;

    if (!regex.test(input) || entityRegex.test(input)) {
      e.preventDefault();
      if (input.length == 0) {
        alert("검색어를 입력해주세요");
      } else if (entityRegex.test(input)) {
        window.location.href = "/movie/helpDesk/question_home";
      } else {
        alert("두 글자 이상의 한글 혹은 영어를 입력해주세요");
      }
    }
  });
});

$(document).ready(function () {
  $(".notyet").click(function () {
    alert("준비중입니다.");
  });
});
