function zoomIn(event) {
    event.target.style.transform = "scale(1.05)"; //1.2배 확대
    event.target.style.zIndex = 1;
    event.target.style.transition = "all 0.5s";// 속도
}
  function zoomOut(event) {
    event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.5s";
}

// 이벤트 슬라이더*******************************************************************
$(document).ready(function() {
    var swiper = new Swiper('.event-wrap > div >  .swiper-container', {
        slidesPerView:3,
        spaceBetween: 32,
        navigation: {
            nextEl: '.event-wrap .swiper-button-next',
            prevEl: '.event-wrap .swiper-button-prev',
        },
       
        touchMoveStopPropagation: false,  
        touchReleaseOnEdges: false,  
        threshold: 20,  // 일정 거리를 조절하는 값
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
    });
    swiper.el.addEventListener('mouseenter', function () {
    swiper.autoplay.stop();
   });
   swiper.el.addEventListener('mouseleave', function () {
    swiper.autoplay.start();
   });
});
