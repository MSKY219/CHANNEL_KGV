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
                        <title>내가 쓴 리뷰</title>

                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
                        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>

                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_aSide.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_myReview.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_randomEvent.css">

                    </head>

                    <body>
                        <div id="wrap">

                            <!-- header -->
                            <jsp:include page="/WEB-INF/views/common/header.jsp" />

                            <main class="mainArea">
                                <section>
                                    <div class="asideAconatiner">

                                        <!-- aSide -->
                                        <jsp:include page="/WEB-INF/views/myPage/myPage_aSide.jsp" />

                                        <div class="container">
                                            <div>
                                                <!-- 요기에 이제 필요 폼들 추가해야함 -->
                                                <div class="main-content-wrap">
                                                    <h2>내가 쓴 리뷰</h2>

                                                </div>
                                                <!-- 내가 본 영화, 내가 쓴 리뷰 페이지 form이 필요 없을듯? -->
                                                <ul class="more-load">
                                                    <c:forEach var="review" items="${myReviewList}">
                                                        <!-- review_no사용하면됨 -->
                                                        <!-- 나중에 append나 폼 추가 할 때 이 li을 그대로 가져가면 됨 -->
                                                        <li class="myreview">
                                                            <div>
                                                                <div>
                                                                    <!-- 나중에 db건들 때 따오는 값 바꿔줘야함 -->
                                                                    <a
                                                                        href="${contextPath}/movieList/detail_List/introduce/${review.movie.movieNo}"><img
                                                                            src="${review.movie.movieImg1}"
                                                                            alt="영화 포스터 w=186px,h=208px"></a>
                                                                </div>

                                                                <div>
                                                                    <div>
                                                                        <div>${review.movie.movieTitle}</div>
                                                                        <a class="delete-review-btn"
                                                                            data-revno="${review.review.revNo}">
                                                                            <i
                                                                                class="fa-regular fa-circle-xmark"></i></a>
                                                                    </div>
                                                                    <div>
                                                                        <ul>
                                                                            <!-- db에 들어가는거 보고 영화 날짜, 시간, 인원, 몇관 등 추가 해야함 -->
                                                                            <li>작성 날짜 :</li>
                                                                            <li>작성 시간 :</li>
                                                                        </ul>
                                                                        <ul>
                                                                            <!-- db에 들어가는거 보고 영화 날짜, 시간, 인원, 몇관 등 추가 해야함 -->
                                                                            <li>${review.review.revDate}</li>
                                                                            <li>${review.review.revTime}</li>
                                                                        </ul>

                                                                    </div>
                                                                    <div>
                                                                        <textarea>${review.review.revContent}</textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                                <!-- 더보기 버튼 만들 영역 -->
                                                <button id="list-more-btn">내 리뷰 더 보기</button>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </main>

                        </div>

                        <!-- event-wrap -->
                        <jsp:include page="/WEB-INF/views/myPage/myPage_randomEvent.jsp" />

                        <!-- footer -->
                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


                        <script src="${contextPath}/resources/js/common/header.js"></script>
                        <script src="${contextPath}/resources/js/myPage/myPage_myReview.js"></script>
                        <script src="${contextPath}/resources/js/myPage/myPage_swiper.js"></script>
                        <script src="${contextPath}/resources/js/myPage/myPage_randomEvent.js"></script>
                    </body>

                    </html>