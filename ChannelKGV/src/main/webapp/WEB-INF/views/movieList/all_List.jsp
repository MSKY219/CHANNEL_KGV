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
						<title>전체영화</title>
						<link rel="stylesheet" href="${contextPath}/resources/css/movieList/movieList.css">
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
									<span>${pageTitle}</span> <span class="hkeywordss">${hkeyword}</span>
								</div>

								<c:choose>
									<c:when test="${not empty getMovieList['cleanedList']}">
										<div>
											<ol>
												<c:forEach var="movie" items="${getMovieList['cleanedList']}"
													varStatus="status">
													<li>
														<div>
															<input type="hidden" class="userAge"
																value="${loginUser.userBirth}" />
															<input type="hidden" class="movieGrade"
																value="${movie.mgNo}" />
															<span class="wordOuter">${status.count}
																<c:choose>
																	<c:when test="${fn:contains(movie['mgNo'], '전체')}">
																		<img src="${contextPath}/resources/images/age/aage.png"
																			class="age-img-area">
																	</c:when>
																	<c:when test="${fn:contains(movie['mgNo'], '12')}">
																		<img src="${contextPath}/resources/images/age/12age.png"
																			class="age-img-area">
																	</c:when>
																	<c:when test="${fn:contains(movie['mgNo'], '15')}">
																		<img src="${contextPath}/resources/images/age/15age.png"
																			class="age-img-area">
																	</c:when>
																	<c:otherwise>
																		<img src="${contextPath}/resources/images/age/18age.png"
																			class="age-img-area">
																	</c:otherwise>
																</c:choose>
															</span>

															<a
																href="${contextPath}/movieList/detail_List/introduce/${movie['movieNo']}">
																<img src="${movie['movieImg1']}" class="target1" onmouseenter="zoomIn(event)"
																onmouseleave="zoomOut(event)" ></a>
														</div>

														<div>
															<a class="titleFont"
																href="${contextPath}/movieList/detail_List/introduce/${movie['movieNo']}">
																<span>${movie['movieTitle']}</span></a>
															<div>
																<p class="textSize">
																	예매율&nbsp<span
																		class="revlikeVal">${bookPercent[status.index]}</span>%
																</p>
																<p class="textSize">
																	개봉일&nbsp<span>${movie['movieOpen']}</span>
																</p>
															</div>
														</div>

														<div>
															<!-- 좋아요버튼 -->
															<button><span
																	class="revlikeVal">${revLike[status.index]}</span>
																/5.0</button>
															<a href="${contextPath}/reserve/choicePlay">예매</a>
														</div>
													</li>
												</c:forEach>
											</ol>
										</div>
									</c:when>
									<c:otherwise>
										<h1 class="noList">검색 결과가 없습니다</h1>
									</c:otherwise>
								</c:choose>


							</main>
						</div>
						<jsp:include page="/WEB-INF/views/common/footer.jsp" />

						<script src="${contextPath}/resources/js/introduce/detail_list.js"></script>


						<script>
							$(document).ready(function () {
								$('.hkeywordss').each(function () {
									var originalText = $(this).text();
									$(this).text(": " + originalText);
								});
							});
						</script>
					</body>

					</html>