<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터 홈</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- 전역css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/outline.css">

<!-- 컨텐츠css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/helpDesk/helpDesk_Home.css" />

<!-- ASIDE CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/notice_Aside.css">
</head>
 
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<main>
			<section>
				<jsp:include page="/WEB-INF/views/common/noticeAside.jsp" />

				<div class="container">
					<div class="notice-wraaper">
						<!-- 제목, 검색, 링크  -->
						<div>
							<div class="notice-content-wrap">
								<h2>고객센터</h2>
								<div class="cont-search-wrap">
									<span>빠른검색</span>

									<form class="qesform" action="/movie/helpDesk/question_home" method="GET">
										<input type="text" placeholder=" 질문을 입력해주세요!" name="keyword">
										<button>
											<img
												src="${contextPath}/resources/images/headerPng/glasses.png"
												alt="">
										</button>
									</form>
								</div>
							</div>

							<div class="new-wrap">

								<div>
									<a href="${contextPath}/helpDesk/notice_List"
										onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><img
										src="${contextPath}/resources/images/helpDesk/notice01.png"
										alt="notice"></a> <a
										href="${contextPath}/helpDesk/notice_List">
										<p>공지사항</p> <span>공지사항을 확인해보세요</span>
									</a>
								</div>


								<div>
									<a href="${contextPath}/helpDesk/lost_List"
										onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><img
										src="${contextPath}/resources/images/helpDesk/notice02.png"
										alt="lost"></a> <a href="${contextPath}/helpDesk/lost_List">
										<p>분실물 문의</p> <span>분실물 등록 바로가기</span>
									</a>

								</div>
								<div>
									<a class="notyet" href="#" onmouseenter="zoomIn(event)"
										onmouseleave="zoomOut(event)"><img
										src="${contextPath}/resources/images/helpDesk/notice03.png"
										alt="people"></a> <a href="" class="notyet">
										<p>단체 / 대관 문의</p> <span>준비중입니다.</span>
									</a>
								</div>
								<div>
									<a href="${contextPath}/helpDesk/question_home"
										onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><img
										src="${contextPath}/resources/images/helpDesk/notice04.png"
										alt="question"></a> <a
										href="${contextPath}/helpDesk/question_home">
										<p>자주 찾는 문의</p> <span>자주 찾는 질문들을 확인하세요</span>
									</a>

								</div>
								
								<div>
									<c:choose>
									  <c:when test="${loginUser.userNo > 0}">
										<a href="${contextPath}/myPage/myMtmList"
										   onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><img
										   src="${contextPath}/resources/images/helpDesk/notice05.png"
										   alt="mymtm" onmouseenter="zoomIn(event)"
										   onmouseleave="zoomOut(event)"></a>
										<a href="${contextPath}/myPage/myMtmList"><p>내 상담 내역</p> <span>내가 등록한 문의 확인하기</span> </a>
									  </c:when>
									  <c:otherwise>
										<a href="${contextPath}/user/login"
										   onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><img
										   src="${contextPath}/resources/images/helpDesk/notice05.png"
										   alt="mymtm" onmouseenter="zoomIn(event)"
										   onmouseleave="zoomOut(event)"></a>
										<a href="${contextPath}/user/login"><p>내 상담 내역</p> <span>내가 등록한 문의 확인하기</span> </a>
									  </c:otherwise>
									</c:choose>
								  </div>

								<div>
									<a href="${contextPath}/helpDesk/mTm_List"
										onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><img
										src="${contextPath}/resources/images/helpDesk/notice06.png"
										alt="mtm"></a> <a href="${contextPath}/helpDesk/mTm_List">
										<p>1:1 문의</p> <span>1:1문의 등록 바로가기</span>
									</a>
								</div>
							</div>

							<!-- 토이 테이블 -->
							<div class="table-wrap">
								<!-- 자주찾는 질문 테이블 -->
								<div class="question_tbl_wrap">
									<p>
										<span>영화 예매 질문</span> <a
											href="${contextPath}/helpDesk/question_home"><span>더보기
												&gt</span></a>
									</p>
									<table class="question_tbl">
										<tbody>
											<c:choose>
												<c:when test="${empty questList.questList}">
													<tr class="row">
														<th colspan="3">게시글이 존재하지 않습니다.</th>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="quest" items="${questList.questList}"
														varStatus="loop">
														<c:if test="${loop.index < 5}">
															<tr class="row">
																<td>${quest.questNo}</td>
																<th><a href="${contextPath}/helpDesk/question_home">${quest.questTitle}</a>
																</th>
																<td>${quest.questType}</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>

								</div>

								<!-- 공지사항 테이블 -->
								<div class="notice_tbl_wrap">
									<p>
										<span>공지사항</span> <a
											href="${contextPath}/helpDesk/notice_List"><span>더보기
												&gt</span></a>
									</p>

									<table class="notice_tbl">


										<c:choose>
											<c:when test="${empty userNoticeList.noticeLists}">
												<tr>
													<th colspan="3">게시글이 존재하지 않습니다.</th>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="userNoticeList"
													items="${userNoticeList.noticeLists}" varStatus="loop">
													<c:if test="${loop.index < 5}">
														<tr class="row">
															<td>${userNoticeList.noticeNo}</td>
															<th><a
																href="${contextPath}/helpDesk/notice_detail/${userNoticeList.noticeNo}">${userNoticeList.noticeTitle}</a>
															</th>
															<td>${userNoticeList.noticeRegDate}</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>


									</table>


								</div>
							</div>




						</div>

						<!-- Event Swiper section -->
						<div class="event-wrap">
							<div>
								<div class="event-title">
									<p style="font-size: 1.5rem">EVENT</p>
									<div>
										<a href="${contextPath}/eventList/detail_List" class="button">전체보기</a>
									</div>
								</div>

								<div class="swiper-container">
									<div class="swiper-wrapper">
										<c:forEach var="event" items="${getEvnetList['getEvnetList']}"
											varStatus="status">
											<c:choose>
												<c:when test="${event['eventStatus'] ne 'N'}">
													<input type="hidden" class="eventNo"
														value="${event['eventNo']}" />
													<div class="swiper-slide">
														<a
															href="${contextPath}/eventList/detail_List/introduce/${event['eventNo']}">
															<img src="${event['eventImg']}" alt=""
															onmouseenter="zoomIn(event)"
															onmouseleave="zoomOut(event)"> <strong>${event['eventTitle']}</strong>
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
									<div class="swiper-button-next swipe-nbtn"></div>
									<div class="swiper-button-prev swipe-pbtn"></div>
								</div>

							</div>


						</div>
					</div>
				</div>

			</section>
		</main>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- for swiperJs -->
	<script src="${contextPath}/resources/js/helpDesk/helpDesk_home.js"></script>
</body>

</html>