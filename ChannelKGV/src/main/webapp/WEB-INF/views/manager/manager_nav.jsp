<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ page session="false" %>
					<div class="nav_Title">
						<a id="mainLogo" href="${contextPath}">
							<img src="${contextPath}/resources/images/logo/logo.png" alt="logo">
						</a>
					</div>
					<nav>
						<ul class="nav_Slide">
							<a class="title_move" href="${contextPath}/manager/main" value="">
								<li class="slide_Title">
									<div class="slide_Left_Icon">
										<i class="fa-sharp fa-solid fa-house"></i>
									</div> <span>관리자 메인</span>
								</li>
							</a>
							<a class="title_move" href="${contextPath}/manager/member">
								<li class="slide_Title">
									<div class="slide_Left_Icon">
										<i class="fa-solid fa-user"></i>
									</div> <span>회원 리스트</span>
								</li>
							</a>
							<a class="title_move" href="${contextPath}/manager/book">
								<li class="slide_Title">
									<div class="slide_Left_Icon">
										<i class="fa-solid fa-user"></i>
									</div> <span>예매 리스트</span>
								</li>
							</a>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-solid fa-headset"></i>
									</div>
									<span class="slide_Inner_Title">문의</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/ask_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>1 : 1 문의 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/lost_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>분실물 목록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-brands fa-youtube"></i>
									</div>
									<span class="slide_Inner_Title">영화</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/movie_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>영화 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/movie_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>영화 등록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/play_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>상영시간 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/play_end">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>끝난 상영시간 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/play_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>상영시간 등록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-brands fa-youtube"></i>
									</div>
									<span class="slide_Inner_Title">극장</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/manager_cinema_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>극장 등록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/manager_cinema_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>극장 목록</span>
											</div>
										</li>
									</a>

									<a href="${contextPath}/manager/manager_cinema_price">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>가격 등록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/manager_cinemaPrice_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>가격 목록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-sharp fa-regular fa-calendar"></i>
									</div>
									<span class="slide_Inner_Title">메인배너</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/banner_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>메인배너 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/banner_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>메인배너 등록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-sharp fa-regular fa-calendar"></i>
									</div>
									<span class="slide_Inner_Title">이벤트</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/event_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>이벤트 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/event_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>이벤트 등록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-sharp fa-solid fa-circle-exclamation"></i>
									</div>
									<span class="slide_Inner_Title">공지사항</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/notice_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>공지사항 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/notice_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>공지사항 등록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-sharp fa-solid fa-store"></i>
									</div>
									<span class="slide_Inner_Title">스토어</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/store_buylist">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>스토어 구매 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/store_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>스토어 물품 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/store_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>스토어 물품 등록</span>
											</div>
										</li>
									</a>

								</ul>
							</li>
							<li class="slide_Content">
								<div class="slide_Wrapper">
									<div class="slide_Left_Icon">
										<i class="fa-sharp fa-solid fa-circle-exclamation"></i>
									</div>
									<span class="slide_Inner_Title">혜택관리</span>
									<div class="slide_Right_Icon">
										<i class="fa-solid fa-caret-down"></i>
									</div>
								</div>
								<ul class="slide_Down_items">
									<a href="${contextPath}/manager/benefits_list">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>혜택 목록</span>
											</div>
										</li>
									</a>
									<a href="${contextPath}/manager/benefits_add">
										<li>
											<div class="inner_align">
												<div class="inner_Left_Icon">
													<i class="fa-solid fa-play fa-2xs"></i>
												</div>
												<span>혜택 등록</span>
											</div>
										</li>
									</a>
								</ul>
							</li>
						</ul>
					</nav>


					<script src="${contextPath}/resources/js/manager/manager_select.js"></script>