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
                        <title>결제완료 페이지</title>

                        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/pay/pay_finshed.css">


                        <!-- fontawesome -->
                        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
                            integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

                        <!-- jQuery 라이브러리 추가(CDN) -->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                        <!-- jQuery -->
                        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
                                                <span>예매 결제 완료</span>
                                                <div>
                                                    <input type="hidden" id="userNo" value="${loginUser.userNo}">
                                                    <input type="hidden" id="bookNo" value="${Session.bookNo}">
                                                </div>
                                            </div>


                                            <!-- 티켓 영역 -->
                                            <div class="discount_step">

                                                <!-- 예매한 영화 이미지 -->
                                                <img class="ticketImg" src="${finalMap.userPlay.movie.movieImg1}">



                                                <!-- 티켓인포 -->
                                                <div class="ticketInfo">

                                                    <!-- ticketInfo 의 첫번째영역 -->
                                                    <div class="ticketInfo_1">

                                                        <!-- 상영날짜 -->
                                                        <div id="movie_detail">
                                                            <div id="play_date">
                                                                <span id="up_year"></span>
                                                                <span id="up_month"></span>
                                                                <span id="up_date"></span>
                                                                <span id="up_day"></span>
                                                            </div>
                                                            <div id="play_time">
                                                                <span id="start_hour"></span>
                                                                <span id="start_minute"></span>
                                                                <span id="end_hour"></span>
                                                                <span id="end_minute"></span>
                                                            </div>
                                                        </div>



                                                        <div>
                                                            <!-- 관람제한 나이 -->
                                                            <div class="age">
                                                                <c:choose>
                                                                    <c:when test="${fn:contains(finalMap.userPlay.movie.mgNo, '전체')}">
                                                                        <div class="age00">All</div>
                                                                    </c:when>
                                                                    <c:when test="${fn:contains(finalMap.userPlay.movie.mgNo, '12')}">
                                                                        <div class="age12">12</div>
                                                                    </c:when>
                                                                    <c:when test="${fn:contains(finalMap.userPlay.movie.mgNo, '15')}">
                                                                        <div class="age15">15</div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="age18">18</div>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <div class="movieTitle">
                                                                    <span>${finalMap.userPlay.movie.movieTitle}&nbsp;|</span>
                                                                    <div>
                                                                        ${finalMap.userPlay.screen.cinemaName}
                                                                        ${finalMap.userPlay.screen.screenName}관
                                                                        (${finalMap.userPlay.screen.screenStyle})

                                                                    </div>
                                                                    <div>
                                                                        <c:set var="seats" value="${finalMap.bookAll.bookSeat}" />
                                                                        <c:set var="seats" value="${fn:replace(seats, '[', '')}" />
                                                                        <c:set var="seats" value="${fn:replace(seats, ']', '')}" />
                                                                        <c:set var="seats" value="${fn:replace(seats, '\"', '')}" />
                                                                        &nbsp;${seats}
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <!-- 영화제목 -->


                                                            <div>

                                                            </div>
                                                            <!-- 지역,관,스크린 -->


                                                        </div>
                                                    </div>


                                                    <!-- ticketInfo의두번째영역 예매코드번호 -->
                                                    <div class="ticketInfo_2">

                                                        <div class="codeArea">
                                                            <div class="box1">
                                                                <span id="codeNumber">예매하신 코드번호 :</span>
                                                                <div class="codeNo">
                                                                    <span>${finalMap.payOrder}</span>
                                                                </div>
                                                            </div>
                                                            <span class="box2">※예매번호코드를 클릭하여 복사하세요.</span>
                                                        </div>
                                                    </div>

                                                </div>


                                            </div>

                                            <!-- 결제 api 전 단계 영역-->
                                            <div class="pay_step">

                                            </div>

                                            <!-- 바텀 영역 -->
                                            <div>
                                                <div class="bottom_area">
                                                    <a href="${contextPath}">
                                                        <span class="goMain">메인으로 가기</span>
                                                    </a>
                                                </div>
                                            </div>



                                        </div>
                                    </div>


                                </section>



                            </main>

                        </div>

                        <!-- footer -->
                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

                        <script src="${contextPath}/resources/js/pay/pay_finshed.js"></script>

                    </body>

                    </html>