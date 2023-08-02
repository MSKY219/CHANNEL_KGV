<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>KMAX</title>
			<link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterS1.css">
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
								<li> <a> KMAX</a> </li>
								<li><a href="${contextPath}/theater/specialTheater/2">DOLBY</a></li>
								<li><a href="${contextPath}/theater/specialTheater/5">DISH &
										WINE</a></li>
								<li> <a href="${contextPath}/theater/specialTheater/3">WITH A
										PUPPY</a></li>
								<li> <a href="${contextPath}/theater/specialTheater/4">KIDS</a></li>
							</ul>

						<div class="spanCLS">
							<p>궁극의 몰입감</p>
							<p>KMAX</p>
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
							<img src="${contextPath}/resources/images/teater_special/imax_04.jpg" alt="">
							<p>
								MAXIMIZED<br> SCREEN
							</p>
						</div>
					</div>
					<!-- 5 -->

					<div>
						<div>
							<div>
								<img src="${contextPath}/resources/images/teater_special/imax_list0.png">
								<div>
									<p style="font-size: 1.5rem">
										Crystal Clear<br> <strong style="font-size: 2rem">KMAGE</strong>
									</p>
									<span> Customized Projector로<br> 비교할 수 없는 밝음과 뛰어난<br>
										선명한 화질 제공<br>

									</span>
								</div>
							</div>
							<div>
								<img src="${contextPath}/resources/images/teater_special/imax_list1.png">
								<div>
									<span>
										<p style="font-size: 1.5rem">
											Maximized<br> <strong style="font-size: 2rem">SCREEN</strong>
										</p> 대형 스크린에 맞는<br> 맞춤형 설계로 모든 좌석에서<br> 최고의 몰입 가능<br>
									</span>
								</div>
							</div>
							<div>
								<img src="${contextPath}/resources/images/teater_special/imax_list2.png">
								<div>
									<span>
										<p style="font-size: 1.5rem">
											Powerful<br> <strong style="font-size: 2rem">SOUND</strong>
										</p> 완벽하게 조율된 소리와<br> 핀 포인트 정확도로<br> 최적의 사운드를 제공<br>
									</span>
								</div>
							</div>
						</div>
					</div>

					<!-- 6 -->
					<div>
						<div>
							<img src="${contextPath}/resources/images/teater_special/imax_05.jpg" alt="">
							<p>
								궁극의 몰입감<br>KMAX
							</p>
						</div>

					</div>
					<!-- 7 -->
					<div>
						<div>
							<img src="${contextPath}/resources/images/teater_special/imax_03.png" alt="">
							<p>
								WORLD NO.1<br> BIGGIST SCRREEN
							</p>
						</div>
					</div>

					<!-- 7-- -->
					<div>
						<div>
							<p>KMAX 상영관</p>
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
							<p>KMAX 추천영화</p>
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