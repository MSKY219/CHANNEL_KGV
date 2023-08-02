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

function setCookie(name, value, exhours) {
  var date = new Date();
  date.setTime(date.getTime() + exhours * 60 * 60 * 1000);
  var expires = "expires=" + date.toUTCString();
  document.cookie = name + "=" + value + ";" + expires + ";path=/movie";
}

function getCookie(name) {
  var name = name + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(";");
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// 메인 이미지 무한 슬라이더************************************************************
$(document).ready(function () {
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

  var swiper = new Swiper("main section:nth-of-type(1) .swiper-container", {
    slidesPerView: 1,
    spaceBetween: 100,
    navigation: {
      nextEl: " main section:nth-of-type(1) .swiper-button-next",
      prevEl: " main section:nth-of-type(1) .swiper-button-prev",
    },
    autoplay: {
      delay: 10000,
      disableOnInteraction: false,
    },
    loop: true, // Enable infinite sliding
  });
  swiper.el.addEventListener("mouseenter", function () {
    swiper.autoplay.stop();
  });
  swiper.el.addEventListener("mouseleave", function () {
    swiper.autoplay.start();
  });

  var swiper = new Swiper("main section:nth-of-type(2) .swiper-container", {
    slidesPerView: 4,
    spaceBetween: 32,
    navigation: {
      nextEl: "main section:nth-of-type(2) .swiper-button-next",
      prevEl: "main section:nth-of-type(2) .swiper-button-prev",
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
  });

  var swiper = new Swiper(
    "main section:nth-of-type(3) > div >  .swiper-container",
    {
      slidesPerView: 3,
      spaceBetween: 32,
      navigation: {
        nextEl: "main section:nth-of-type(3) .swiper-button-next",
        prevEl: "main section:nth-of-type(3) .swiper-button-prev",
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
    }
  );
  swiper.el.addEventListener("mouseenter", function () {
    swiper.autoplay.stop();
  });
  swiper.el.addEventListener("mouseleave", function () {
    swiper.autoplay.start();
  });

  var theater = $(".stheater");
  var rightSide = $(".deleteUnderline");

  var lastActiveTheater = theater.first();
  var lastActiveUnderline = null;

  theater.css("display", "none");
  theater.first().css("display", "block");

  for (var i = 0; i < theater.length; i++) {
    (function (i) {
      var underlineSpan = $(rightSide[i]).children("span").first();

      $(rightSide[i]).on("mouseenter", function () {
        // If there was a previously active underline, reset its styles
        if (lastActiveUnderline) {
          var lastUnderlineSpan = lastActiveUnderline.children("span").first();
          lastUnderlineSpan.css("font-weight", "normal");
          lastActiveUnderline.css("border", "none");
          if (i > 0) {
            // For non-first elements, also reset the border-top
            $(rightSide[i - 1]).css("border-bottom", "none");
          }
        }

        theater.css("display", "none");
        $(theater[i]).css("display", "block");

        underlineSpan.css("font-weight", "bold");
        $(rightSide[i]).css("border", "3px solid #a3a3a3");
        $(rightSide[i]).css("border-radius", "10px");
        $(rightSide[i + 1]).css("border-top", "none");

        lastActiveTheater = $(theater[i]); // 마지막으로 활성화된 stheater를 업데이트
        lastActiveUnderline = $(rightSide[i]); // 마지막으로 활성화된 underline 업데이트
      });
    })(i);
  }

  // 모달 닫기 이벤트
  $(".closemdp").click(function () {
    $(".modal_wrap").css("display", "none");
    $("body").removeClass("modal-open"); // 클래스 제거
  });

  // if (getCookie("modal_closed") == "true") {
  //   $(".modal_wrap").css("display", "none");
  // }

  if (getCookie("modal_closed") != "true") {
    $("body").addClass("modal-open");
    $(".modal_wrap").css("display", "flex");
  } else {
    $(".modal_wrap").css("display", "none");
  }

  // "24시간동안 닫기" 링크 클릭 시, 쿠키 설정
  $(".closemdp").click(function () {
    $(".modal_wrap").css("display", "none");
    setCookie("modal_closed", "true", 24); // 쿠키 이름: "modal_closed", 쿠키 값: "true", 만료시간: 24시간
  });
});
