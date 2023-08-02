<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>WITH A PUPPY</title>

            <link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterS3.css">
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
                                <p>세계 두번째</p>
                                <p>반려동물 동반 멀티플렉스</p>
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


                    <!-- 4 -->
                    <div>
                        <div>
                            <img src="${contextPath}/resources/images/teater_special/img-theater-puppy-view01.png" alt="">
                            <p>나의 인생 영화<br>
                                너의 견생 영화</p>
                        </div>
                    </div>
                    <!-- 5 -->

                    <div>
                        <div>
                            <div><img src="${contextPath}/resources/images/teater_special/bg-boarding.png">
                                <div class="explain">
                                    <p>BOARDING</p>
                                </div>
                            </div>
                            <div><img src="${contextPath}/resources/images/teater_special/bg-bath.png">
                                <div class="explain">
                                    <p>BATH</p>
                                </div>
                            </div>
                            <div><img src="${contextPath}/resources/images/teater_special/bg-salon.png">
                                <div class="explain">
                                    <p>SALON</p>
                                </div>
                            </div>
                            <div><img src="${contextPath}/resources/images/teater_special/bg-restaurant.png">
                                <div class="explain">
                                    <p>RESTAURANT</p>
                                </div>
                            </div>
                        </div>
                    </div>




                    <!-- 6 -->
                    <div>
                        <div>
                            <img src="${contextPath}/resources/images/teater_special/img-theater-puppy-view02.png" alt="">
                        </div>
                        <ul class="puppy-ul">
                            <li>Boarding</li>
                            <li>자유롭게, 마음껏 뛰어놀 수 있는 놀이터
                            </li>
                            <li>펫 마스터와 함께 신나는 놀이와 행동 교정 프로그램까지!
                                <br>쇼핑, 영화 등 혼자만의 시간이 필요할 때
                                <br> 강아지도 안전하고 행복한 시간!

                            </li>
                        </ul>
                    </div>
                    <!-- 7 -->
                    <div>
                        <div>
                            <img src="${contextPath}/resources/images/teater_special/img-theater-puppy-view03.png" alt="">
                        </div>
                        <ul class="puppy-ul">
                            <li>Bath</li>
                            <li>나와 네가 모두 편안한 프리미엄 바스
                            </li>
                            <li>20년 경력 케어 전문가의 섬세한 손길로
                                <br>스파, 월풀, 하이드로바스까지
                                <br>향기롭고 윤기가 흐르는, 프리미엄 케어의 끝판왕!
                            </li>
                        </ul>
                    </div>

                    <div>
                        <div>
                            <img src="${contextPath}/resources/images/teater_special/img-theater-puppy-view04.png" alt="">
                        </div>
                        <ul class="puppy-ul">
                            <li>Salon</li>
                            <li>스타일링 맛집, 케어는 멋짐
                            </li>
                            <li>스트레스 없이 편안하게 위생 미용부터 최신 스타일링까지
                                <br>미용 구독 서비스로 매일매일 리즈 시절!
                            </li>
                        </ul>
                    </div>




                    <!-- 7-- -->
                    <div>
                        <div>
                            <p>With a Puppy 상영관</p>

                            <div class="stheater_wrap">
                                <ul>
                                    <c:forEach var="screen" items="${screenInfo}">
										<li><a href="${contextPath}/reserve/choicePlay">${screen.screenStyle} <span class="cinename">${screen.cinemaName}</span></a></li>
                                    </c:forEach>
                                </ul>
                            </div>

                        </div>
                    </div>

                    <!-- 8 -->
                    <div>
                        <div>
                            <!-- TOP3만 올리세요 스와이퍼넣기싫어 귀찮아 제발.. -->
                            <p>반려동물과 함께하는 추천영화</p>
                            <div class="top3-wrap">
                                <c:forEach var="ranMovie" items="${randomMovie}">
									<div>
										<a href="${contextPath}/movieList/detail_List/introduce/${ranMovie.movieNo}"><img src="${ranMovie.movieImg1}" onmouseenter="zoomIn(event)"
											onmouseleave="zoomOut(event)"></a>
										<button><a href="${contextPath}/reserve/choicePlay">예매하기</a></button>
									</div>
								</c:forEach>
                            </div>
                        </div>
                    </div>


                </main>

            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />


            <script src="${contextPath}/resources/js/theater/special-detail.js"></script>
        </body>

        </html>