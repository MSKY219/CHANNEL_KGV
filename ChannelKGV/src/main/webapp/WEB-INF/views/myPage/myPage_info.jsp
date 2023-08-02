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
    <title>개인정보 수정</title>

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
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage_info.css">
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
                                <h2>개인정보 수정</h2>

                            </div>
                            <form action="info" method="POST" name="myPage-form" class="myPage-form"
                                onsubmit="return infoValidate()">
                                <div class="myPage-info-frame">
                                    <label>닉네임</label>
                                    <input type="text" name="updateNick" id="userNick" value="${loginUser.userNick}"
                                        maxlength="10" placeholder="영어/숫자/한글 2~10글자 사이로 입력하세요.">
                                </div>
                                <div class="myPage-info-frame">
                                    <label>연락처</label>
                                    <input type="text" name="updateTel" id="userTel" value="${loginUser.userTel}"
                                        maxlength="11" placeholder="(- 제외) 전화번호를 입력하세요.">
                                </div>

                                <!-- 주소 --> <!--  fn:split(문자열, '구분자')  -->
								<c:set var="addr" value="${fn:split(loginUser.userAddr, ',,')}"  />
								
                                <div class="myPage-info-addr-frame">
                                    <label>주 소</label>
                                    <div>
                                        <input type="text" name="updateAddr" id="postcode" value="${addr[0]}"
                                            maxlength="6" readonly>
                                        <button type="button" id="info-address-btn"
                                            onclick="return execDaumPostcode()">검색</button>
                                    </div>
                                </div>
                                <div class="myPage-info-addr-frame">
                                    <input type="text" name="updateAddr" id="address" value="${addr[1]}" readonly> 
                                </div>
                                <div class="myPage-info-addr-frame">
                                    <input type="text" name="updateAddr" id="detailAddress" value="${addr[2]}">
                                </div>

                                <div class="update-btn-area">
                                    <button id="info-update-btn" class="info-update-btn">수정하기</button>
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
<!-- 
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="close-button">&times;</div>
            <iframe src="../login/login.html" frameborder="0" width="500px" height="500px"></iframe>
        </div>
    </div>
 -->
	<%-- 다음 주소 API --%>
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:11;-webkit-overflow-scrolling:touch;">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script src="${contextPath}/resources/js/common/header.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_swiper.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_main.js"></script>
    <script src="${contextPath}/resources/js/myPage/myPage_randomEvent.js"></script>
</body>

</html>