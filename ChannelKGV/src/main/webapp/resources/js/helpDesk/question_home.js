$(document).ready(function () {
  $(".selected_Cp").parent().css("border", "1px solid rgb(255, 196, 0)");

  $("#questListContainer").on("click", ".qList", function () {
    var qListDetail = $(this).next(".qList_detail");
    if (qListDetail.hasClass("none")) {
      $(".qList_detail").slideUp().addClass("none").removeClass("block");
      qListDetail.slideDown().removeClass("none").addClass("block");
    } else {
      qListDetail.slideUp().removeClass("block").addClass("none");
    }
  });

  $("#questListContainer li:first ul").css("display", "block");

  $(".btn-quest").click(function () {
    $(".btn-wrap button").css({
      "background-color": "#151515",
      color: "white",
    });

    $(this).css({
      "background-color": "#FFC400",
      color: "black",
    });

    var questNum = $(this).data("quest-num");

    $.ajax({
      url: "/movie/helpDesk/question_home",
      type: "POST",
      data: {
        questNum: questNum,
      },
      success: function (response) {
        $(".counts").text(response.qescount);
        $("#questListContainer").empty();

        var questListHtml = "";
        $.each(response.questList.questList, function (index, quest) {
          if (index < 10) {
            questListHtml +=
              '<li><div class="qList"><p>' +
              quest.questType +
              "</p><p><span><strong>Q</strong> " +
              quest.questTitle +
              '</span> <span><i class="fa-solid fa-chevron-down"></i></span></p></div><ul class="qList_detail none"><li>' +
              quest.questContent +
              "</li></ul></li>";
          }
        });
        $("#questListContainer").html(questListHtml);

        $("#questListContainer li:first ul").css("display", "block");

        // Pagination 처리
        if (questNum == 0) {
          var paginationHtml = "";
          var pagination = response.questList.pagination;
          var url = "?cp=";

          paginationHtml += '<div><a href="' + url + '1">&lt;&lt;</a></div>';
          paginationHtml +=
            '<div><a href="' + url + pagination.prevPage + '">&lt;</a></div>';

          for (var i = pagination.startPage; i <= pagination.endPage; i++) {
            if (i === pagination.currentPage) {
              paginationHtml +=
                '<div><a class="selected_Cp">' + i + "</a></div>";
            } else {
              paginationHtml +=
                '<div><a href="' + url + i + '">' + i + "</a></div>";
            }
          }

          paginationHtml +=
            '<div><a href="' + url + pagination.nextPage + '">&gt;</a></div>';
          paginationHtml +=
            '<div><a href="' +
            url +
            pagination.maxPage +
            '">&gt;&gt;</a></div>';

          $(".page_Nation").html(paginationHtml);
        } else {
          $(".page_Nation").empty();
        }
      },
    });
  });

  let params = new URLSearchParams(window.location.search);
  let keyword = params.get("keyword");

  if (keyword) {
    let content = document.getElementById("questListContainer");
    let re = new RegExp(keyword, "g");
    content.innerHTML = content.innerHTML.replace(
      re,
      `<span class='highlight'>${keyword}</span>`
    );
  }
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
