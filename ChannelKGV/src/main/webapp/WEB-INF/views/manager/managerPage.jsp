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
						<title>판리자 페이지</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/manager/managerPage.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_inner_Header.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_nav.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/reset.css">

						<!-- fontawesome -->
						<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
							integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

						<!-- jQuery 라이브러리 추가(CDN) -->
						<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

						<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

						<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
										<div class="left_Item_Container">

											<!-- 일일 접속자 수 -->
											<div class="left_Inner_Contents">
												<c:set var="totalEnter" value="${totalEnter}" />
												<c:set var="totalEnter" value="${fn:replace(totalEnter, '[', '' )}" />
												<c:set var="totalEnter" value="${fn:replace(totalEnter, ']', '')}" />
												<span class="totalValues">누적 접속자 수 :
													<fmt:formatNumber value="${totalEnter}" pattern="#,###" /> 명
												</span>
												<canvas id="dailyEnter"></canvas>
											</div>

											<!-- 일일 관람객 수 -->
											<div class="left_Inner_Contents algin_Left">
												<c:set var="totalBook" value="${totalBook}" />
												<c:set var="totalBook" value="${fn:replace(totalBook, '[', '' )}" />
												<c:set var="totalBook" value="${fn:replace(totalBook, ']', '')}" />
												<span class="totalValues">누적 예매 수 :
													<fmt:formatNumber value="${totalBook}" pattern="#,###" /> 회
												</span>
												<canvas id="dailyWatch"></canvas>
											</div>

											<!-- 신규 회원 -->
											<div class="left_Inner_Contents">
												<div class="inner_Top">
													<span class="inner_Top_Text">신규 회원</span> <a href="${contextPath}/manager/member" class="new_more">더보기</a>
												</div>
												<div class="inner_Top_Content">
													<div class="noticeTable">
														<table class="tableWrapper">
															<tr>
																<th class="boardNum">번호</th>
																<th class="boardTItle">아이디</th>
																<th class="boardWriter">닉네임</th>
																<th class="boardDate">가입일</th>
																<th class="boardWatch">SNS</th>
															</tr>
															<c:forEach var="getUser" items="${getUser}" varStatus="status">
																<tr>
																	<td>${status.count}</td>
																	<td>${getUser.userEmail}</td>
																	<td>${getUser.userNick}</td>
																	<td>${getUser.userRegDate}</td>
																	<td>${getUser.userSns}</td>
																</tr>
															</c:forEach>
														</table>
													</div>
												</div>
											</div>

											<!-- 상영중인 영화 -->
											<div class="left_Inner_Contents algin_Left">
												<div class="inner_Top">
													<span class="inner_Top_Text">상영중인 영화</span> <a href="${contextPath}/manager/play_list" class="movie_more">더보기</a>
												</div>
												<div class="inner_Top_Content">
													<div class="noticeTable">
														<table class="tableWrapper">
															<tr>
																<th class="boardNum">번호</th>
																<th class="boardTItle">영화명</th>
																<th class="boardWriter">예매율</th>
																<th class="boardDate">누적상영횟수</th>
																<th class="boardDate">누적관람횟수</th>
																<th class="boardWatch">개봉일</th>
															</tr>
															<c:forEach var="movie" items="${getMovieList['cleanedList']}" varStatus="status">
																<tr>
																	<td>${status.count}</td>
																	<td><a href="${contextPath}/movieList/detail_List/introduce/${movie['movieNo']}">
																			${movie['movieTitle']}</a></td>
																	<td>예매율</td>
																	<td>${movie['moviePlayed']}</td>
																	<td>${movie['movieWatched']}</td>
																	<td>${movie['movieOpen']}</td>
																</tr>
															</c:forEach>
														</table>
													</div>
												</div>
											</div>

											<!-- 공지사항 -->
											<div class="left_Inner_Contents">
												<div class="inner_Top">
													<span class="inner_Top_Text">공지사항</span> <a href="${contextPath}/manager/notice_list" class="notice_more">더보기</a>
												</div>
												<div class="inner_Top_Content">
													<div class="noticeTable">
														<table class="tableWrapper">
															<tr>
																<th class="boardNum">번호</th>
																<th class="boardTItle">제목</th>
																<th class="boardWriter">작성자</th>
																<th class="boardDate">작성일</th>
																<th class="boardWatch">조회수</th>
															</tr>
															<c:forEach var="getNotice" items="${getNotice}" varStatus="status">
																<tr>
																	<td>${status.count}</td>
																	<td><a href="${contextPath}/helpDesk/notice_detail/${getNotice['noticeNo']}">${getNotice['noticeTitle']}</a>
																	</td>
																	<td>${getNotice.noticeUploader}</td>
																	<td>${getNotice.noticeRegDate}</td>
																	<td>${getNotice.noticeView}</td>
																</tr>
															</c:forEach>
														</table>
													</div>
												</div>
											</div>

											<!-- 1 : 1 문의 -->
											<div class="left_Inner_Contents algin_Left">
												<div class="inner_Top">
													<span class="inner_Top_Text">1 : 1 문의</span> <a href="${contextPath}/manager/ask_list" class="qna_more">더보기</a>
												</div>
												<div class="inner_Top_Content">
													<div class="noticeTable">
														<table class="tableWrapper">
															<tr>
																<th class="boardNum">번호</th>
																<th class="boardTItle">제목</th>
																<th class="boardWriter">작성일</th>
																<th class="boardDate">답변여부</th>
																<th class="boardWatch">답변일</th>
															</tr>
															<c:forEach var="mtm" items="${getMTMList}" varStatus="status">
																<tr>
																	<td>${status.count}</td>
																	<td><a href="${contextPath}/helpDesk/mTm_detail/${mtm['mtmNo']}">
																			${mtm.mtmTitle}</a></td>
																	<td>${mtm.mtmRegdate}</td>
																	<td>${mtm.mtmRepSt}</td>
																	<c:choose>
																		<c:when test="${not empty mtm.mtmRepDate}">
																			<td>${mtm.mtmRepDate}</td>
																		</c:when>
																		<c:otherwise>
																			<td>-</td>
																		</c:otherwise>
																	</c:choose>
																</tr>
															</c:forEach>
														</table>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>

						</main>

						<script src=" ${contextPath}/resources/js/manager/managerPage.js"></script>
						<!-- <script src=" ${contextPath}/resources/js/manager/apikey.js"></script> -->
						<script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_nav.js"></script>
					</body>

					</html>