<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>DISH & WINE</title>

            <link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterS5.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">

            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        </head>


        <body>
            <div id="wrap">



                <jsp:include page="/WEB-INF/views/common/header.jsp" />


                <main>
                    <div>
                        <!-- 백그라운드이미지로 처리 -->
						<div  class="topBg_imgarea">
                            <ul>
								<li> <a href="${contextPath}/theater/specialTheater/1"> KMAX</a> </li>
								<li><a href="${contextPath}/theater/specialTheater/2">DOLBY</a></li>
								<li><a href="${contextPath}/theater/specialTheater/5">DISH &
										WINE</a></li>
								<li> <a href="${contextPath}/theater/specialTheater/3">WITH A
										PUPPY</a></li>
								<li> <a href="${contextPath}/theater/specialTheater/4">KIDS</a></li>
							</ul>
                            
                            <div class="spanCLS">
                                <p>For Your Very</p>
                                <p> Special Moment</p>
                            </div>
                        </div>
                    </div>

                    <!-- 두번째 영역 -->
                    <div>
                        <div>
                            <div class="left_stheaterwrap">
                        
                            </div>
                        </div>
                    </div>


                    <!-- 3-->
                    <div>
                        <div class="left_stheaterwrap">
                            <span>Dish & Wine
                            </span>
                            <span>잠실
                            </span>
                        </div>
                        <div>
                            <div class="theater-explain">
                                <p>서로 다른 컨셉의 프리미엄 상영관과 밝고 부드러운 인테리어로 구성된 70여석의 레스토랑</p>
                                <p>원하는 고객들을 위한 4개의 전용 공간으로 구성되어 있습니다.</p>
                            </div>
                            <div class="jamsil-wrap">
                                <img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_00.jpg" alt="">
                                <img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_01.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- 5 -->

                    <div>
                        <div class="left_stheaterwrap">
                            <span>Dish & Wine
                            </span>
                            <span>용산
                            </span>
                        </div>
                        <div>
                            <div class="theater-explain">
                                <p>수준급 쉐프의 크리에이티브가 돋보이는 '모던 유러피안 올데이 다이닝' 레스토랑 및 미국 3대 스페셜티 커피</p>
                                <p>'인텔리젠시아'를 즐길 수 있는 카페를 통해 당신에게 특별한 순간을 선사합니다.</p>
                            </div>
                            <div class="yonsan-wrap">
                                <img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_10.jpg" alt="">
                                <img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_11.jpg" alt="">
                            </div>
                        </div>
                    </div>


                    <div>
                        <div class="left_stheaterwrap">
                            <span>Dish & Wine
                            </span>
                            <span>해운대
                            </span>
                        </div>
                        <div>
                            <div class="theater-explain">
                                <p>200석 규모의 탁 트인 공간에 미니멀하고 심플하면서도 품격있는 인테리어가 돋보이는 레스토랑, 그리고 2개의</p>
                                <p>상영관과 독립된 다이닝 룸으로 구성되어 있습니다.</p>
                            </div>
                            <div class="heaun-wrap">
                                <img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_20.jpg">
                                <img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_21.jpg">
                            </div>
                        </div>
                    </div>

                    <!-- 7-- -->
                    <div>
                        <div>
                            <p>DISH & WINE 상영관</p>

                            <div class="stheater_wrap">
                                <ul>
                                    <li>
                                        <div><img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_apgujeong.png" alt="">
                                        </div>
                                        <div class="cine-wine-infowrap">
                                            <a>DISH & WINE <span>잠실</span></a>
                                            <p>French & Italian Cuisine</p>
                                            <div><strong>상층</strong><span>4개의 PrivateRoom </span></div>
                                            <div><strong>하층</strong><span>50석 규모의 메인 홀</span></div>
                                            <div><strong>위치</strong>
                                                <p>서울시 잠실 30길 45
                                                </p>
                                            </div>
                                            <div><strong>문의 및 예약</strong>
                                                <p>02-3446-0541~2<br>(AM 10:00 ~ PM 09:00)

                                                </p>
                                            </div>
                                            <div><strong>주차</strong>
                                                <p>영화 또는 식사 이용 시 3시간 무료<br>영화와 식사 함께 이용 시 5시간 무료
                                                    <br>(단, 발렛서비스비 별도)
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div><img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_yongsan.png" alt="">
                                        </div>
                                        <div class="cine-wine-infowrap">
                                            <a>DISH & WINE <span>용산</span></a>
                                            <p>French & Italian Cuisine</p>
                                            <div><strong>HALL</strong><span>140석 규모의 메인 홀
                                                </span></div>
                                            <div><strong>ROOM</strong><span>
                                                    각 10석 2개의 PrivateRoom</span></div>
                                            <div><strong>위치</strong>
                                                <p>서울시 용산구 한강대로 23길 55,<br>아이파크몰 6층


                                                </p>
                                            </div>
                                            <div><strong>문의 및 예약</strong>
                                                <p>02-2012-3793~4
                                                    <br>(주중: AM 10:30 ~ PM 09:00<br>주말: AM 10:00 ~ PM 09:00)
                                                </p>
                                            </div>
                                            <div><strong>주차</strong>
                                                <p>영화 이용 시 3시간 무료
                                                    <br>식사 이용 시 2시간 무료
                                                    <br>영화와 식사 함께 이용 시 5시간 무료
                                                    <br>(달 주차장 4F, 5F 이용)

                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div><img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_centum.png" alt="">
                                        </div>
                                        <div class="cine-wine-infowrap">
                                            <a>DISH & WINE <span>해운대</span></a>
                                            <p>French & Italian Cuisine</p>
                                            <div><strong>HALL</strong><span>74석 규모의 메인 홀</span></div>
                                            <div><strong>ROOM</strong><span>각 12석 5개의 PrivateRoom</span></div>
                                            <div><strong>위치</strong>
                                                <p>부산시 해운대구 센텀남대로 35
                                                    <br>(우동, 신세계백화점 5F)
                                                </p>
                                            </div>
                                            <div><strong>문의 및 예약</strong>
                                                <p>051-745-2880~1

                                                    <br>(AM 11:00 ~ PM 09:00)
                                                    <br>PM 08:00 라스트오더

                                                </p>
                                            </div>
                                            <div><strong>주차</strong>
                                                <p>티켓 또는 영수증 소지 후,

                                                    <br>신세계백화점 주차장 입구

                                                    <br>무인 주차 정산기를 통한 사전 정산 진행

                                                    <br>영화 또는 식사 이용 시 3시간 무료
                                                    <br>영화와 식사 함께 이용 시 6시간 무료


                                                </p>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>

                        </div>
                    </div>
                    <!-- 8 -->


                </main>

            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />

            <script src="${contextPath}/resources/js/theater/special-detail.js"></script>
        </body>

        </html>