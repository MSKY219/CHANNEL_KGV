$(document).ready(function () {
  $(".selected_Cp").parent().css("border", "1px solid rgb(255, 196, 0)");
});

let imageUrl1 = "";

$(document).ready(function () {
  let fileInput = $("#fileInput");

  $("#fileInput").on("change", function () {
    if (this.files && this.files[0]) {
      $(".addfileList").empty();

      var file = this.files[0];
      var reader = new FileReader();

      reader.onload = function (e) {
        $(".addfileList").append(
          '<div class="upimgList">' +
            '<span class="deleteImage">X</span>' +
            '<img src="' +
            e.target.result +
            '">' +
            "</div>"
        );
        imageUrl1 = e.target.result;
      };

      reader.readAsDataURL(file);
    }
  });

  $(document).on("click", ".deleteImage", function () {
    $(this).parent().remove();
    $("#fileInput").val("");
    imageUrl1 = "";
  });

  fileInput.on("change", function (e) {
    for (var i = 0; i < e.target.files.length; i++) {
      if (!checkExtension(e.target.files[i].name, e.target.files[i].size)) {
        movie_image1.val("");
        return false;
      }
      uploadImageFile1(e.target.files[i]);
    }
  });

  let regex = new RegExp("(.*?.(png|jpg|gif|jpeg)$)");
  let maxSize = 5000000; // 5MB 제한

  function checkExtension(fileName, fileSize) {
    if (fileSize >= maxSize) {
      alert("파일 사이즈 초과");
      return false;
    }
    if (!regex.test(fileName)) {
      alert(
        "해당 종류 파일은 업로드 안됨.\n PNG, JPG, GIF, JPEG 만 가능합니다."
      );
      return false;
    }
    return true;
  }

  let imageUrl1;

  function uploadImageFile1(file) {
    var data = new FormData();
    data.append("file", file);
    $.ajax({
      url: "uploadImage",
      type: "POST",
      data: data,
      cache: false,
      contentType: false,
      processData: false,
      success: function (data1) {
        var jsonObject = JSON.parse(data1);
        imageUrl1 = jsonObject.url;
      },
      error: function (e) {},
    });
  }

  $(".btn_wraper button").hover(
    function () {
      $(this).find("a").addClass("hover");
    },
    function () {
      $(this).find("a").removeClass("hover");
    }
  );

  var isChecked = $("#checkbox1").is(":checked");
  updateOpenStatus(isChecked);

  $("#checkbox1").change(function () {
    isChecked = $(this).is(":checked");
    updateOpenStatus(isChecked);
  });

  function updateOpenStatus(isChecked) {
    if (isChecked) {
      alert("현재 작성하신 글이 공개됩니다.");
      $("#openStatus").text("공개 글 입니다.");
    } else {
      $("#openStatus").text("현재 비공개 상태입니다.");
    }
  }

  const replyWrite = $("#reply_writeBtn");

  replyWrite.on("click", function () {
    const mtmNo = $(this).data("mtmno");
    const content = $("#contentTextarea").val();
    const url = `/movie/helpDesk/replyWrite/${mtmNo}`;

    if (confirm("답변을 등록 하시겠습니까?")) {
      $.ajax({
        type: "POST",
        url: url,
        data: { contentTextarea: content },
        success: function (response) {
          var url = `/movie/helpDesk/mTm_detail/${mtmNo}`;
          location.href = url;
        },
        error: function (error) {
          console.error(error);
        },
      });
    }
  });

  const replyDelete = $("#reply_deleteBtn");

  replyDelete.on("click", function () {
    const mtmNo = $(this).data("mtmno");
    const url = `/movie/helpDesk/replyDelete/${mtmNo}`;

    if (confirm(" 답변을 정말로 삭제 하시겠습니까?")) {
      window.location.href = url;
    }
  });

  const deleteMtm = $("#deleteMtm");
  const updateMtm = $("#updateMtm");

  deleteMtm.on("click", function () {
    let mtmNo = $(this).data("mtmno");
    let cp = $("#cp").val();
    let url = `/movie/helpDesk/deleteMtm/${mtmNo}?cp=` + cp;

    if (confirm("정말로 삭제 하시겠습니까?")) {
      window.location.href = url;
    }
  });

  updateMtm.on("click", function () {
    let mtmNo = $(this).data("mtmno");
    let url = `/movie/helpDesk/mTm_form/` + mtmNo;
    window.location.href = url;
  });

  $(document).on("click", ".deleteImage", function () {
    $(this).parent().remove();
    $("#fileInput").val("");
  });

  $("#submitButton").click(function (e) {
    let imageUrl1 = $(".upimgList img").attr("src");

    var title = $("#titleInput").val();
    var inquiry = $("#inquirySelect").val();
    var content = $("#contentTextarea").val();
    var userNo = $("#userNo").val();
    var open = $("#checkbox1").is(":checked") ? 0 : 1111;

    if (!title) {
      alert("제목을 입력해주세요");
      e.preventDefault();
      return;
    }
    if (!inquiry || inquiry === "문의 내용을 선택해주세요.") {
      alert("문의종류를 선택해주세요");
      e.preventDefault();
      return;
    }
    if (!content) {
      alert("내용을 입력해주세요");
      e.preventDefault();
      return;
    }

    $.ajax({
      type: "POST",
      url: "/movie/helpDesk/mTm_form",
      data: {
        titleInput: title,
        inquirySelect: inquiry,
        contentTextarea: content,
        userNo: userNo,
        open: open,
        imageUrl1: imageUrl1,
      },
      success: function (response) {
        var mtmNo = response.mtmNo;
        alert("작성성공");
        var url = `/movie/helpDesk/mTm_detail/${mtmNo}`;
        location.href = url;
      },
      error: function (xhr, status, error) {
        alert("오류 발생");
      },
    });
  });

  $("#updateButton").click(function (e) {
    var mtmNo = $("#mtmNo").val();
    var title = $("#titleInput").val();
    var inquiry = $("#inquirySelect").val();
    var content = $("#contentTextarea").val();
    var open = $("#checkbox1").is(":checked") ? 0 : 1111;

    if (!$("#fileInput").val() && $(".upimgList img").length > 0) {
      imageUrl1 = $(".upimgList img").attr("src");
    }

    if (!title) {
      alert("제목을 입력해주세요");
      e.preventDefault();
      return;
    }
    if (!inquiry || inquiry === "문의 내용을 선택해주세요.") {
      alert("문의종류를 선택해주세요");
      e.preventDefault();
      return;
    }
    if (!content) {
      alert("내용을 입력해주세요");
      e.preventDefault();
      return;
    }

    var confirmation = confirm("정말로 이 문의를 수정하시겠습니까?");

    if (confirmation) {
      $.ajax({
        type: "POST",
        url: "/movie/helpDesk/mTm_form/" + mtmNo,
        data: {
          titleInput: title,
          inquirySelect: inquiry,
          contentTextarea: content,
          open: open,
          imageUrl1: imageUrl1,
        },
        success: function (response) {
          var mtmNo = response.mtmNo;
          alert("수정을 완료하였습니다.");
          var url = `/movie/helpDesk/mTm_detail/${mtmNo}`;
          location.href = url;
        },
        error: function (xhr, status, error) {
          alert("오류 발생");
        },
      });
    } else {
    }
  });
});

function showImage(imgName) {
  var img = new Image();
  img.onload = function () {
    var width = this.width;
    var height = this.height;
    var win = window.open(
      "",
      "Image",
      "width=" + width + ",height=" + height + ",resizable=1"
    );

    win.document.write("<html><head><title>Image</title></head><body>");
    win.document.write(
      "<img src='" +
        imgName +
        "' style='position:absolute; left:0; top:0; width:100%; height:100%; cursor:pointer;' onclick='window.close();' />"
    );
    win.document.write("</body></html>");
    win.document.close();
  };
  img.src = imgName;
}
