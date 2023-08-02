$(document).ready(function () {
    // 영화 상영 상태 설정 Y = 상영중 / N = 상영안함
    const play = $('.Is_Play');


    play.on('change', (e) => {
        let clickTarget = $(e.currentTarget).val();
        // console.log("가져온 번호는 : " + $(e.currentTarget).data('id'));


        if (clickTarget == 'Y') {
            // console.log("Y가 찍힘" + clickTarget);

            $.ajax({
                url: "Movie_ST",
                data: {
                    "MST": $(e.currentTarget).val()
                    , "movieNo": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        // console.log("N -> Y로 변경 완료");
                        alert("영화 상태 변경 완료!");
                    } else {
                        // console.log("N -> Y로 변경 실패");
                        alert("영화 상태 변경 실패!");
                    }
                },

                error: function () {
                    // console.log("error : N -> Y로 변경 실패");
                }
            });




        } else {
            // console.log("N이 찍힘" + clickTarget);

            $.ajax({
                url: "Movie_ST",
                data: {
                    "MST": $(e.currentTarget).val()
                    , "movieNo": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        // console.log("Y -> N으로 변경 완료");
                        alert("영화 상태 변경 완료!");
                    } else {
                        // console.log("Y -> N으로 변경 실패");
                        alert("영화 상태 변경 완료!");
                    }
                },

                error: function () {
                    // console.log("error : Y -> N으로 변경 실패");
                }
            });





        }

    });

    const delBtn = $('.deleteEvent');
    delBtn.on('click', (e) => {
        e.preventDefault();
        alert('삭제기능은 비활성화 하였습니다');
    })
});