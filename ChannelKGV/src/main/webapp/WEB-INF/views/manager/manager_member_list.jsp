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
						<title>회원 리스트</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/manager/manager_member_list.css">
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
													<span>회원목록</span>
													<form class="search_Box">
														<select id="selectBox" name="searchType">
															<option value="USER_EMAIL">아이디</option>
															<option value="USER_NAME">이름</option>
															<option value="USER_NICKNAME">닉네임</option>
															<option value="USER_TEL">연락처</option>
															<option value="USER_ADDR">주소</option>
															<option value="USER_BIRTH">생년월일</option>
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
														<th>번호</th>
														<th>아이디</th>
														<th>이름</th>
														<th>닉네임</th>
														<th>연락처</th>
														<th>주소</th>
														<th>생년월일</th>
														<th>성별</th>
														<th>가입일</th>
														<th>탈퇴일</th>
														<th>상태</th>
														<th>보유 포인트</th>
														<th>SNS 가입</th>
														<th>관리자</th>
														<th>이용제한</th>
													</tr>
													<c:forEach var="getUser" items="${getUserList['userList']}">
														<tr>
															<td>${getUser['userNo']}</td>
															<td>${getUser['userEmail']}</td>
															<td>${getUser['userName']}</td>
															<td>${getUser['userNick']}</td>
															<td>${getUser['userTel']}</td>
															<c:choose>
																<c:when test="${not empty getUser['userAddr']}">
																	<td>${getUser['userAddr']}</td>
																</c:when>
																<c:otherwise>
																	<td>미등록</td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${not empty getUser['userBirth']}">
																	<td>${getUser['userBirth']}</td>
																</c:when>
																<c:otherwise>
																	<td>미등록</td>
																</c:otherwise>
															</c:choose>
															<td>${getUser['userGender']}</td>
															<td>${getUser['userRegDate']}</td>
															<c:choose>
																<c:when test="${not empty getUser['userDelete']}">
																	<td>${getUser['userDelete']}</td>
																</c:when>
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>
															<td>${getUser['userSt']}</td>
															<td>${getUser['userPoint']}</td>
															<td>${getUser['userSns']}</td>
															<c:choose>
																<c:when test="${getUser['userManagerSt'] == 'N'}">
																	<td><select class="Is_Manager" data-id="${getUser['userEmail']}">
																			<option value="N" selected>N</option>
																			<option value="Y">Y</option>
																		</select></td>
																</c:when>
																<c:otherwise>
																	<td><select class="Is_Manager" data-id="${getUser['userEmail']}">
																			<option value="N">N</option>
																			<option value="Y" selected>Y</option>
																		</select></td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${getUser['userBlock'] == 'N'}">
																	<td><select class="Is_Blocked" data-id="${getUser['userEmail']}">
																			<option value="N" selected>N</option>
																			<option value="Y">Y</option>
																		</select></td>
																</c:when>
																<c:otherwise>
																	<td><select class="Is_Blocked" data-id="${getUser['userEmail']}">
																			<option value="N">N</option>
																			<option value="Y" selected>Y</option>
																		</select></td>
																</c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</table>
												<div class="page_Nation">
													<c:set var="url" value="?searchType=${param.searchType}&searchContent=${param.searchContent}&cp=" />
													<c:set var="pagination" value="${getUserList['pagination']}" />
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


						<script src="${contextPath}/resources/js/manager/manager_member_list.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_inner_Header.js"></script>
						<script src="${contextPath}/resources/js/manager/manager_nav.js"></script>
					</body>

					</html>