$(document).ready(function () {
  $(".navBar, .dummy").hover(
    function () {
      $(".navBar ul").stop().slideDown(150);
      $(".dummy").css("display", "flex");
    },
    function () {
      $(".navBar ul").stop().slideUp(150);
      $(".dummy").css("display", "none");
    }
  );

  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $(".go_top_area")
        .fadeIn()
        .children("div")
        .children("a:nth-child(1)")
        .addClass("slide-in");
    } else {
      $(".go_top_area").hide();
    }
  });

  $(".go_top_area > div > a:nth-child(1)").click(function () {
    $("html, body").animate({ scrollTop: 0 }, 200);
    return false;
  });

  $("#submitBTN").click(function (e) {
    var input = $('input[name="hkeyword"]').val().trim();
    var regex = /^[A-Za-z가-힣]{2,}$/;
    var entityRegex =
      /<[^>]*>|&[a-zA-Z0-9#]+;|&lt;br&gt;|<br>|br|nb|bs|sp|nbs|bsp/;

    if (!regex.test(input) || entityRegex.test(input)) {
      e.preventDefault();
      if (input.length == 0) {
        alert("검색어를 입력해주세요");
      } else if (entityRegex.test(input)) {
        window.location.href = "/movie/movieList/all_List";
      } else {
        alert("두 글자 이상의 한글 혹은 영어를 입력해주세요");
      }
    }
  });
});
