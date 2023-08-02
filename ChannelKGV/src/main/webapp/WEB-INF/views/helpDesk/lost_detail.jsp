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
						<title>분실물 문의</title>

						<script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

						<!-- jQuery 라이브러리 추가(CDN) -->
						<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

						<script src="/ckeditor5/build/ckeditor.js"></script>

						<link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/helpDesk/lost_detail.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/common/notice_Aside.css">



					</head>

					<body>
						<div id="wrap">
							<jsp:include page="/WEB-INF/views/common/header.jsp" />

							<main>
								<section>

									<jsp:include page="/WEB-INF/views/common/noticeAside.jsp" />

									<div class="container">

										<div class="content-wrap">

											<h2>분실물 문의</h2>

											<div class="notice-contents">

												<div>
													<span>${lostdetail.lostTitle}</span>
												</div>

												<div>
													<span>${lostdetail.lostLocation} <span> | </span> <span>${lostdetail.lostItem}</span> </span>
													<span><span>${lostdetail.lostWriter}</span> <span>|</span>
														<span>${lostdetail.lostDate} </span></span>
												</div><div class="contentText-wrap"><div><c:out value="${lostdetail.lostContent}" escapeXml="true" /></div></div>

											</div>
										</div>
										<div class="imageArea">
											<c:choose>
												<c:when test="${not empty lostdetail.lostFile}">
													<img src="${lostdetail.lostFile}" onclick="showImage('${lostdetail.lostFile}')">
												</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose>
										</div>

										<c:if test="${loginUser.userNo != null && loginUser.userManagerSt == 'Y' && lostdetail.lostRepSt == 'N'}">
											<div class="reply_wrap btn_wraper">
												<textarea id="contentTextarea"></textarea>
												<button data-lostno="${lostdetail.lostNo}" id="reply_writeBtn">
													<a>등록하기</a>
												</button>
											</div>
										</c:if>

										<c:if test="${lostdetail.lostRepSt == 'Y'}">
											<div class="reply">
												<div class="reply-info">
													<p>${lostdetail.lostWriter}님답변드립니다.</p>
													<span class="reply-writer-info"><span>${lostdetail.lostRepWriter}</span><span>|</span><span>${lostdetail.lostRepDate}</span></span>
												</div>
												<div>
													<div class="reply-content"><c:out value="${lostdetail.lostRepContent}" escapeXml="true" /></div>
												</div>
											</div>
											<c:if test="${loginUser.userNo != null && loginUser.userManagerSt == 'Y'}">
												<button class="reply_delete" data-lostno="${lostdetail.lostNo}" id="reply_deleteBtn">
													<a>답변 삭제하기</a>
												</button>
											</c:if>
										</c:if>

										
										<div class="btn_wraper">
											<c:if test="${not empty loginUser.userNo and loginUser.userManagerSt == 'Y' or loginUser.userNo == lostdetail.userNo}">
												<button data-lostno="${lostdetail.lostNo}" id="updateLost">
													<input type="hidden" id="cp" value="${cp}">
													<a>수정</a>
												</button>
											</c:if>

											<c:if test="${not empty loginUser.userNo and loginUser.userManagerSt == 'Y' or loginUser.userNo == lostdetail.userNo}">
												<button id="deleteLost" data-lostno="${lostdetail.lostNo}">
													<input type="hidden" id="cp" value="${cp}">
													<a>삭제</a>
												</button>
											</c:if>

											<button class="goback">
												<a href="${contextPath}/helpDesk/lost_List?cp=${param.cp}">목록으로</a>
											</button>

										</div>

									</div>










								</section>
							</main>

						</div>
						<jsp:include page="/WEB-INF/views/common/footer.jsp" />


						<script src="${contextPath}/resources/js/helpDesk/lost.js"></script>

					</body>

					</html>