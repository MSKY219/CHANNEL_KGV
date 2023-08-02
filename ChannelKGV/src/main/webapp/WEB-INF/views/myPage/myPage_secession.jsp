<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!-- 최신화 종료 건들일없음 -->

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>

<script src="https://kit.fontawesome.com/dc6e43e0ad.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/dc6e43e0ad.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/outline.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/myPage/myPage_aSide.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/myPage/myPage_secession.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/myPage/myPage_randomEvent.css">

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
							<!-- 요기에 이제 필요 폼들 추가해야함 -->
							<div class="main-content-wrap">
								<h2>회원탈퇴</h2>

							</div>
							<form action="secession" method="POST" name="myPage-form"
								onsubmit="return secessionValidate()">

								<div class="myPage-info-frame">
									<label>비밀번호</label> <input type="password" name="userPw"
										id="userPw" maxlength="30" placeholder="비밀번호">
								</div>
								<div class="agree-form">
									<div class="agree-title">
										<label>회원 탈퇴 약관</label>
									</div>

									<pre id="secession-terms" class="secession-terms">

            제1조
            이 약관은 샘플 약관입니다.
            
            ① 약관 내용 1
            
            ② 약관 내용 2
            
            ③ 약관 내용 3
            
            ④ 약관 내용 4
            
            
            제2조
            이 약관은 샘플 약관입니다.
            
            ① 약관 내용 1
            
            ② 약관 내용 2
            
            ③ 약관 내용 3
            
            ④ 약관 내용 4
            
                                    </pre>

									<div class="agree-title">
										<label for="agree"><input type="checkbox" name="agree"
											id="agree">위 약관에 동의합니다.</label>
									</div>
								</div>

								<div class="update-btn-area">
									<button id="info-update-btn" class="info-update-btn">회원
										탈퇴</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>

	
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- <div id="myModal" class="modal">
		<div class="modal-content">
			<div class="close-button">&times;</div>
			<iframe src="../login/login.html" frameborder="0" width="500px"
				height="500px"></iframe>
		</div>
	</div> -->

	<script src="${contextPath}/resources/js/common/header.js"></script>
	<script src="${contextPath}/resources/js/myPage/myPage_swiper.js"></script>
	<script src="${contextPath}/resources/js/myPage/myPage_main.js"></script>
	<script src="${contextPath}/resources/js/myPage/myPage_randomEvent.js"></script>
</body>

</html>