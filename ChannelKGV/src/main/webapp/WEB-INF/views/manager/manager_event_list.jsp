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
						<title>이벤트 목록</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_inner_Header.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_event_list.css">
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
									<jsp:include page="/WEB-INF/views/manager/manager_nav.jsp" />
								</div>

								<div class="right_items_Container">
									<jsp:include page="/WEB-INF/views/manager/manager_inner_Header.jsp" />

									<div id="items_Wrapper">
										<div class="set_Edge">
											<div class="table_Wrapper">
												<div class="table_Title">
													<span>이벤트 목록</span>
													<form class="search_Box">
														<select id="selectBox" name="searchType">
															<option value="EVENT_TITLE">이벤트 제목</option>
															<option value="EVENT_START">이벤트 시작일</option>
															<option value="EVENT_END">이벤트 종료일</option>
															<option value="EVENT_REG">이벤트 작성일</option>
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
														<th>이벤트 제목</th>
														<th>이벤트 시작일</th>
														<th>이벤트 종료일</th>
														<th>이벤트 작성일</th>
														<th>이벤트 상태</th>
														<th>수정</th>
														<th>삭제</th>
													</tr>
													<c:forEach var="getEvent" items="${getEventList['eventList']}">
														<tr>
															<td>${getEvent['eventNo']}</td>

															<td>
																<c:choose>
																	<c:when test="${getEvent['eventStatus'] == 'Y'}">
																		<a href="${contextPath}/eventList/detail_List/introduce/${getEvent['eventNo']}">${getEvent['eventTitle']}</a>
																	</c:when>
																	<c:otherwise>
																		<a href="${contextPath}/eventList/end_List/introduce//${getEvent['eventNo']}">${getEvent['eventTitle']}</a>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>${getEvent['eventStart']}</td>
															<td>${getEvent['eventEnd']}</td>
															<td>${getEvent['eventReg']}</td>
															<c:choose>
																<c:when test="${getEvent['eventStatus'] == 'Y'}">
																	<td><select class="Is_On" data-id="${getEvent['eventNo']}">
																			<option value="N">N</option>
																			<option value="Y" selected>Y</option>
																		</select></td>
																</c:when>
																<c:otherwise>
																	<td><select class="Is_On" data-id="${getEvent['eventNo']}">
																			<option value="N" selected>N</option>
																			<option value="Y">Y</option>
																		</select></td>
																</c:otherwise>
															</c:choose>

															<td><a href="${contextPath}/manager/event_list/edit/${getEvent['eventNo']}" class="editEvent"><i
																		class="fa-sharp fa-solid fa-pen-to-square"></i></a>
															</td>
															<td><a class="deleteEvent"><i class="fa-sharp fa-solid fa-xmark"></i></a></td>
														</tr>
													</c:forEach>

												</table>
												<div class="page_Nation">
													<c:set var="url" value="?searchType=${param.searchType}&searchContent=${param.searchContent}&cp=" />
													<c:set var="pagination" value="${getEventList['pagination']}" />
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

						<script src="${contextPath}/resources/js/manager/manager_event_list.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_nav.js"></script>
					</body>

					</html>