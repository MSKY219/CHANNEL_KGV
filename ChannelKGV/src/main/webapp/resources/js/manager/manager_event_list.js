$(document).ready(function () {
    const eventSt = $('.Is_On');
    const checkBtn = $('td > .checkBtn');

    eventSt.on('change', (e) => {
        let clickTarget = $(e.currentTarget).val();
        //console.log("가져온 아이디는 : " + $(e.currentTarget).data('id'));
        //console.log("clickTarget : " + clickTarget);

        if (clickTarget == 'Y') {
            //console.log("Y가 찍힘" + clickTarget);

            $.ajax({
                url: "event_ST",
                data: {
                    "EST": $(e.currentTarget).val()
                    , "eventNo": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        //console.log("N -> Y로 변경 완료");
                        alert("이벤트 상태 변경 완료!");
                    } else {
                        //console.log("N -> Y로 변경 실패");
                        alert("이벤트 상태 변경 실패!");
                    }
                },

                error: function () {
                    //console.log("error : N -> Y로 변경 실패");
                }
            });




        } else {
            //console.log("N이 찍힘" + clickTarget);

            $.ajax({
                url: "event_ST",
                data: {
                    "EST": $(e.currentTarget).val()
                    , "eventNo": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        //console.log("Y -> N으로 변경 완료");
                        alert("이벤트 상태 변경 완료!");
                    } else {
                        //console.log("Y -> N으로 변경 실패");
                        alert("이벤트 상태 변경 완료!");
                    }
                },

                error: function () {
                    //console.log("error : Y -> N으로 변경 실패");
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