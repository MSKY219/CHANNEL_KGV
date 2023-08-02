<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>전체영화</title>

                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/store/store_Success.css">

                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

                    </head>

                    <body>
                        <div id="wrap">

                            <!-- header -->
                            <jsp:include page="/WEB-INF/views/common/header.jsp" />

                            <main>


                                <div id="wrapper">

                                    <div>
                                        <div>
                                            결제완료
                                        </div>
                                        <div>
                                            <div>
                                                <div>
                                                    <div>
                                                        <div> <i class="fa-regular fa-credit-card fa-3x"></i></div>
                                                        <div> ${storeOrderList[0].userName} 회원님,<br>결제가 성공적으로 완료되었습니다.
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <div class="infor_wrap">
                                                        <div><img src="${storeList[0].storeImage}"></div>
                                                        <div>
                                                            <dl>
                                                                <dt>구매번호</dt>
                                                                <dd><strong
                                                                        class="txt_num">${storeOrderList[0].orderDetailNo}</strong>
                                                                </dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>상품명</dt>
                                                                <dd>${storeOrderList[0].storeName}</dd>
                                                                <dt>수량</dt>
                                                                <dd>${storeOrderList[0].orderCount}개</dd>
                                                                <dt>교환번호</dt>
                                                                <dd>
                                                                    <c:forEach items="${storeCouponList}" var="coupon">
                                                                        ${coupon.couponDetailNo}
                                                                    </c:forEach>
                                                                </dd>
                                                            </dl>
                                                        </div>

                                                    </div>
                                                    <div class="payment_wrap">
                                                        <div>
                                                            <dl>
                                                                <dt>주문금액</dt>
                                                                <dd><strong>
                                                                        <fmt:formatNumber
                                                                            value="${storeOrderList[0].orderPrice}"
                                                                            pattern="#,###" />
                                                                    </strong>원</dd>
                                                            </dl>
                                                        </div>
                                                        <div>
                                                            <dl>


                                                                <i class="fa-solid fa-minus minus-icon"></i>
                                                                <dt>할인금액</dt>
                                                                <dd><strong>0</strong>원</dd>
                                                            </dl>
                                                        </div>
                                                        <div>
                                                            <dl>
                                                                <i class="fa-solid fa-equals equals-icon"></i>
                                                                <dt>총 결제 금액</dt>
                                                                <dd><strong>
                                                                        <fmt:formatNumber
                                                                            value="${storeOrderList[0].orderPrice}"
                                                                            pattern="#,###" />
                                                                    </strong>원</dd>
                                                            </dl>
                                                            <div>
                                                                <dl>
                                                                    <dt>결제방법</dt>

                                                                    <dd>카카오페이 </dd>

                                                                </dl>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div>
                                                <!-- <ul class="list_txt sml">
                                 <li><strong>온라인 예매 내역 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.</strong></li>
                                 <li><strong>상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</strong></li>
                                 <li><strong>무대인사, 스페셜상영회, GV, 라이브뷰잉 등 특별 상영 회차의 예매 취소는 상영전일 23시 59분 59초까지만 취소
                                         가능합니다.</strong></li>
 
                                 <li>예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.</li>
                                 <li>개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매번호를 확인해 주세요.</li>
                                 <li>스토어에서 구매한 상품은 마이페이지 &gt; 예매/구매 내역에서 확인 및 사용할 수 있습니다.</li>
                             </ul> -->




                                                <a>
                                                    <button class="delBtn">결제내역</button>
                                                </a>

                                                <a href="${contextPath}/store/storeMain">
                                                    <button>스토어 바로가기</button>
                                                </a>

                                                <a href="${contextPath}">
                                                    <button>홈으로 바로가기</button>
                                                </a>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </main>
                        </div>

                        <!-- footer -->
                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


                        <script src="${contextPath}/resources/js/store/store_Success.js"></script>
                        <script src="${contextPath}/resources/js/manager/apikey.js"></script>
                    </body>

                    </html>