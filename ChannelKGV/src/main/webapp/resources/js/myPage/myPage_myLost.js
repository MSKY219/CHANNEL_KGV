$(document).ready(function(){
    const deleteLost = $("#deleteLost"); 

        deleteLost.on('click', function(){
      
            let lostNo = $(this).data('lostno');
            let cp = $("#cp").val(); // HTML에서 'cp' 값 가져오기
            
            let url = `/movie/myPage/deleteLost/${lostNo}?cp=`+cp;

            if( confirm("정말로 삭제 하시겠습니까?") ){
                window.location.href = url; // get방식으로 url에 요청
            }
        });
        $(".btn_wraper button").hover(
          function () {
            $(this).find("a").addClass("hover");
          },
          function () {
            $(this).find("a").removeClass("hover");
          }
        );
});

// 이미지 크게보기
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
