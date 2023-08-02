<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<div class="event-wrap">
	<div>
		<div class="event-title">
			<a href="${contextPath}/eventList/detail_List">EVENT</a>
			<div>
				<a class="moveBtn" href="${contextPath}/eventList/detail_List">전체보기</a>
			</div>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="event" items="${getEvnetList['getEvnetList']}"
					varStatus="status">
					<c:choose>
						<c:when test="${event['eventStatus'] ne 'N'}">
							<input type="hidden" class="eventNo" value="${event['eventNo']}" />
							<div class="swiper-slide">
								<a
									href="${contextPath}/eventList/detail_List/introduce/${event['eventNo']}">
									<img src="${event['eventImg']}" alt=""
									onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
									<strong>${event['eventTitle']}</strong> <span>${event['eventStart']}&nbsp;~&nbsp;
										${event['eventEnd']}</span>
								</a>
							</div>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</c:forEach>

			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
</div>
