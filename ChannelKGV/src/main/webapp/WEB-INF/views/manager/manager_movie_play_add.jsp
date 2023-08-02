<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ page session="false" %>

					<!DOCTYPE html>
					<html lang="ko">

					<head>
						<meta charset="UTF-8">
						<meta http-equiv="X-UA-Compatible" content="IE=edge">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>상영시간 등록</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_inner_Header.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_movie_play.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_nav.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/reset.css">

						<!-- fontawesome -->
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
							integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
							crossorigin="anonymous" referrerpolicy="no-referrer" />

						<!-- jQuery 라이브러리 추가(CDN) -->
						<script src="https://code.jquery.com/jquery-3.6.0.min.js"
							integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
							crossorigin="anonymous"></script>
					</head>

					<body>
						<main>
							<div class="main_Wrapper">
								<div id="left_Nav_Container">
									<jsp:include page="/WEB-INF/views/manager/manager_nav.jsp" />
								</div>

								<div class="right_items_Container">
									<jsp:include page="/WEB-INF/views/manager/manager_inner_Header.jsp" />
									<div id="items_Wrapper">
										<div class="set_Edge">
											<div class="table_Wrapper">

												<div class="table_Title">
													<span>상영시간 등록</span>
												</div>
												<div class="table_main">

													<div id="play_cinema_area">
														<span>상영 지역</span>
														<div class="relative">
															<div class="play_cinema_area_enter"></div>
															<div class="area_Items">
																<div class="play_cinema_area_slide">
																	<div class="area_item">서울</div>
																	<div class="area_item">경기</div>
																	<div class="area_item">충청</div>
																	<div class="area_item">전라</div>
																	<div class="area_item">경남</div>
																	<div class="area_item">경북</div>
																	<div class="area_item">강원</div>
																	<div class="area_item">제주</div>
																</div>
															</div>
														</div>
													</div>

													<div id="play_cinema">
														<span>상영 영화관</span>
														<div class="relative">
															<div class="play_cinema_enter"></div>
															<div class="cinema_Items">
																<div class="play_cinema_slide">

																</div>
															</div>
														</div>
													</div>

													<div id="play_screen">
														<span>상영 스크린</span>
														<div class="relative">
															<div class="play_screen_enter"></div>
															<div class="screen_Items">
																<div class="play_screen_slide">

																</div>
															</div>
														</div>
													</div>

													<div id="play_movie">
														<span>상영 영화</span>
														<div class="relative">
															<div class="play_movie_enter"></div>
															<div class="movie_Items">
																<div class="play_movie_slide">
																	<c:forEach var="playingMovie"
																		items="${playMap['playingMovieList']}">
																		<div>${playingMovie['movieTitle']}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>

													<div id="play_time">
														<span>상영 시간</span>
														<div class="relative">
															<div class="play_time_enter"></div>
															<div class="time_Items">
																<div class="play_time_slide">
																	<c:forEach var="timeTable"
																		items="${playMap['timeTableList']}">
																		<div>${timeTable['ttTime']}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>

													<div id="play_start">
														<span>상영 시작일</span>
														<div class="play_start_container">
															<div>
																<input class="start_date" type="date"
																	onfocus="this.showPicker()" />
															</div>
														</div>
													</div>

													<div id="play_end">
														<span>상영 종료일</span>
														<div>
															<div>
																<input class="end_date" type="date"
																	onfocus="this.showPicker()" />
															</div>
														</div>
													</div>
													<div class="table_bottom">
														<button class="bottom_Submit">저장</button>
														<button class="bottom_Cancel">취소</button>
													</div>
												</div>
												
												<!-- 
												<form action="play_add/enroll" method="post" id="playAddForm">
												</form>
												 -->												
												


											</div>
										</div>
									</div>
								</div>

							</div>

						</main>

						<script src="${contextPath}/resources/js/manager/manager_movie_play.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_nav.js"></script>
					</body>

					</html>