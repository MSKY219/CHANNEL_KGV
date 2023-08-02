<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>

                    <header>
                        <!-- 헤더 윗쪽 섹션 -->
                        <section>

                            <div>
                                <div>
                                    <!-- 
                    contextpath 지정 必
                    이미지 태그 속 로고위치 제대로 작성
                 -->
                                    <!-- <a href="${contextPath}">
        <img src="${contextPath}/resources/images/logo.jpg" id="home-logo">
    </a> -->
                                    <a href="#"><img src="../images/logo3.png" alt="로고 이미지 삽입 w160 h70 "></a>
                                </div>
                                <div>
                                    <span>K H T H E A T E R</span>
                                </div>
                            </div>

                            <div>
                                <div> <a href="#"><img src="" alt="광고 이미지삽입width:200px height:100px"></a></div>

                                <ul>
                                    <li>
                                        <a href="${contextPath}/user/login">
                                            <span><i class="fa-solid fa-lock"></i></span>
                                            <p>SIGN IN</p>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="${contextPath}/eee/signUp_sns">
                                            <span><i class="fa-solid fa-lock"></i></span>
                                            <p>추가버튼</p>
                                        </a>
                                    </li>



                                    <li>


                                        <a href="${contextPath}/myPage/info">
                                            <span><i class="fa-regular fa-user"></i></span>
                                            <p>MY PAGE</p>
                                        </a>


                                    </li>

                                    <li>
                                        <a href="#">
                                            <span><i class="fa-solid fa-headset"></i></span>
                                            <p>HELP</p>
                                        </a>
                                    </li>

                                </ul>
                            </div>

                        </section>

                        <!-- nav bar-->
                        <nav>

                            <div>
                                <ul>
                                    <li><a href="#">영화</a></li>
                                    <li><a href="#">극장</a></li>
                                    <li><a href="#">예매</a></li>
                                    <li><a href="#">스토어</a></li>
                                    <li><a href="#">이벤트</a></li>
                                    <li><a href="#">혜택</a></li>
                                </ul>

                                <div>
                                    <form action="">

                                        <input type="text" placeholder="오늘의 영화를 찾아보세용">
                                        <button><i class="fa-solid fa-magnifying-glass"></i></button>
                                    </form>
                                </div>

                            </div>

                        </nav>

                    </header>