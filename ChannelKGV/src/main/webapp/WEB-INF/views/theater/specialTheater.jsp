<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>특별관</title>
            <link rel="stylesheet" href="${contextPath}/resources/css/theater/specialTheater.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
            <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        </head>

        <body>
            <div id="wrap">

                <jsp:include page="/WEB-INF/views/common/header.jsp" />

                <main>
                    <!-- 여기서 부터 작업하세요. -->

                    <div class="special_wrap">
                        <div>
                            <p>Special</p>
                            <p>Place For U</p>
                        </div>
                        <div class="special">
                            <div class="theater1"><img src="${contextPath}/resources/images/teater_special/imax_04.jpg" alt="">
                                <a href="${contextPath}/theater/specialTheater/1">
                                    <div class="theater1-1">
                                        <span>KMAX</span><br>
                                        <p class="infoSpan">궁극의 몰입감</p>

                                    </div>
                                </a>
                            </div>
                            <div class="second-wrap">
                                <div class="theater2"><img src="${contextPath}/resources/images/teater_special/specialtheater_cdc_00.jpg" alt="">
                                    <a href="${contextPath}/theater/specialTheater/5">
                                        <div class="theater2-1">
                                            <span>Cine & Wine</span><br>
                                            <p class="infoSpan">쉐프가 있는 영화관</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="theater3"> <img src="${contextPath}/resources/images/teater_special/style_625d608c1cb71.jpg" alt="">
                                    <a href="${contextPath}/theater/specialTheater/3">
                                        <div class="theater3-1">
                                            <span>With a Puppy</span><br>
                                            <p class="infoSpan">반려동물 동반 멀티플렉스</p>

                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div>
                                <div class="theater4"><img src="${contextPath}/resources/images/teater_special/Featured-1068x580-1-2.png" alt="">
                                    <a href="${contextPath}/theater/specialTheater/4">
                                        <div class="theater4-1"><span>CINE KIDS</span><br>
                                            <p class="infoSpan">키즈 전용 상영관</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="theater5"> <img src="${contextPath}/resources/images/teater_special/B.jpg" alt="">
                                    <a href="${contextPath}/theater/specialTheater/2">
                                        <div class="theater5-1"><span>DOLBY ATMOS</span><br>
                                            <p class="infoSpan">차세대 몰입형 사운드</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- 여기까지 작업하세요. -->
            </main>

            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />


            <script src="${contextPath}/resources/js/theater/special.js"></script>

        </body>

        </html>