<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>회원가입 페이지</title>


            <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/signUp/signUp.css">

            <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        </head>

        <body>

            <div id="wrap">

                <!-- header -->
                <jsp:include page="/WEB-INF/views/common/header.jsp" />

                <main>
                    <!-- 여기서 부터 작업하세요. -->

                    <section class="signUp-content">



                        <form action="signUp" method="POST" name="signUp-form" onsubmit="return signUpValidate()">

                            <div>회원가입</div>
                            <label for="userEmail">
                                <span class="required">*</span> 아이디(이메일)
                            </label>

                            <div class="signUp-input-area">
                                <input type="text" id="userEmail" name="userEmail" placeholder="아이디(이메일)" maxlength="30"
                                    autocomplete="off" required>


                                <button type="button" id="sendBtn">인증번호 받기</button>
                            </div>

                            <span class="signUp-message" id="emailMessage"></span>



                            <label for="emailCheck">
                                <span class="required">*</span> 인증번호
                            </label>

                            <div class="signUp-input-area">
                                <!-- cNumber -->
                                <input type="text" id="cNumber" name="cNumber" placeholder="인증번호 입력" maxlength="6"
                                    autocomplete="off">

                                <button type="button" id="cBtn">인증하기</button>
                            </div>

                            <!-- 5:00 타이머 -->
                            <span class="signUp-message" id="cMessage"></span>



                            <label for="userPw">
                                <span class="required">*</span> 비밀번호
                            </label>

                            <div class="signUp-input-area">
                                <input type="password" id="userPw" name="userPw" placeholder="비밀번호" maxlength="30">
                            </div>

                            <div class="signUp-input-area">
                                <input type="password" id="userPwConfirm" placeholder="비밀번호 확인" maxlength="30">
                            </div>

                            <span class="signUp-message" id="pwMessage"></span>




                            <label for="userNick">
                                <span class="required">*</span> 닉네임
                            </label>

                            <div class="signUp-input-area">
                                <input type="text" id="userNick" name="userNick" placeholder="닉네임" maxlength="10">
                            </div>

                            <span class="signUp-message" id="nicknameMessage"></span>



                            <label for="userName">
                                <span class="required">*</span> 이름
                            </label>

                            <div class="signUp-input-area">
                                <input type="text" id="userName" name="userName" placeholder="이름" maxlength="10">

                            </div>

                            <span class="signUp-message" id="nameMessage"></span>



                            <label for="userBirth">
                                <span class="required">*</span> 생년월일
                            </label>

                            <div class="signUp-input-area">

                                <input type="text" id="userBirth" name="userBirth" placeholder="생년월일 8자리" maxlength="8">
                            </div>



                            <span class="error_box" id="birMessage"></span>

                            <label for="userGender">
                                <span class="required">*</span> 성별
                            </label>

                            <div class="signUp-input-area">
                                <select id="userGender" name="userGender" class="sel" aria-label="성별">
                                    <option value="" selected="">성별</option>
                                    <option value="M">남자</option>
                                    <option value="W">여자</option>
                                    <option value="U">선택 안함</option>
                                </select>

                            </div>

                            <span class="signUp-message" id="selMessage"></span>





                            <label for="userTel">
                                <span class="required">*</span> 연락처
                            </label>

                            <div class="signUp-input-area">
                                <input type="text" id="userTel" name="userTel" placeholder="(- 없이 숫자만 입력)"
                                    maxlength="11">
                            </div>

                            <span class="signUp-message" id="telMessage"></span>



                            <label for="userAddr">
                                주소
                            </label>

                            <div class="signUp-input-area">
                                <input type="text" id="sample4_postcode" name="userAddr" placeholder="우편번호"
                                    maxlength="6" readonly>

                                <button type="button" onclick="return sample4_execDaumPostcode()">검색</button>
                            </div>

                            <div class="signUp-input-area">
                                <input type="text" id="sample4_roadAddress" name="userAddr" placeholder="도로명주소"
                                    readonly>
                            </div>

                            <div class="signUp-input-area">
                                <input type="text" id="sample4_detailAddress" name="userAddr" placeholder="상세주소"
                                    readonly>
                            </div>

                            <button type="submit" id="signUp-btn">가입하기</button>

                        </form>

                    </section>









                    <!-- 여기까지 작업하세요. -->
                </main>

            </div>

            <!-- footer -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />



            <!--
     <%-- session에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>
             <c:if test="${ !empty sessionScope.message }">
                 <script>
                     alert("${message}");
                     // EL 작성 시 scope를 지정하지 않으면
                     // page -> request -> session -> application 순서로 검색하여
                     // 일치하는 속성이 있으면 출력
                 </script>
 
                 <%-- message 1회 출력 후 session에서 제거 --%>
                 <c:remove var="message" scope="session" />
             </c:if>
             -->

            <!-- jQuery 라이브러리 추가(CDN) -->

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

            <script src="${contextPath}/resources/js/signUp/signUp.js"></script>

        </body>

        </html>