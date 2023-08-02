<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>1 : 1 문의</title>
			<link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
			<link rel="stylesheet" href="${contextPath}/resources/css/helpDesk/mTm_List.css">
			<link rel="stylesheet" href="${contextPath}/resources/css/common/notice_Aside.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"
				integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		</head>
 
		<body>
			<div id="wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<main>
					<section>

						<jsp:include page="/WEB-INF/views/common/noticeAside.jsp" />

						<div class="container">
							<div>
								<div class="notice-content-wrap">
									<div class="notice-header">
										<h2>1:1 문의</h2>
										<p>문의 사항이 있으실 경우 빠른 시일 내로 답변드리겠습니다.</p>
									</div>

									<div class="search-area">
										<p>
											1:1 문의 게시글 총<span>${userMtmListCount}</span>건
										</p>
									</div>

									<div class="table-wrap">
										<table>

											<thead>
												<th>문의 종류</th>
												<th>내용</th>
												<th>등록일</th>
												<th>조회수</th>
											</thead>
											<tbody>

												<c:choose>
													<c:when test="${empty mtmList.mtmLists}">
														<tr class="row">
															<td colspan="3">게시글이 존재하지 않습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach var="userMtmList" items="${mtmList.mtmLists}"
															varStatus="loop">
															<c:if test="${loop.index < 10}">
																<tr class="row">
																	<td class="countRow">[ ${userMtmList.mtmType} ]</td>
																	<c:choose>
																		<c:when test="${userMtmList.mtmPw eq 0}">
																			<td><a href="${contextPath}/helpDesk/checkPw/${userMtmList.mtmNo}?cp=${param.cp}"
																					id="mtmList_pass">${userMtmList.mtmTitle}</a>
																				<c:if
																					test="${userMtmList.mtmRepSt == 'Y'}">
																					<span class="replyComplete">.... [
																						답변완료 ]</span>
																				</c:if>
																			</td>
																		</c:when>
																		<c:when test="${userMtmList.mtmPw eq 1111 and loginUser.userManagerSt eq 'Y'
																		or userMtmList.userNo == loginUser.userNo
																		}">
																			<td><a href="${contextPath}/helpDesk/checkPw/${userMtmList.mtmNo}?cp=${param.cp}"
																					id="mtmList_pass">${userMtmList.mtmTitle}</a>
																				<c:if
																					test="${userMtmList.mtmRepSt == 'Y'}">
																					<span class="replyComplete">.... [
																						답변완료 ]</span>
																				</c:if>
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td><a
																				href="${contextPath}/helpDesk/checkPw/${userMtmList.mtmNo}?cp=${param.cp}"
																				id="mtmList_pass" class="qlrhdro">비공개 글입니다.</a>
																			</td>
																		</c:otherwise>
																	</c:choose>
																	<td>${userMtmList.mtmRegdate}</td>
																	<td>${userMtmList.mtmCount}</td>
																</tr>
															</c:if>
														</c:forEach>
													</c:otherwise>
												</c:choose>

											</tbody>

										</table>

										<div>

											<a href="${contextPath}/helpDesk/mTm_form/${mtmNo}">게시물 등록</a>

										</div>
										<!-- 10개씩 -->
										<div class="page_Nation">
											<c:set var="url" value="?cp=" />
											<c:set var="pagination" value="${mtmList['pagination']}" />
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
					</section>
				</main>

			</div>
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</body>
		<script src="${contextPath}/resources/js/helpDesk/mTm.js"></script>

		</html>