<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
 <!-- 최신화 종료 건들일없음 -->

 <!DOCTYPE html>
 <html lang="en">
 
 <head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
	<link rel="stylesheet"	href="${contextPath}/resources/css/common/main.css" />
	<link rel="stylesheet"	href="${contextPath}/resources/css/common/outline.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
 
 </head>
 
 <body>
     <div id="wrap">
        		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
         <main>
             <!-- 첫번째 섹션 거대배너광고 -->
             <section>
 
                 <div class="swiper-container">
                     <div class="swiper-wrapper">
 
                         <div class="swiper-slide">
                             <a href="#"><img src="${contextPath}/resources/images/banner_img/test1.png" alt=""></a>
                         </div>
                         <div class="swiper-slide">
                             <a href="#"><img src="${contextPath}/resources/images/banner_img/test4.png" alt=""></a>
                         </div>
                     </div>
 
                     <div class="swiper-button-next"></div>
                     <div class="swiper-button-prev"></div>
 
                 </div>
             </section>
 
             <!-- 두번째 라인 5ea ( 영화리스트 목록 ( 카드까지 ) )-->
             <section>
 
                 <div class="swiper-title">
                     <div>
                         <a href="#">상영목록</a>
                     </div>
                     <button>전체보기</button>
                 </div>
                 <div class="swiper-container">
 
 
                     <div class="swiper-wrapper">
                         <div class="swiper-slide">
                             <div>
                                 <em>1
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_05.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                             <!-- <div>
                             <button>0</button>
                             <button>예매</button>
                         </div> -->
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>2
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_01.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                             <!-- <div>
                             <button>0</button>
                             <button>예매</button>
                         </div> -->
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>3
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_02.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                             <!-- <div>
                             <button>0</button>
                             <button>예매</button>
                         </div> -->
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>4
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_03.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                             <!-- <div>
                             <button>0</button>
                             <button>예매</button>
                         </div> -->
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>5
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_04.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                             <!-- <div>
                             <button>0</button>
                             <button>예매</button>
                         </div> -->
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>6
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_05.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                             <!-- <div>
                             <button>0</button>
                             <button>예매</button>
                         </div> -->
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>7
                                 </em>
                                 <a href="#"><img src="${contextPath}/resources/images/movieList/movie_01.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                         </div>
                         <div class="swiper-slide">
                             <div>
                                 <em>8
                                 </em>
                                 <a href=""><img
                                         src="${contextPath}/resources/images/movieList/movie_06.jpg" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)"></a>
                             </div>
                             <div>
                                 <a href=""> <span>가디언 오브 갤럭시</span></a>
                                 <div>
                                     <p>예매율 <span>100.0</span>%</p>
                                     <p>개봉일 <span>2023.01.01</span></p>
                                 </div>
                             </div>
                         </div>
                     </div>
 
 
                 </div>
                 <div class="swiper-button-next"></div>
                 <div class="swiper-button-prev">
 
             </section>
 
             <!-- 세번재 섹션 이벤트리스트 3ea-->
             <section>
                 <div>
                     <div class="event-title">
                         <a href="">EVENT</a>
                         <div><button>전체보기</button></div>
                     </div>
                     <div class="swiper-container">
                         <div class="swiper-wrapper">
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event001.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event002.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
 
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event003.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event002.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event001.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event002.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
                             <div class="swiper-slide">
                                 <a href="#">
                                     <img src="${contextPath}/resources/images/eventList/event003.jpg" alt="" onmouseenter="zoomIn(event)"
                                         onmouseleave="zoomOut(event)">
                                     <strong>이벤트1</strong>
                                     <span>2023.01.01 ~ 2023.02.02</span>
                                 </a>
                             </div>
                         </div>
                         <div class="swiper-button-next"></div>
                         <div class="swiper-button-prev"></div>
                     </div>
 
                 </div>
             </section>
 
             <!-- 네번재 색션 관 소개-->
             <section>
                 <div>
 
                     <div>
                         <div>
                             <a href="#">특별관 안내</a>
                         </div>
                         <button>전체보기</button>
                     </div>
 
 
                     <div>
                         <div>
                             <a href="#" class="stheater" >
                                 <img src="${contextPath}/resources/images/teater_special/imax_04.jpg" alt=""></a>
                             <a href="#" class="stheater"  ><img src="${contextPath}/resources/images/teater_special/img-theater-db-view05.png" alt=""
                                    ></a>
                             <a href="#"class="stheater"  ><img src="${contextPath}/resources/images/teater_special/abcd.jpg" alt=""
                                  ></a>
                             <a href="#" class="stheater" ><img src="${contextPath}/resources/images/teater_special/style_625d608c1cb71.jpg" alt=""
                                 ></a>
                             <a href="#"  class="stheater" ><img src="${contextPath}/resources/images/teater_special/Featured-1068x580-1-2.png" alt=""
                               ></a>
                         </div>
                         <div class="preventDiv">
                             <!-- hover시 각각의 div에 border 생성하시면됩니다. -->
                             <a href="#" class="deleteUnderline">
                                 <span>KMAX</span> <span >#세계 최대의 상영관</span>
                             </a>
                             <a href="#" class="deleteUnderline">
                                 <span>DOLBY</span> <span >#차세대 몰입형 사운드</span>
                             </a>
                             <a href="#"  class="deleteUnderline">
                                 <span>CHEF & CINE</span> <span>#최고의 가치를 경험하세요</span> </span>
                             </a>
                             <a href="#"  class="deleteUnderline">
                                 <span>PUPPY & ME</span> <span>#반려동물과 영원히 함께</span>
                             </a>
                             <a href="#"  class="deleteUnderline">
                                 <span>YES KIDS</span> <span>#더이상 노키즈존은 STOP</span>
                             </a>
                         </div>
                     </div>
                 </div>
             </section>
 
             <!-- 다섯번째 섹션 공지사항 등등 -->
             <section>
 
                 <div>
 
                     <div>
                         <div>
                             <span>공지사항</span>
                             <span><a href="#">공지글{dkkkkkkkkkkkkkkkasdfasdfasdftprtm~~~?}</a></span>
                             <a href="">더뷰기</a>
                         </div>
 
                         <div>
                             <span>고객센터</span>
                             <div>
                                 <p>123-4567-8901</p>
                                 <span>고객센터 운영시간 ( 365일 연중무휴 )</span>
                                 <span>업무시간 외 안내 가능합니다?</span>
                             </div>
 
                         </div>
 
                         <div>
                             <a href="#">FAQ</a>
                             <a href="#">1:1문의</a>
                             <a href="#">대관 / 단체 문의</a>
                         </div>
                     </div>
 
                     <div>
 
                         뭘 넣을지 몰라서 다 준비했어
 
                     </div>
 
                 </div>
 
             </section>
         </main>
     </div>
     
 	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
   
     <!--
     <%-- session에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>
             <c:if test="${ !empty sessionScope.message }">
                 <script>
                     alert("${message}");
                     // EL 작성 시 scope를 지정하지 않으면
                     // page -> request -> session -> application 순서로 검색하여
                     // 일치하는 속성이 있으면 출력
                 </script>
 
                 <%-- message 1회 출력 후 session에서 제거 --%>
                 <c:remove var="message" scope="session" />
             </c:if>
             -->
 </body>
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"
     integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 
<script src="${contextPath}/resources/js/main/main.js"></script>
 
 </html>