$(document).ready(function () {


    const orderDetailNo = $('.orderDetailNo').text().trim();

    // console.log(orderDetailNo);



    const cancelBtn = $(".cancelPay");

    cancelBtn.on('click', function (e) {

        // console.log("환불버튼눌림");

        e.preventDefault();

        const sorderNo = $(this).data('sorderno');

        const imp_uid = $(this).data('imp_uid');

        // 가져온 sorderNo 값을 출력하거나 원하는 로직을 수행합니다.
        // console.log(sorderNo);
        // console.log(imp_uid);
        $.ajax({
            url: "/manager/coupon_cancel.do",

            //datatype:"json",
            //contentType: 'application/x-www-form-urlencoded; charset = utf-8',
            data: {
                "orderDetailNo": orderDetailNo, // 주문번호
                "sorderNo": sorderNo,
                "imp_uid": imp_uid

                //"cancle_request_amount" : 2000, //환불금액
                //"reason": "테스트 결제 환불", //환불사유
                //"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
                //"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
                //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
            },
            type: "POST",

            success: function (result) {
                // console.log("환불성공");

                if (result = 0) {
                    alert(" 환불성공 정보DB 등록 성공");
                    // let url = "/movie/store/store_Success";

                    // window.location.href = url;

                } else {
                    // console.log("에러 발생으로 인해 등록 실패");
                }
            },

            error: function () {
                // console.log("에러 발생으로 인해 등록 실패");
            }



        })

    }); //check2 클릭



    const delBtn = $('.cancelPay');
    delBtn.on('click', (e) => {
        e.preventDefault();
        alert('삭제기능은 비활성화 하였습니다');
    })






});


