<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>

                    <!DOCTYPE html>
                    <html lang="ko">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>극장 가격 수정</title>

                        <link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_inner_Header.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/manager/reset.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_nav.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_cinema_price.css">

                        <!-- fontawesome -->
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
                            integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
                            crossorigin="anonymous" referrerpolicy="no-referrer" />

                        <!-- jQuery 라이브러리 추가(CDN) -->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
                    </head>

                    <body>
                        <main>

                            <div class="main_Wrapper">
                                <div id="left_Nav_Container">
                                    <jsp:include page="/WEB-INF/views/manager/manager_nav.jsp" />
                                </div>

                                <div class="right_items_Container">
                                    <jsp:include page="/WEB-INF/views/manager/manager_inner_Header.jsp" />

                                    <div id="items_Wrapper">
                                        <div class="set_Edge">
                                            <div class="table_Wrapper">

                                                <div class="table_Title">
                                                    <span>극장 가격 수정</span>
                                                </div>
                                                <input type="hidden" class="priceNo" value="${editPrice['PRICE_NO']}" />
                                                <div class="table_main">

                                                    <div id="play_cinema">
                                                        <span>상영관 종류</span>
                                                        <div class="relative">
                                                            <select class="play_cinema_enter" disabled>
                                                                <option disabled>선택안함</option>
                                                                <option ${editPrice['SCREEN_STYLE']=='일반관' ? 'selected'
                                                                    : '' }>일반관</option>
                                                                <option ${editPrice['SCREEN_STYLE']=='KMAX' ? 'selected'
                                                                    : '' }>KMAX</option>
                                                                <option ${editPrice['SCREEN_STYLE']=='DOLBY'
                                                                    ? 'selected' : '' }>DOLBY</option>
                                                                <option ${editPrice['SCREEN_STYLE']=='CHEF &amp; CINE'
                                                                    ? 'selected' : '' }>CHEF & CINE</option>
                                                                <option ${editPrice['SCREEN_STYLE']=='PUPPY &amp; ME'
                                                                    ? 'selected' : '' }>PUPPY & ME</option>
                                                                <option ${editPrice['SCREEN_STYLE']=='YES KIDS'
                                                                    ? 'selected' : '' }>YES KIDS</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div id="play_movie">
                                                        <span>주중 / 주말</span>
                                                        <div class="relative">
                                                            <select class="play_movie_enter" disabled>
                                                                <option disabled>선택안함</option>
                                                                <option ${editPrice['PRICE_DAY']=='평일' ? 'selected' : ''
                                                                    }>평일</option>
                                                                <option ${editPrice['PRICE_DAY']=='주말' ? 'selected' : ''
                                                                    }>주말</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div id="play_time">
                                                        <span>오전 / 오후</span>
                                                        <div class="relative">
                                                            <select class="play_time_enter" disabled>
                                                                <option disabled>선택안함</option>
                                                                <option ${editPrice['PRICE_TIME']=='오전' ? 'selected'
                                                                    : '' }>오전</option>
                                                                <option ${editPrice['PRICE_TIME']=='오후' ? 'selected'
                                                                    : '' }>오후</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div id="play_time">
                                                        <span>청소년</span>
                                                        <div class="relative">
                                                            <div>
                                                                <input type="text" placeholder="가격을 입력하세요." id="teen"
                                                                    value="${editPrice['PRICE_TEEN']}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="play_time">
                                                        <span>일반</span>
                                                        <div class="relative">
                                                            <div>
                                                                <input type="text" placeholder="가격을 입력하세요." id="normal"
                                                                    value="${editPrice['PRICE_NORMAL']}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="play_time">
                                                        <span>경로</span>
                                                        <div class="relative">
                                                            <div>
                                                                <input type="text" placeholder="가격을 입력하세요." id="elder"
                                                                    value="${editPrice['PRICE_ELDER']}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="play_time">
                                                        <span>우대</span>
                                                        <div class="relative">
                                                            <div>
                                                                <input type="text" placeholder="가격을 입력하세요." id="special"
                                                                    value="${editPrice['PRICE_SPECIAL']}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="play_time">
                                                        <span>커플</span>
                                                        <div class="relative">
                                                            <div>
                                                                <input type="text" placeholder="가격을 입력하세요." id="couple"
                                                                    value="${editPrice['PRICE_COUPLE']}">
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="table_bottom">
                                                    <button class="bottom_Submit">저장</button>
                                                    <button class="bottom_Cancel">취소</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </main>

                        <script src="${contextPath}/resources/js/manager/manager_cinemaPrice_list_edit.js"></script>
                        <script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
                        <script src="${contextPath}/resources/js/manager/manager_nav.js"></script>

                    </body>

                    </html>