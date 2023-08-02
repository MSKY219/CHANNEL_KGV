$(document).ready(function () {
  $(".stheater_wrap ul li").hover(
    function () {
      $(this).find("a").addClass("hovered");
    },
    function () {
      $(this).find("a").removeClass("hovered");
    }
  );
});

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
