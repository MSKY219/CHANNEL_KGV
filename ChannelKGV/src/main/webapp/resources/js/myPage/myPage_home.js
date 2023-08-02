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
  