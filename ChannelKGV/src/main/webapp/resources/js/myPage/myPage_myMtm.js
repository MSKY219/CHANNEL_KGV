$(document).ready(function(){
    const deleteMtm = $("#deleteMtm"); 

    	deleteMtm.on('click', function(){
  
        	let mtmNo = $(this).data('mtmno');
    		let cp = $("#cp").val(); // HTML에서 'cp' 값 가져오기
        	let url = `/movie/myPage/deleteMtm/${mtmNo}?cp=`+cp; // URL에 'cp' 파라미터 값을 추가합니다.

        	if( confirm("정말로 삭제 하시겠습니까?") ){
            	window.location.href = url;
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
  