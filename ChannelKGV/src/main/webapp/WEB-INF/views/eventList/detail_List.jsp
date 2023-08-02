<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ page session="false" %>

					<!DOCTYPE html>
					<html lang="en">

					<head>
						<meta charset="UTF-8">
						<meta http-equiv="X-UA-Compatible" content="IE=edge">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>진행중인 이벤트 목록</title>
						<link rel="stylesheet" href="${contextPath}/resources/css/movieList/eventList.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">

						<!-- fontawesome -->
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
							integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
							crossorigin="anonymous" referrerpolicy="no-referrer" />

						<script src="https://code.jquery.com/jquery-3.6.0.min.js"
							integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
							crossorigin="anonymous"></script>

					</head>

					<body>
						<div id="wrap">

							<jsp:include page="/WEB-INF/views/common/header.jsp" />

							<main>
								<div>
									<span>진행중인 이벤트 목록</span>
								</div>

								<div>
									<ol>
										<c:forEach var="event" items="${getEvnetList['getEvnetList']}"
											varStatus="status">
											<c:choose>
												<c:when test="${event['eventStatus'] ne 'N'}">
													<li>
														<div>
															<input type="hidden" class="eventNo"
																value="${event['eventNo']}" />
															<span class="wordOuter"></span>
															<a
																href="${contextPath}/eventList/detail_List/introduce/${event['eventNo']}">
																<img src="${event['eventImg']}" class="target1"></a>
														</div>

														<div>
															<a class="target1"
																href="${contextPath}/eventList/detail_List/introduce/${event['eventNo']}">
																<span
																	class="eventTitle">${event['eventTitle']}</span></a>
															<div>
																<p>
																	<span class="evedate">${event['eventStart']}&nbsp;~&nbsp;
																		${event['eventEnd']}</span>
																</p>
															</div>
														</div>
													</li>
												</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ol>
								</div>
							</main>
						</div>
						<jsp:include page="/WEB-INF/views/common/footer.jsp" />

						<script src="${contextPath}/resources/js/introduce/detail_list.js"></script>
						<!-- <script src="${contextPath}/resources/js/introduce/introduce.js"></script> -->

					</body>

					</html>