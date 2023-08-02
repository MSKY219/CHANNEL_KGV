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
						<title>가격 목록</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_inner_Header.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/reset.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_cinema_price_list.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_nav.css">

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
									<jsp:include page="/WEB-INF/views/manager/manager_nav.jsp" />
								</div>

								<div class="right_items_Container">
									<jsp:include page="/WEB-INF/views/manager/manager_inner_Header.jsp" />

									<div id="items_Wrapper">
										<div class="set_Edge">
											<div class="table_Wrapper">

												<div class="table_Title">
													<span>극장 가격 목록</span>
													<form class="search_Box">
														<select id="selectBox" name="searchType">
															<option value="SCREEN_STYLE">상영관</option>
															<option value="PRICE_DAY">평일 / 주말</option>
															<option value="PRICE_TIME">오전 / 오후</option>
														</select>
														<input class="searchContent" placeholder="검색" name="searchContent" />
														<button class="checkBtn" type="submit">
															<i class="fa-solid fa-magnifying-glass fa-2xs"></i>
														</button>
													</form>
												</div>

												<table class="table_main">
													<tr>
														<th>번호</th>
														<th>상영관</th>
														<th>평일 / 주말</th>
														<th>오전 / 오후</th>
														<th>청소년</th>
														<th>일반</th>
														<th>커플</th>
														<th>노인</th>
														<th>우대</th>
														<th>수정</th>
														<th>삭제</th>
													</tr>

													<c:forEach var="cinemaPrice" items="${cinemaMap['cinemaPriceList']}">
														<tr>
															<td>${cinemaPrice['priceNo']}</td>
															<td>${cinemaPrice['screenStyle']}</td>
															<td>${cinemaPrice['priceDay']}</td>
															<td>${cinemaPrice['priceTime']}</td>
															<td>
																<fmt:formatNumber value="${cinemaPrice['priceTeen']}" pattern="#,###" />&nbsp;원
															</td>
															<td>
																<fmt:formatNumber value="${cinemaPrice['priceNormal']}" pattern="#,###" />&nbsp;원
															</td>
															<td>
																<fmt:formatNumber value="${cinemaPrice['priceNormal']}" pattern="#,###" />&nbsp;원
															</td>
															<td>
																<fmt:formatNumber value="${cinemaPrice['priceElder']}" pattern="#,###" />&nbsp;원
															</td>
															<td>
																<fmt:formatNumber value="${cinemaPrice['priceSpecial']}" pattern="#,###" />&nbsp;원
															</td>
															<td>
																<a href="${contextPath}/manager/manager_cinemaPrice_list/edit/${cinemaPrice['priceNo']}" class="editEvent">
																	<i class="fa-sharp fa-solid fa-pen-to-square"></i>
																</a>
															</td>
															<td><a class="deleteEvent"><i class="fa-sharp fa-solid fa-xmark"></i></a></td>
														</tr>
													</c:forEach>

												</table>
												<div class="page_Nation">
													<c:set var="url" value="?searchType=${param.searchType}&searchContent=${param.searchContent}&cp=" />
													<c:set var="pagination" value="${cinemaMap['pagination']}" />
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

						<script src="${contextPath}/resources/js/manager/manager_cinema_price_list.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_nav.js"></script>

					</body>

					</html>