<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<div id="header_Wrapper">
	<div class="header_Container">
		<div class="header_loge_Area">
			<span>어서오세요!&nbsp;</span> <span>${loginUser.userName}&nbsp;</span> <span>님!</span>
		</div>
		<button class="header_logout_Area">
			<a class="returnMain" href="${contextPath}/">나가기</a>
		</button>
	</div>
</div>