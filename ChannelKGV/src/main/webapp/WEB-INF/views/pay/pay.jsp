<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
    

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
  

</head>

<body>
    <div id="wrap">
        
        <!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


        <!-- 예매 페이지  -->

        <main>
            <section>
                <div>
                    <div>
                        <!-- 타이틀 영역-->
                        <div>
                            <span>예매 내역</span>
                            <div>
                                <input type="hidden" id="userEmail" value="${loginUser.userEmail}">
                                <input type="hidden" id="userName" value="${loginUser.userName}">
                                <input type="hidden" id="bookNo" value="${bookNo}">
                            </div>
                        </div>


                        <!-- 할인&혜택 영역 -->
                        <div class="discount_step">
                            <ul>
                                <li class="discount_step_li slide">
                                    <div>
                                        <i class="fa-sharp fa-solid fa-circle-exclamation"></i>
                                    </div>
                                    <span class="discount_step_li_name">할인/혜택 사용</span>
                                    <div>
                                        <i class="fa-solid fa-caret-down"></i>
                                    </div>
                                </li>

                                <ul class="displayChoice slide_none">
                                    <li class="discount_step_li modalClick">
                                        <div>
                                            <i class="fa-solid fa-ticket"></i>
                                        </div>
                                        <span>관람권 사용</span>
                                    </li>
                                    <li class="discount_step_li">
                                        <div>
                                            <i class="fa-solid fa-crown"></i>
                                        </div>
                                        <span>VIP 혜택</span>
                                    </li>
                                </ul>
                            </ul>
                        </div>

                        <!-- 결제 api 전 단계 영역-->
                        <div class="pay_step">
                            <table>
                                <tr>
                                    <th>예매가격</th>
                                    <th></th>
                                    <th>할인가격</th>
                                    <th></th>
                                    <th>최종결제가격</th>
                                </tr>
                                <tr>
                                    <th class="reservePrice">${reservePrice}</th>
                                    <th class="minus">-</th>
                                    <th class="discountPrice">0</th>
                                    <th>=</th>
                                    <th class="finshPrice">${reservePrice}</th>
                                </tr>
                            </table>
                        </div>

                        <!-- 결제하기 영역 -->
                        <div>
                            <div>
                                <button class="payBtn">결제하기</button>
                            </div>
                        </div>



                    </div>
                </div>


            </section>

            <div class="modal areaModal">
                <div class="box_1">
                    <div>
                        <span>KGV 관람권</span>
                        <div>
                            <i class="fa-solid fa-square-xmark exitBtn"></i>
                        </div>
                    </div>
                </div>

                <div>
                    <!-- 타이틀 -->

                    <!-- 중간 -->
                    <div class="box_2">

                        <div class="box_2_1">
                            <span>보유하신 관람권은 등록 후 사용하실 수 있습니다.</span>
                            <span>사용할 관람권을 등록 또는 선택 해주세요.</span>
                        </div>

                        <div class="box_2_2">

                            <div>
                                <span>관람권번호</span>
                            </div>
                            <div>
                                <input type="text" name="ticketCode" id="ticketCode" placeholder="관람권번호 12자리 입력">
                            </div>
                            <div>
                                <button id="movieTicket">관람권 등록</button>
                            </div>

                        </div>
                        <div id="container2_3">
                            <div class="box_2_3">
                                <div class="box_2_3_1">
                                    <table class="ticketTable_1">
                                        <tr class="table_header">
                                            <th>관람권</th>
                                            <th>상태</th>
                                            <th>적용하기</th>
                                        </tr>
                                    </table>
                                </div>

                                <div class="box_2_3_2">
                                    <table class="ticketTable_2">
                                        
                                      <c:forEach var="coupon" items="${storeCouponList}">
                                                <tr>
                                                    <th>
                                                        ${storeCouponList.couponDetailNo}
                                                    </th>
                                                    <th>
                                                        ${storeCouponList.couponSt}
                                                    </th>
                                                    <th>
                                                        <button>미사용</button>
                                                    </th>
                                                </tr>
                                      </c:forEach>    


                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="box_2_4">
                            <div>
                                <span>
                                    이용안내<br>
                                    관람권 사용으로 인한 차액금은 반환불가<br>
                                    온라인에 등록된 관람권은 극장 매표소에서는 사용이 불가합니다<br>
                                    등록된 관람권은 나의 KGV에서 확인하실 수 있습니다
                                </span>
                            </div>
                        </div>
                    </div>


                    <!-- 버튼 -->
                    <div class="box_3">
                        <div>
                            <button class="exitBtn">닫기</button>
                            <button class="useBtn">적용</button>
                        </div>
                    </div>
                </div>
            </div>

        </main>

    </div>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/pay/pay.js"></script>
    <script src="${contextPath}/resources/js/pay/pay_iamport.js"></script>
    <script src="${contextPath}/resources/js/manager/apikey.js"></script>
</body>

</html>