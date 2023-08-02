<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>회원가입 선택 페이지</title>

            <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/signUp/signUp_sns.css">
            <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
                <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

        </head>

        <body>

            <div id="wrap">

                <!-- header -->
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <main>
                    <!-- 여기서 부터 작업하세요. -->


                    <section class="signUp-wrap">
                        <div>
                            <div>
                                <div>
                                    <!-- <img src="../image/pngwing.com.png"> -->
                                    <p>KGV 회원가입</p>

                                    <div>
                                        
                                        <a href="signUp"><button>이메일 회원가입</button></a>
                                        <a><button  onclick="loginWithKakao()" >카카오로 가입하기</button></a>
                                        <a id="loginNaver" href="#">
                                              <img src="${contextPath}/resources/images/logo/btnG_완성형.png" alt="">
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>

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

         <script src="${contextPath}/resources/js/manager/apikey.js"></script>
     

        </body>

        </html>