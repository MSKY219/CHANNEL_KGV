<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주찾는 질문</title>


<script src="https://kit.fontawesome.com/dc6e43e0ad.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/dc6e43e0ad.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/helpDesk/question_home.css" />

<link rel="stylesheet"
	href="${contextPath}/resources/css/common/outline.css">

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
						<div>
							<div class="notice-content-wrap">
								<h2>자주 찾는 질문</h2>
								<div class="cont-search-wrap">
									<span>빠른검색</span>


									<form class="qesform" action="/movie/helpDesk/question_home" method="GET">
										<input type="text" placeholder=" 질문을 입력해주세요!" name="keyword">
										<button>
											<img src="${contextPath}/resources/images/headerPng/glasses.png" alt="">
										</button>
									</form>
								</div>
							</div>


							<div class="btn-wrap">
								<button class="btn-quest" data-quest-num="0">전체</button>
								<c:forEach var="quest" items="${selectType}" varStatus="status">
									<button class="btn-quest" data-quest-num="${status.index + 1}">${quest.questType}</button>
								</c:forEach>
							</div>

							<div class="list-wrap">
								<p>
									<span>전체</span><span class="counts">${qescount}</span>건
								</p>
 
								<ul class="cNumber" id="questListContainer">
									<c:forEach var="quest" items="${questList.questList}"
										varStatus="loop">
										<c:if test="${loop.index < 10}">
											<li>
												<div class="qList">
													<p>${quest.questType}</p>
													<p>
														<span><strong>Q</strong> ${quest.questTitle}</span> <span><i
															class="fa-solid fa-chevron-down"></i></span>
													</p>
												</div>
												<ul class="qList_detail none">
													<li>${quest.questContent}</li>
												</ul>
											</li>
										</c:if>
									</c:forEach>
								</ul>

								<!-- 10개씩 -->
								<div class="page_Nation">
									<c:set var="url" value="?keyword=${keyword}&cp="  />
									<c:set var="pagination" value="${questList['pagination']}" />
									<c:set var="currentPage" value="${pagination.currentPage}"
										scope="request" />
									<div>
										<a href="${url}1">&lt;&lt;</a>
									</div>
									<div>
										<a href="${url}${pagination.prevPage}">&lt;</a>
									</div>
									<c:forEach var="i" begin="${pagination.startPage}"
										end="${pagination.endPage}" step="1">
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


			</section>
		</main>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />



	<script src="${contextPath}/resources/js/helpDesk/question_home.js"></script>
</body>

</html>