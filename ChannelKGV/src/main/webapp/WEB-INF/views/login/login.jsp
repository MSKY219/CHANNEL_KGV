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
						<title>로그인 페이지</title>

						<link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
						<link rel="stylesheet" href="${contextPath}/resources/css/login/login.css">

						<script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

						<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
						<script src="https://code.jquery.com/jquery-3.6.0.min.js"
							integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
							crossorigin="anonymous"></script>
						<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"
							charset="utf-8"></script>


					</head>

					<body>
						<div id="wrap">
							<!-- header -->
							<jsp:include page="/WEB-INF/views/common/header.jsp" />

							<main>
								<!-- 여기서 부터 작업하세요. -->
								<div>
									<div>
										<!-- 프레임 -->
										<div>

											<!-- 로고 영역 -->
											<div>
												<p>Login</p>
											</div>

											<!-- 로그인 영역 -->
											<div>
												<form action="login" method="POST" onsubmit="return loginValidate();">
													<div>
														<div>
															<div>
																<input type="text" placeholder="아이디" name="userEmail"
																	id="userEmail" value="${cookie.saveId.value}"
																	maxlength="41">
																<input type="password" placeholder="비밀번호" name="userPw"
																	id="userPw" maxlength="41">
																<div class="keep_area">
																	<%-- 쿠키에 saveId가 있는 경우--%>
																		<c:if test="${ !empty cookie.saveId.value}">
																			<%-- chk 변수 생성(page scope)--%>
																				<c:set var="chk" value="checked" />
																		</c:if>
																		<input type="checkbox" name="saveId" ${chk}
																			id="saveId">
																		<label for="saveId" class="bb"></label>
																		<label for="saveId" class="cc">아이디
																			저장</label>
																</div>
															</div>

														</div>

														<div>
															<button id="loginBtn">로그인</button>
														</div>

													</div>
												</form>

											</div>

											<!-- SNS 로그인 -->
											<div class="kakaoLogin">
												<a><button onclick="loginWithKakao()">카카오로 로그인하기</button></a>
											</div>
											<a id="loginNaver" href="#">
												<img src="${contextPath}/resources/images/logo/btnG_완성형.png"
													alt=""></a>

										</div>

										<!-- 하단 버튼 영역 -->
										<ul>
											<li><a href="findPw">비밀번호 찾기</a></li>
											<span>|</span>
											<li><a href="findEmail">아이디 찾기</a></li>
											<span>|</span>
											<li><a href="/movie/signUp/signUp_sns">회원가입</a></li>
										</ul>
									</div>
								</div>
								<!-- 여기까지 작업하세요. -->
							</main>

						</div>

						<!-- footer -->
						<jsp:include page="/WEB-INF/views/common/footer.jsp" />


						<script src="${contextPath}/resources/js/login/login.js"></script>
						<script src="${contextPath}/resources/js/manager/apikey.js"></script>

					</body>

					</html>