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
    <title>내가 본 영화</title>

    <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_aSide.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_myMovie.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_randomEvent.css">

</head>

<body>
    <div id="wrap">

        <!-- header -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <main>
            <section>
                <div class="asideAconatiner">

                    <!-- aSide -->
                    <jsp:include page="/WEB-INF/views/myPage/myPage_aSide.jsp" />

                    <div class="container">
                        <div>
                            <!-- 요기에 이제 필요 폼들 추가해야함 -->
                            <div class="main-content-wrap">
                                <h2>내가 본 영화</h2>

                            </div>
                            <!-- 내가 본 영화, 내가 쓴 리뷰 페이지 form이 필요 없을듯? -->
                            <ul class="more-load">
                                <c:forEach var="book" items="${myBookList}">
                                    <!-- 나중에 append나 폼 추가 할 때 이 li을 그대로 가져가면 됨 -->
                                    <li class="mymovie">

                                        <div>
                                            <div>
                                                <!-- 나중에 db건들 때 따오는 값 바꿔줘야함 -->
                                                <a href="${contextPath}/movieList/detail_List/introduce/${book.movie.movieNo}"><img src="${book.movie.movieImg1}"
                                                        alt="영화 포스터 w=186px,h=208px"></a>
                                            </div>

                                            <div>
                                                <div>
                                                    <div>${book.movie.movieTitle}</div>
                                                    <a href="delete-movie-btn"
                                                        data-bookno="book.book.bookNo">
                                                        <i class="fa-regular fa-circle-xmark"></i></a>
                                                </div>

                                                <div>
                                                    <ul>
                                                        <!-- db에 들어가는거 보고 영화 날짜, 시간, 인원, 몇관 등 추가 해야함 -->
                                                        <li>관람 날짜 :</li>
                                                        <li>관람 시간 :</li>
                                                        <li>관람 인원 :</li>
                                                        <li>상영관 :</li>
                                                    </ul>
                                                    <ul>
                                                        <!-- db에 들어가는거 보고 영화 날짜, 시간, 인원, 몇관 등 추가 해야함 -->
                                                        <li>${book.review.bookDate}</li>
                                                        <li>${book.review.revTime}</li>
                                                        <li>1123</li>
                                                        <li>A 강의실</li>
                                                    </ul>
                                                </div>
                                                <div>
                                                    <button id="goreview-btn" data-bookno="${cardData.book.bookNo}">리뷰 남기러 가볼까옹~</button>
                                                </div>

                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            <!-- 더보기 버튼 만들 영역 -->
                            <button id="list-more-btn">내 영화 더 보기</button>
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
    <script src="${contextPath}/resources/js/myPage/myPage_myMovie.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_swiper.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_randomEvent.js"></script>
</body>

</html>