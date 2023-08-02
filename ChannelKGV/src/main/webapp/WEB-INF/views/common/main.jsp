<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ page session="false" %>
					<!-- 최신화 종료 건들일없음 -->

					<!DOCTYPE html>
					<html lang="en">

					<head>
						<meta charset="UTF-8">
						<meta http-equiv="X-UA-Compatible" content="IE=edge">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>Channel_KGV</title>
						<link rel="stylesheet" href="${contextPath}/resources/css/common/main.css" />
						<link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">


						<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
						<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>


						<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
						<script src="${contextPath}/resources/js/main/main.js"></script>



					</head>

					<body>
						<div class="modal_wrap">

							<div class="mdContWrap">
								<div class="mdCont">
									<p>저희 Channel_KGV는
										<br><span>"비영리 목적"</span>으로 만들어진,
										<br>포트폴리오만을 위한 홈페이지입니다.
										<br>이미지, 글 등 해당 홈페이지의
										<br>컨텐츠는 "절대" 상업적으로 이용하지
										<br>않는 것을 말씀드립니다.
										<br>컨텐츠의 저작권 등에 문제가 발생한다면
										<br>010-8229-7832 또는 010-2082-3987로 연락주시면 즉시 조치하겠습니다.
										<br>email : dogeunlee89@gmail.com / cropruch@naver.com
									</p>

									<a class="closemdp">24시간동안 닫기</a>
								</div>
							</div>

						</div>

						<div id="wrap">
							<!-- header -->
							<jsp:include page="/WEB-INF/views/common/header.jsp" />
							<main>
								<!-- 첫번째 섹션 거대배너광고 -->
								<section>

									<div class="swiper-container">
										<div class="swiper-wrapper">
											<c:forEach var="getBanner" items="${getBannerList['BannerList']}">
												<c:choose>
													<c:when test="${getBanner['bannerSt'] ne 'N'}">
														<div class="swiper-slide">
															<a href="${getBanner['bannerUrl']}"><img src="${getBanner['bannerImg']}" alt=""></a>
														</div>
													</c:when>
													<c:otherwise>

													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>

										<div class="swiper-button-next"></div>
										<div class="swiper-button-prev"></div>

									</div>
								</section>

								<!-- 두번째 라인 5ea ( 영화리스트 목록 ( 카드까지 ) )-->
								<section>

									<div class="swiper-title">
										<div>
											<p>상영중인 영화</p>
										</div>
										<a class="moveBtn" href="${contextPath}/movieList/detail_List">전체보기</a>
									</div>
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<c:forEach var="movie" items="${getMovieList['cleanedList']}" varStatus="status">
												<div class="swiper-slide">
													<div id="positionSet">
														<c:choose>
															<c:when test="${fn:contains(movie['mgNo'], '전체')}">
																<img src="${contextPath}/resources/images/age/aage.png" class="age-img-area">
															</c:when>
															<c:when test="${fn:contains(movie['mgNo'], '12')}">
																<img src="${contextPath}/resources/images/age/12age.png" class="age-img-area">
															</c:when>
															<c:when test="${fn:contains(movie['mgNo'], '15')}">
																<img src="${contextPath}/resources/images/age/15age.png" class="age-img-area">
															</c:when>
															<c:otherwise>
																<img src="${contextPath}/resources/images/age/18age.png" class="age-img-area">
															</c:otherwise>
														</c:choose>
														<a href="${contextPath}/movieList/detail_List/introduce/${movie['movieNo']}"><img src="${movie['movieImg1']}" onmouseenter="zoomIn(event)"
																onmouseleave="zoomOut(event)" class="ageIndexLeve"></a>
													</div>
													<div>
														<a href="${contextPath}/movieList/detail_List/introduce/${movie['movieNo']}">
															<span>${movie['movieTitle']}</span>
														</a>
														<div>
															<p>
																예매율 <span class="revlikeVal">${bookPercent[status.index]}</span>%
															</p>
															<p>
																개봉일 <span>${movie['movieOpen']}</span>
															</p>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev">
								</section>

								<!-- 세번재 섹션 이벤트리스트 3ea-->
								<section>
									<div>
										<div class="event-title">
											<p>EVENT</p>
											<div>
												<a class="moveBtn" href="${contextPath}/eventList/detail_List">전체보기</a>
											</div>
										</div>
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<c:forEach var="event" items="${getEvnetList['getEvnetList']}" varStatus="status">
													<c:choose>
														<c:when test="${event['eventStatus'] ne 'N'}">
															<input type="hidden" class="eventNo" value="${event['eventNo']}" />
															<div class="swiper-slide">
																<a href="${contextPath}/eventList/detail_List/introduce/${event['eventNo']}">
																	<img src="${event['eventImg']}" alt="" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
																	<strong>${event['eventTitle']}</strong>
																	<span>${event['eventStart']}&nbsp;~&nbsp;
																		${event['eventEnd']}</span>
																</a>
															</div>
														</c:when>
														<c:otherwise>

														</c:otherwise>
													</c:choose>
												</c:forEach>

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
												<p>특별관 안내</p>
											</div>
											<a class="moveBtn" href="${contextPath}/theater/specialTheater">전체보기</a>
										</div>


										<div>
											<div>
												<a href="${contextPath}/theater/specialTheater/1" class="stheater"> <img src="${contextPath}/resources/images/teater_special/imax_04.jpg"
														onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" alt="" />
												</a> <a href="${contextPath}/theater/specialTheater/2" class="stheater">
													<img src="${contextPath}/resources/images/teater_special/img-theater-db-view05.png" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"
														alt="" />
												</a> <a href="${contextPath}/theater/specialTheater/5" class="stheater">
													<img src="${contextPath}/resources/images/teater_special/abcd.jpg" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" alt="" />
												</a> <a href="${contextPath}/theater/specialTheater/3" class="stheater">
													<img src="${contextPath}/resources/images/teater_special/style_625d608c1cb71.jpg" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"
														alt="" />
												</a> <a href="${contextPath}/theater/specialTheater/4" class="stheater">
													<img src="${contextPath}/resources/images/teater_special/Featured-1068x580-1-2.png" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"
														alt="" />
												</a>
											</div>


											<div class="preventDiv">
												<!-- hover시 각각의 div에 border 생성하시면됩니다. -->
												<a href="${contextPath}/theater/specialTheater/1" class="deleteUnderline">
													<span>KMAX</span> <span>#세계 최대의 상영관</span>
												</a> <a href="${contextPath}/theater/specialTheater/2" class="deleteUnderline">
													<span>DOLBY</span> <span>#차세대
														몰입형 사운드</span>
												</a> <a href="${contextPath}/theater/specialTheater/5" class="deleteUnderline">
													<span>CHEF & CINE</span> <span>#최고의
														가치를 경험하세요</span> </span>
												</a> <a href="${contextPath}/theater/specialTheater/3" class="deleteUnderline">
													<span>PUPPY & ME</span> <span>#반려동물과
														영원히 함께</span>
												</a> <a href="${contextPath}/theater/specialTheater/4" class="deleteUnderline">
													<span>YES KIDS</span> <span>#더이상
														노키즈존은 STOP</span>
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
												<span>공지사항</span> <span><a href="#">
														<c:choose>
															<c:when test="${empty getNoticeList.noticeLists}">
																<span>게시글이 존재하지 않습니다.</span>
															</c:when>
															<c:otherwise>
																<c:forEach var="getNotice" items="${getNoticeList.noticeLists}" varStatus="loop">
																	<c:if test="${loop.index < 1}">
																		<span><a href="${contextPath}/helpDesk/notice_detail/${getNotice.noticeNo}" class="nottitle">${getNotice.noticeTitle}</a></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</a></span> <a href="${contextPath}/helpDesk/notice_List">더보기</a>
											</div>

											<div>
												<span>고객센터</span>
												<div>
													<p>123-4567-8901</p>
													<span>고객센터 운영시간 ( 365일 연중무휴 )</span> <span>업무시간 외 안내
														가능합니다?</span>
												</div>

											</div>

											<div>
												<a href="${contextPath}/helpDesk/mTm_List">FAQ</a> <a href="${contextPath}/helpDesk/mTm_List">1:1문의</a> <a href="#">대관 /
													단체
													문의</a>
											</div>
										</div>

										<div><img src="${contextPath}/resources/images/FINAL_LOGO.png" width="250px">
										</div>

									</div>

								</section>
							</main>
						</div>

						<jsp:include page="/WEB-INF/views/common/footer.jsp" />

					</body>



					</html>