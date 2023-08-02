<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page session="false" %>
          <!DOCTYPE html>
          <html>

          <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>예매선택 페이지</title>
            <link rel="stylesheet" href="${contextPath}/resources/css/reserve/choiceTicket.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
            <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"
              integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script src="${contextPath}/resources/js/reserve/choiceTicket.js" defer></script>

          </head>

          <body>
            <div id="wrap">
              <jsp:include page="/WEB-INF/views/common/header.jsp" />
              <main>
                <section>

                  <div>
                    인원/좌석 선택
                  </div>
                  <div>
                    <ul>
                      <li>
                        <strong>성인</strong>
                        <div>
                          <a href="#none" class="minus_btn">-</a>
                          <div id="adult_count" class="age_count">0</div>
                          <a href="#none" class="plus_btn">+</a>
                        </div>
                      </li>
                      <li>
                        <strong>청소년</strong>
                        <div>
                          <a href="#none" class="minus_btn">-</a>
                          <div id="youth_count" class="age_count">0</div>
                          <a href="#none" class="plus_btn">+</a>
                        </div>
                      </li>
                      <li>
                        <strong>경로</strong>
                        <div>
                          <a href="#none" class="minus_btn">-</a>
                          <div id="senior_count" class="age_count">0</div>
                          <a href="#none" class="plus_btn">+</a>
                        </div>
                      </li>
                      <li>
                        <strong>우대</strong>
                        <div>
                          <a href="#none" class="minus_btn">-</a>
                          <div id="special_count" class="age_count">0</div>
                          <a href="#none" class="plus_btn">+</a>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <div>
                    <div>
                      <div id="screen_area">screen</div>

                      <div id="seat_area">
                        <c:forEach var="i" begin="1" end="${userPlay.screen.screenRow}">
                          <div>
                            <div></div>
                            <c:forEach var="i" begin="1" end="${userPlay.screen.screenCol}">
                              <a href="#none" class="seat"></a>
                            </c:forEach>
                          </div>
                        </c:forEach>
                      </div>
                    </div>
                    <div>
                      <div>
                        <div style="background-color: #FF243E"></div>
                        <span>선택좌석</span>
                      </div>
                      <!-- 
                      <div>
                        <div style="background-color:  #ccc; color: #666">X</div>
                        <span>선택불가</span>
                      </div>
                      -->
                      <div>
                        <div style="background-color: #888"></div>
                        <span>예매완료</span>
                      </div>
                      
                      <!--  
                      <div>
                        <div style="background-color: hotpink"></div>
                        <span>스위트석</span>
                      </div>
                      <div>
                        <div style="background-color: green"></div>
                        <span>장애인석</span>
                      </div>
                      -->
                    </div>
                  </div>
                  <div>
                    <div>

                      <div id="movie_thumb">
                        <img src="${userPlay.movie.movieImg1}" />
                      </div>
                      <div id="movie_detail">

                        <div>
                          <c:choose>
                            <c:when test="${fn:contains(userPlay.movie.mgNo, '전체')}">
                              <div class="age00">All</div>
                            </c:when>
                            <c:when test="${fn:contains(userPlay.movie.mgNo, '12')}">
                              <div class="age12">12</div>
                            </c:when>
                            <c:when test="${fn:contains(userPlay.movie.mgNo, '15')}">
                              <div class="age15">15</div>
                            </c:when>
                            <c:otherwise>
                              <div class="age18">18</div>
                            </c:otherwise>
                          </c:choose>

                          <div><span id="movie_name">${userPlay.movie.movieTitle}</span></div>


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
                      <div>${userPlay.screen.cinemaName} ${userPlay.screen.screenName}관 (${userPlay.screen.screenStyle})
                      </div>
                      <div id="seat_code">
                        <div></div>
                        <div></div>
                      </div>
                    </div>
                    <div id="price_calc">
                      <div>
                        성인
                        <div>
                          <span class="age_price" id="adult_price"></span>원 &times; <span class="age_pick"
                            id="adult_pick"></span>
                        </div>
                      </div>
                      <div>
                        청소년
                        <div>
                          <span class="age_price" id="youth_price"></span>원 &times; <span class="age_pick"
                            id="youth_pick"></span>
                        </div>
                      </div>
                      <div>
                        경로
                        <div>
                          <span class="age_price" id="senior_price"></span>원 &times; <span class="age_pick"
                            id="senior_pick"></span>
                        </div>
                      </div>
                      <div>
                        우대
                        <div>
                          <span class="age_price" id="special_price"></span>원 &times; <span class="age_pick"
                            id="special_pick"></span>
                        </div>
                      </div>
                      <div>
                        스위트석
                        <div>
                          <span class="age_price" id="sweet_price"></span>원 &times; <span class="age_pick"
                            id="sweet_pick"></span>
                        </div>
                      </div>
                      <div>
                        합계
                        <div style="color: crimson">
                          <span id="total_price" style="color: crimson"></span>원
                        </div>
                      </div>
                    </div>
                    <div><a id="summary" href="#">결제하기</a></div>
                  </div>


                </section>

              </main>

              <jsp:include page="/WEB-INF/views/common/footer.jsp" />

            </div>
          </body>

          </html>