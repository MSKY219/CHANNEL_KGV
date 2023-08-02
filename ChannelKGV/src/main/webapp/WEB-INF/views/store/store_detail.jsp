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
                        <title>스토어 상세 </title>
                        <link rel="stylesheet" href="${contextPath}/resources/css/store/store_detail.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
                    </head>

                    <body>
                        <div id="wrap">

                            <!-- header -->
                            <jsp:include page="/WEB-INF/views/common/header.jsp" />

                            <main>
                                <div>
                                    <span>스토어</span>
                                    <input type="hidden" id="storeNo" value="${storeDetail.storeNo}">
                                </div>




                                <div>
                                    <div>
                                        <div>

                                            <img src="${storeDetail.storeImageBig}">

                                        </div>

                                    </div>

                                    <div>
                                        <table>

                                            <colgroup>
                                                <col style="width: 30%;">
                                                <col style="width: auto;">
                                            </colgroup>

                                            <tbody>
                                                <tr>
                                                    <th scope="row" colspan="2" class="storeName">
                                                        ${storeDetail.storeName}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>가격</td>
                                                    <td><span class="price" id="price">

                                                            ${storeDetail.storePrice}</span><em>원</em></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">구성품</th>
                                                    <td>
                                                        ${storeDetail.storeDesc}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">구매제한</th>
                                                    <td>제한없음</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">유효기간</th>
                                                    <td>24 개월</td>
                                                </tr>

                                            </tbody>
                                        </table>


                                        <div>
                                            <a href="#none" class="btn_minus">-</a>
                                            <div class="txt_num">1</div>
                                            <a href="#none" class="btn_plus">+</a>
                                        </div>

                                        <div>
                                            총 상품금액<span id="totalPrice"> ${storeDetail.storePrice}</span><em>원</em>
                                        </div>


                                        <div>

                                            <a
                                                href="${contextPath}/store/storeMain/store_detail/store_payment/${storeNo}"><button
                                                    type="submit" class="storeBuy_btn">구매하기</button></a>
                                        </div>
                                    </div>
                                </div>


                                <div>
                                    <div>
                                        <button type="button" class="btn-toggle">사용방법
                                        </button>
                                    </div>
                                    <div class="content" style="display: none;">

                                        KGV 상품은 회원만 구매하실 수 있습니다.<br>- 유효기간은 24개월로 사용일 기준입니다.<br>- 결제가 완료된 상품은 마이페이지
                                        &gt; 예매/구매내역에서 확인 가능합니다.<br>- 매점교환권은 KGV APP [바로팝콘]에서 사용 영화관 및 품목 선택 후, 결제수단에서
                                        '교환권'
                                        선택시
                                        사용가능합니다.<br>- 영화관 스위트샵(매점) 방문 후, 바코드를 제시하는 방법으로도 사용가능합니다.<br>- 선물한 매점교환권은
                                        문자쿠폰(MMS)으로
                                        발송되며, 수신자가
                                        KGV APP에서 비밀번호와 함께 등록하여 사용 가능합니다.<br>- 선물한 상품은 KGV &gt; 예매/구매내역 메뉴에서 30일 내
                                        재발송 1회만
                                        가능하며, 받는
                                        사람 번호는 변경 불가합니다.<br>- 정해진 상품 외 기타 상품 변경은 불가합니다.

                                    </div>
                                </div>

                                <div>
                                    <div>
                                        <button type="button" class="btn-toggle-2">유의사항</button>
                                    </div>
                                    <div class="content-2" style="display: none;">

                                        <h5>취소/환불</h5>
                                        -&nbsp;스토어&nbsp;상품의 취소기한은 구매일로부터 70일 입니다.<br>
                                        - 구매취소는 취소기한 내 마이페이지 &gt; 예매/구매내역에서만 가능합니다.(현장취소 불가)<br>
                                        - 구매하신 상품은 부분환불 및 현금환불이 되지 않습니다.<br>

                                        <h5>기타</h5>


                                        - 이벤트로 판매되는 상품의 구매/사용/취소 규정은 해당 이벤트 페이지를 확인해주세요.<br>- 유효기간 만료일 전 연장
                                        요청 시, 1회에 한하여 3개월 연장 가능합니다.<br>- 고객센터: 1544-8855 유료


                                    </div>
                                </div>



                            </main>
                        </div>


                        <!-- footer -->
                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />



                        <script src="${contextPath}/resources/js/store/store_detail.js"></script>
                    </body>

                    </html>