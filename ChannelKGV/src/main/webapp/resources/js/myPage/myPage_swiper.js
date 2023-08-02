
// 이벤트 슬라이더*******************************************************************
$(document).ready(function() {
    var swiper = new Swiper('.swiper-container', {
        slidesPerView:2,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
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
        loop: true,
    });
    swiper.el.addEventListener('mouseenter', function () {
    swiper.autoplay.stop();
   });
   swiper.el.addEventListener('mouseleave', function () {
    swiper.autoplay.start();
   });
    });
