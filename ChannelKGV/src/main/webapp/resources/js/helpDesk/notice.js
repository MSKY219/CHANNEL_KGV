$(document).ready(function () {
  $(".search-form").on("submit", function (e) {
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

let params = new URLSearchParams(window.location.search);
let keyword = params.get("keyword");

if (keyword) {
  let re = new RegExp(keyword, "g");

  $(".count-td a").each(function () {
    let html = $(this).html();
    let newHtml = html.replace(re, `<span class='highlight'>${keyword}</span>`);
    $(this).html(newHtml);
  });
}

$(".selected_Cp").parent().css("border", "1px solid rgb(255, 196, 0)");
