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
            <title>예매선택 페이지</title>
            <link rel="stylesheet" href="${contextPath}/resources/css/reserve/choicePlay.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
            <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script src="${contextPath}/resources/js/reserve/choicePlay.js" defer></script>

          </head>

          <body>
            <div id="wrap">
              <jsp:include page="/WEB-INF/views/common/header.jsp" />

              <!-- 예매 페이지  -->

              <!-- 예매 페이지  -->

              <main>
                <section>

                  <div>
                    <div>
                      <p id="cinema_select">극장 선택</p>
                    </div>
                    <div>
                      <div><a href="#none" id="cinema_option1" class="clicked">전체 극장</a></div>
                      <div><a href="#none" id="cinema_option2">특별관</a></div>
                    </div>
                    <div>
                      <div>
                          <ul id="area_list">
                              <li><a href="#none" class="clicked">서울</a></li>
                              <li><a href="#none">인천 경기</a></li>
                              <li><a href="#none">대전 충남 충북</a></li>
                              <li><a href="#none">광주 전남 전북</a></li>
                              <li><a href="#none">부산 울산 경남</a></li>
                              <li><a href="#none">대구 경북</a></li>
                              <li><a href="#none">강원</a></li>
                              <li><a href="#none">제주</a></li>
                          </ul>
                          <ul id="special_list" style="display: none">
                              <li><a href="#none">KMAX</a></li>
                              <li><a href="#none">DOLBY</a></li>
                              <li><a href="#none">CHEF & CINE</a></li>
                              <li><a href="#none">PUPPY & ME</a></li>
                              <li><a href="#none">YES KIDS</a></li>
                          </ul>
                      </div>
                      <div>
                          <ul id="cinema_list">
                            <c:forEach var="cinema" items="${reserveMap['cinemaList']}">
                              <li><a href="#none">${cinema['cinemaName']}</a></li>
                            </c:forEach>
                          </ul>
                          <ul id="special_cinema_list" style="display: none">
                          </ul>
                        
                      </div>

                    </div>
                  </div>
                  <div>
                    <div>
                      <p id="movie_select">영화 선택</p>
                    </div>
                    <div>
                      <div><a href="#none" id="movie_option1">영화명 순</a></div>
                      <div><a href="#none" id="movie_option2" class="clicked">예매율 순</a></div>
                    </div>
                    <div>
                      <ul class="movielist" id="movielist_text">
                        <c:forEach var="movie" items="${reserveMap['movieList']}">
                          <li><a href="#none">
                              <c:choose>
                                <c:when test="${fn:contains(movie['mgNo'], '전체')}">
                                  <div class="age00">All</div>
                                </c:when>
                                <c:when test="${fn:contains(movie['mgNo'], '12')}">
                                  <div class="age12">12</div>
                                </c:when>
                                <c:when test="${fn:contains(movie['mgNo'], '15')}">
                                  <div class="age15">15</div>
                                </c:when>
                                <c:otherwise>
                                  <div class="age18">18</div>
                                </c:otherwise>
                              </c:choose>
                              <div><span class="movie_name">${movie['movieTitle']}</span></div>

                            </a></li>
                        </c:forEach>
                      </ul>

                      <ul class="movielist" id="movielist_thumb">
                        <c:forEach var="movie" items="${reserveMap['thumbList']}" varStatus="status">
                          <li><a href="#none">
                              <div>
                                <img src="${movie['movieImg1']}" />
                                <span>${status.count}</span>
                              </div>
                              <div>
                                <div>
                                  <c:choose>
                                    <c:when test="${fn:contains(movie['mgNo'], '전체')}">
                                      <div class="age00">All</div>
                                    </c:when>
                                    <c:when test="${fn:contains(movie['mgNo'], '12')}">
                                      <div class="age12">12</div>
                                    </c:when>
                                    <c:when test="${fn:contains(movie['mgNo'], '15')}">
                                      <div class="age15">15</div>
                                    </c:when>
                                    <c:otherwise>
                                      <div class="age18">18</div>
                                    </c:otherwise>
                                  </c:choose>
                                  <div><span class="movie_name">${movie['movieTitle']}</span></div>
                                </div>
                                <div>
                                  <div>
                                    <div>예매율 : <strong><span class="reserve_rate">0.0</span>%</strong></div>
                                    <div><i class="fa solid fa-star"></i><strong><span class="review_score">0.0</span></strong></div>
                                  </div>
                                  <div>개봉일 : <span>${movie['movieOpen']}</span></div>
                                </div>
                              </div>
                            </a></li>
                        </c:forEach>
                      </ul>



                    </div>
                  </div>
                  <div>
                    <div>
                      <p id="play_select">상영 선택</p>
                    </div>
                    <div>
                      <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                          <c:forEach var="i" begin="1" end="15">
                            <div class="swiper-slide">
                              <div class="month"></div>
                              <button class="date"></button>
                              <div class="day"></div>
                            </div>
                          </c:forEach>
                        </div>

                      </div>
                      <div class="swiper-button-prev"></div>
                      <div class="swiper-button-next"></div>

                    </div>

                    <div>
                      <ul id="total_play">
                        <li class="movie_play">
                          <div>영화</div>
                          <div>
                            <ul class="playlist">
                              <li id="origin_play"><a href="#result_section">
                                  <div>
                                    <div>
                                      <strong>
                                        <span class="open_hour"></span>&nbsp;:&nbsp;<span class="open_minute"></span>
                                      </strong>
                                    </div>
                                    <div>
                                      <div>
                                        <span class="empty_seat"></span>&nbsp;/&nbsp;<span class="entire_seat"></span>
                                      </div>
                                      <div>
                                        <span class="cinema_room"></span><span>관</span>
                                      </div>
                                    </div>
                                  </div>
                                  <div>
                                    종료&nbsp;<span></span>&nbsp;:&nbsp;<span></span>
                                  </div>
                                </a></li>
                            </ul>
                          </div>
                        </li>

                      </ul>

                    </div>
                  </div>
                </section>
                <section id="result_section">
                  <div>
                    <div id="movie_thumb">
                      <img />
                    </div>
                    <div id="movie_detail">
                      <div>
                        <div id="movie_grade"></div>
                        <div><span id="movie_name"></span></div>
                      </div>
                      <div id="play_date"><span id="up_year"></span> <span id="up_month"></span>
                        <span id="up_date"></span> <span id="up_day"></span>
                      </div>
                      <div id="play_time"><span id="start_hour"></span> <span id="start_minute"></span>
                        <span id="end_hour"></span> <span id="end_minute"></span>
                      </div>
                    </div>
                  </div>
                  <div>
                    <div>
                      <span id="play_cinema"></span> <span id="play_screen"></span>
                      <span id="play_style"></span>
                    </div>

                  </div>

                  <div><a href="#none" id="choiceTicket">좌석 선택</a></div>

                </section>
              </main>

            </div>

            <jsp:include page="/WEB-INF/views/common/footer.jsp" />




          </body>


          </html>