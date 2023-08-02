$(document).ready(function () {
    // 관리자 권한 부여 설정
    const checkBtn = $('.checkBtn');
    const manager = $('.Is_Manager');
    const block = $('.Is_Blocked');


    manager.on('change', (e) => {
        let clickTarget = $(e.currentTarget).val();
        //console.log("가져온 아이디는 : " + $(e.currentTarget).data('id'));


        if (clickTarget == 'Y') {
            //console.log("Y가 찍힘" + clickTarget);

            $.ajax({
                url: "Manager_ST",
                data: {
                    "MST": $(e.currentTarget).val()
                    , "userId": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        //console.log("N -> Y로 변경 완료");
                        alert("관리자 상태 변경 완료!");
                    } else {
                        //console.log("N -> Y로 변경 실패");
                        alert("관리자 상태 변경 실패!");
                    }
                },

                error: function () {
                    //console.log("error : N -> Y로 변경 실패");
                }
            });




        } else {
            //console.log("N이 찍힘" + clickTarget);

            $.ajax({
                url: "Manager_ST",
                data: {
                    "MST": $(e.currentTarget).val()
                    , "userId": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        //console.log("Y -> N으로 변경 완료");
                        alert("관리자 상태 변경 완료!");
                    } else {
                        //console.log("Y -> N으로 변경 실패");
                        alert("관리자 상태 변경 완료!");
                    }
                },

                error: function () {
                    //console.log("error : Y -> N으로 변경 실패");
                }
            });





        }

    });


    // 유저 이용제한

    block.on('change', (e) => {
        let clickTarget = $(e.currentTarget).val();
        //console.log("가져온 아이디는 : " + $(e.currentTarget).data('id'));


        if (clickTarget == 'Y') {
            //console.log("Y가 찍힘" + clickTarget);

            $.ajax({
                url: "Block_ST",
                data: {
                    "BST": $(e.currentTarget).val()
                    , "userId": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        //console.log("N -> Y로 변경 완료");
                        alert("유저 이용제한 변경 완료!");
                    } else {
                        //console.log("N -> Y로 변경 실패");
                        alert("유저 이용제한 변경 실패!");
                    }
                },

                error: function () {
                    //console.log("error : N -> Y로 변경 실패");
                }
            });




        } else {
            //console.log("N이 찍힘" + clickTarget);

            $.ajax({
                url: "Block_ST",
                data: {
                    "BST": $(e.currentTarget).val()
                    , "userId": $(e.currentTarget).data('id')
                },
                type: "POST",
                success: function (result) {
                    if (result > 0) {
                        //console.log("Y -> N으로 변경 완료");
                        alert("유저 이용제한 변경 완료!");
                    } else {
                        //console.log("Y -> N으로 변경 실패");
                        alert("유저 이용제한 변경 완료!");
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