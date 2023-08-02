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
						<title>예매 리스트</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_book_list.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_inner_Header.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_nav.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/reset.css">

						<!-- fontawesome -->
						<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
							integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

						<!-- jQuery 라이브러리 추가(CDN) -->
						<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


					</head>

					<body>
						<main>

							<div class="main_Wrapper">
								<div id="left_Nav_Container">
									<!-- NAV 영역 -->
									<jsp:include page="/WEB-INF/views/manager/manager_nav.jsp" />

								</div>

								<div class="right_items_Container">
									<!-- 내부 HEADER 영역 -->
									<jsp:include page="/WEB-INF/views/manager/manager_inner_Header.jsp" />

									<div id="items_Wrapper">
										<div class="set_Edge">
											<div class="table_Wrapper">
												<div class="table_Title">
													<span>예매목록</span>
													<form class="search_Box">
														<select id="selectBox" name="searchType">
															<option value="BOOK_DT">예매일</option>
															<option value="USER_EMAIL">아아디</option>
															<option value="MOVIE_TITLE">영화</option>
															<option value="CINEMA_AREA">지역</option>
															<option value="CINEMA_NAME">영화관</option>
															<option value="SCREEN_STYLE">스크린</option>
															<option value="BOOK_ST">예매상태</option>
														</select>
														<input class="searchContent" placeholder="검색" name="searchContent" />
														<button class="checkBtn" type="submit">
															<i class="fa-solid fa-magnifying-glass fa-2xs"></i>
														</button>
														<input type="hidden" value="${param.cp}" />
													</form>
												</div>
												<table class="table_main">
													<tr>
														<th>예매 번호</th>
														<th>예매일</th>
														<th>회원 아이디</th>
														<th>예매 영화</th>
														<th>상영 지역</th>
														<th>상영 영화관</th>
														<th>상영 스크린</th>
														<th>상영관 번호</th>
														<th>상영 시작 시간</th>
														<th>상영 종료 시간</th>
														<th>선택 좌석</th>
														<th>인원<br><span class="smallText">일반 | 청소년 | 경로 | 우대 | 커플</span></th>
														<th>가격</th>
														<th>예매 상태</th>
													</tr>
													<c:forEach var="getBook" items="${getBookList['bookLists']}">
														<tr>
															<td>${getBook.book.bookNo}</td>
															<td>${getBook.book.bookDt}</td>
															<td>${getBook.user.userEmail}</td>
															<td>${getBook.movie.movieTitle}</td>
															<td>${getBook.cinema.cinemaArea}</td>
															<td>${getBook.cinema.cinemaName}</td>
															<td>${getBook.screen.screenStyle}</td>
															<td>${getBook.screen.screenName}&nbsp;관</td>
															<td>${getBook.play.playStart}</td>
															<td>${getBook.play.playEnd}</td>
															<c:set var="seats" value="${getBook.book.bookSeat}" />
															<c:set var="seats" value="${fn:replace(seats, '[', '')}" />
															<c:set var="seats" value="${fn:replace(seats, ']', '')}" />
															<c:set var="seats" value="${fn:replace(seats, '\"', '')}" />
															<td>${seats}</td>
															<c:set var="age" value="${getBook.book.bookAge}" />
															<c:set var="age" value="${fn:replace(age, ' [', '' )}" />
															<c:set var="age" value="${fn:replace(age, '[', '' )}" />
															<c:set var="age" value="${fn:replace(age, ']', '')}" />
															<td>${age}</td>
															<td>
																<fmt:formatNumber value="${getBook.book.bookPrice}" pattern="#,###" />&nbsp;원
															</td>
															<td>${getBook.book.bookSt}</td>
														</tr>
													</c:forEach>
												</table>
												<div class="page_Nation">
													<c:set var="url" value="?searchType=${param.searchType}&searchContent=${param.searchContent}&cp=" />
													<c:set var="pagination" value="${getBookList['pagination']}" />
													<c:set var="currentPage" value="${pagination.currentPage}" scope="request" />
													<div>
														<a href="${url}1">&lt;&lt;</a>
													</div>
													<div>
														<a href="${url}${pagination.prevPage}">&lt;</a>
													</div>
													<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
														<c:choose>
															<c:when test="${i == currentPage}">
																<div>
																	<a class="selected_Cp">${i}</a>
																</div>
															</c:when>
															<c:otherwise>
																<div>
																	<a href="${url}${i}">${i}</a>
																</div>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<div>
														<a href="${url}${pagination.nextPage}">&gt;</a>
													</div>
													<div>
														<a href="${url}${pagination.maxPage}">&gt;&gt;</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>

						</main>


						<script src="${contextPath}/resources/js/manager/manager_book_list.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_nav.js"></script>
					</body>

					</html>