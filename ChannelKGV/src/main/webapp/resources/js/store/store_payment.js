$(document).ready(function () {
    var IMP = window.IMP;

    const imm = config.imp1;

    IMP.init(imm);




    $("#chkTerm").on("click", function () {

        $(".chk_List input[type='checkbox']").prop("checked", $(this).is(":checked"));
    });


    $(".chk_List input[type='checkbox']").on("click", function () {

        var allChecked = $(".chk_List input[type='checkbox']").length === $(".chk_List input[type='checkbox']:checked").length;

        $("#chkTerm").prop("checked", allChecked);
    });




    $(".pay_btn_box").on("click", function () {
        $(this).toggleClass("active");
    });



    $('.pay_Submit').on("click", function (e) {
        var paymentSelected = $(".pay_btn_box").hasClass("active");

        var allChecked = $(".chk_List input[type='checkbox']:not(#chkTerm01)").length === $(".chk_List input[type='checkbox']:not(#chkTerm01):checked").length;
        var TermChecked = $("#chkTerm01").prop("checked");


        if (!paymentSelected) {
            e.preventDefault();
            alert('결제수단을 선택해주세요.');
        } else if (!allChecked || !TermChecked) {
            e.preventDefault();
            alert('약관동의를 모두 해주세요.');
        } else {
            // console.log('결제버튼이 눌림.');
            requestPay();
        }

    })


});


const storeNo = $('#storeNo').val();
// console.log('스토어 넘버', storeNo);
const userEmail = $('#userEmail').val();

// console.log(userEmail);
const userNo = $('#userNo').val();

// console.log('유저 넘버', userNo);

const userName = $('#userName').val();
// console.log(userName);
var totalPrice = parseInt($('#totalPrice').text().replace(/,/g, ''));
// console.log('결제 금액:', totalPrice);
var storeName = $("#storeName").text();
// console.log('스토어 이름:', storeName);
var totalCount = parseInt($('#totalCount').text().replace(/,/g, ''));
// console.log('총개수:', totalCount);


function requestPay() {
    IMP.request_pay(
        {
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: storeName,
            amount: totalPrice,
            buyer_email: userEmail,
            buyer_name: userName

        },
        function (rsp) {


            // console.log(rsp);

            // 결제검증
            $.ajax({

                type: "POST",
                url: "/movie/store/storeMain/store_detail/store_payment/" + storeNo + "/verifyIamport/" + rsp.imp_uid
            }).done(function (data) {

                // console.log(data);
                // console.log(rsp.merchant_uid);


                if (rsp.paid_amount == data.response.amount) {

                    //console.log("결재 및 결재검증완료");
                    //결제 성공 시 비즈니스 로직
                    orderDetailNo = 'odn_' + new Date().getTime();


                    $.ajax({
                        url: "/movie/store/storeMain/store_detail/store_payment/" + storeNo + "/successPayment",
                        data: {
                            "orderPrice": totalPrice
                            , "orderCount": totalCount
                            , "storeName": storeName
                            , "storeNo": storeNo
                            , "userEmail": userEmail
                            , "orderDetailNo": rsp.merchant_uid
                            , "userName": userName
                            , "imp_uid": rsp.imp_uid
                        },
                        type: "POST",

                        success: function (result) {
                            //console.log("결제성공");

                            if (result > 0) {
                                alert("결제에 성공하셨습니다.");
                                let url = "/movie/store/store_Success";

                                window.location.href = url;

                            } else {
                                // console.log("에러 발생으로 인해 등록 실패");
                            }
                        },

                        error: function () {
                            // console.log("에러 발생으로 인해 등록 실패");
                        }
                    });





                } else {
                    alert("결제 실패");
                }
            });
        });
}




$(document).ready(function () {
    // modalClick 클래스 클릭 이벤트 처리
    $(".modalClick").click(function () {
        $(".modal").show(); // 모달 표시


    });

    // 모달 내부의 닫기 버튼 클릭 이벤트 처리
    $(".exitBtn").click(function () {
        $(".modal").hide(); // 모달 숨기기
    });
});



/*모달 약관 버튼 관련 js*/

$(".modalClick").click(function () {
    var termId = "#" + $(this).data("term");

    $(".terms-content > div[class^='txtarea_box']").hide();
    $(termId).show();
});

$(".storeTab").click(function (e) {
    e.preventDefault();
    var termId = "#" + $(this).data("term");

    $(".terms-content > div[id^='txtTerm']").hide();
    $(termId).show();
});