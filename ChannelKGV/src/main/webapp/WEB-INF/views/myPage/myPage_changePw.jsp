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
    <title>비밀번호 변경</title>

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
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_changePw.css">
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
                            <!-- 요기에 이제 필요 폼들 추가해야함 -->
                            <div class="main-content-wrap">
                                <h2>비밀번호 변경</h2>

                            </div>
                            <form action="changePw" method="POST" name="myPage-form"
                                onsubmit="return changePwValidate()">
                                <div class="myPage-info-frame">
                                    <label>현재 비밀번호</label>
                                    <input type="password" name="currentPw" id="currentPw" maxlength="30"
                                        placeholder="비밀번호">
                                </div>

                                <div class="myPage-info-frame">
                                    <label>새 비밀번호</label>
                                    <input type="password" name="newPw" maxlength="30" placeholder="새 비밀번호">
                                </div>

                                <div class="myPage-info-frame">
                                    <label>비밀번호 확인</label>
                                    <input type="password" name="newPwConfirm" maxlength="30" placeholder="비밀번호 확인">
                                </div>
                                <div class="update-btn-area">
                                    <button id="info-update-btn" class="info-update-btn">변경하기</button>
                                </div>
                            </form>
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
    <script src="${contextPath}/resources/js/myPage/myPage_main.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_randomEvent.js"></script>
</body>

</html>