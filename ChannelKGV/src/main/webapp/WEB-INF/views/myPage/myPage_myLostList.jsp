<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!-- 최신화 종료 건들일없음 -->


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 분실물 문의 내역</title>

    <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
    <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_aSide.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_myLostList.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_randomEvent.css">

</head>

<body>
    <div id="wrap">
    
         <!-- header -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <main>
            <section>
                <div class="asideAconatiner">
                    
                    <!-- aSide -->
                    <jsp:include page="/WEB-INF/views/myPage/myPage_aSide.jsp" />

                    <div class="container">
                        <div>
                            <div class="notice-content-wrap">
                                <div class="notice-header">
                                    <h2>내 분실물 문의 내역</h2>
                                    <p>내가 한 분실물 문의의 답변 상황을 확인할 수 있습니다.</p>
                                </div>

                                <div class="search-area">
                                    <p>내 분실물 게시글 총<c:choose>
											<c:when test="${not empty lostUserList.userLostCount}">
												<span>${lostUserList.userLostCount}</span>
											</c:when>
											<c:otherwise>
												<span>0</span>
											</c:otherwise>
										</c:choose>
										건
									</p>
									
								</div>

								<div class="table-wrap">
									<table>

										<thead>
											<th>극장</th>
											<th>내용</th>
											<th>등록일</th>
											<th>조회수</th>
										</thead>
										<tbody>

											<c:choose>
												<c:when test="${empty lostUserList.lostList}">
													<tr class="row">
														<td colspan="3">게시글이 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="lostUserList" items="${lostUserList.lostList}"
														varStatus="loop">
														<c:if test="${loop.index < 10}">
															<tr class="row">
																<td class="countRow">${lostUserList.losts.lostLocation}</td>
																<td><a href="${contextPath}/myPage/myLostDetail/${lostUserList.losts.lostNo}?cp=${param.cp}"
																	id="mtmList_pass"> ${lostUserList.losts.lostTitle} </a>
																	<c:if
																		test="${lostUserList.losts.lostRepSt == 'Y'}"><span class="replyComplete">.... [ 답변완료 ]</span>
																	</c:if>	
																</td>
																<td>${lostUserList.losts.lostRepDate}</td>
																<td>${lostUserList.losts.lostView}</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>

										</tbody>

									</table>

									<div>
											<a href="${contextPath}/helpDesk/lost_List">고객센터 가기</a>
									</div>
									<!-- 10개씩 -->
									<div class="page_Nation">
										<c:set var="url" value="?cp=" />
										<c:set var="pagination" value="${lostUserList['pagination']}" />
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
				</div>
			</section>
		</main>
	</div>
    
    <!-- event-wrap -->
    <jsp:include page="/WEB-INF/views/myPage/myPage_randomEvent.jsp" />
    
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/common/header.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_swiper.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_myLost.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_randomEvent.js"></script>
    
	<!-- <script>
	
		
		const param = "${param.cp}";
		console.log(param
				+ "+++++++++++++++++++++++++++++++++++++++++++++++++++++");

		const userLostCount = "${lostUserList.pagination.listCount}";
		console.log(userLostCount
				+ "+++++++++++++++++++++++++++++++++++++++++++++++++++++");
	</script> -->

</body>

</html>