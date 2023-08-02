<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>KIDS</title>

            <link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterS4.css">
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
                                <p>Cultureplex for Kids </p>
                                <p>& Families</p>
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
                            <img src="${contextPath}/resources/images/teater_special/specialtheater_cinekids_0.jpg" alt="">

                        </div>
                    </div>
                    <!-- 5 -->

                    <div>
                        <div>
                            <div><img src="${contextPath}/resources/images/teater_special/specialtheater_cinekids_10.jpg">
                                <div class="explain">
                                </div>
                            </div>
                            <div><img src="${contextPath}/resources/images/teater_special/specialtheater_cinekids_11.jpg">
                                <div class="explain">
                                </div>
                            </div>

                        </div>
                    </div>




                    <!-- 6 -->
                    <div>
                        <div class="left_stheaterwrap">
                            <span style="padding:10px 0;">드라이빙 존
                            </span>
                            <span style="font-size: 1rem;">아이들이 직접 운전해 볼 수 있는 다양한 종류의 어린이 전동차와 드라이빙 트랙이 구비되어 있습니다.<br>CINE KIDS 자동차석 관람 어린이 대상 10분간 드라이빙 체험을 무료로 제공합니다.
                            </span>
                        </div>

                        <div>
                            <img src="${contextPath}/resources/images/teater_special/specialtheater_cinekids_20.jpg" alt="">
                            <img src="${contextPath}/resources/images/teater_special/specialtheater_cinekids_21.jpg" alt="">
                        </div>

                    </div>





                    <!-- 7-- -->
                    <div>
                        <div>
                            <p>KIDS 상영관</p>

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
                            <p>아이와 함께하는 추천영화</p>
                            <div class="top3-wrap">
                                <c:forEach var="ranMovie" items="${randomMovie}">
									<div>
										<a href="${contextPath}/movieList/detail_List/introduce/${ranMovie.movieNo}"><img src="${ranMovie.movieImg1}"></a>
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