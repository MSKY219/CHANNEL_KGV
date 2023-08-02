<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>

                    <header>

                        <section>
                            <div class="logo-section">
                                <div>
                                    <a href="#"><img src="" alt="암거나박아요"></a>
                                </div>
                                <span>KHTHEATER</span>
                            </div>

                            <div class="memberInfo_wrap">
                                <ul>

                                    <div>
                                        <img src="" alt="">
                                    </div>

                                    <li>
                                        <a href="${contextPath}/user/login">
                                            <span><i class="fa-solid fa-lock"></i></span>
                                            <span>로그인</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${contextPath}/signUp/signUp_sns">
                                            <span><i class="fa-regular fa-user"></i></span>
                                            <span>회원가입</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${contextPath}/myPage/info">
                                            <span><i class="fa-solid fa-headset"></i></span>
                                            <span>MY KGV</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span><i class="fa-solid fa-headset"></i></span>
                                            <span>고객센터</span>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </section>

                        <!-- nav bar-->
                        <nav>
                            <div>
                                <ul>
                                    <li class="navBar"><a href="#">영화</a>
                                        <ul class="menuBar" style="display:none">
                                            <li><a href="">무비 차트</a></li>
                                        </ul>
                                    </li>
                                    <li class="navBar"><a href="#">상영관</a>
                                        <ul class="menuBar" style="display:none">
                                            <li><a href="">지역별</a></li>
                                            <li><a href="">특별관</a></li>
                                        </ul>
                                    </li>
                                    <li class="navBar"><a href="#">예매</a>
                                        <ul class="menuBar" style="display:none">
                                            <li><a href="">빠른 예매</a></li>
                                        </ul>
                                    </li>

                                    <li class="navBar"><a href="#">이벤트</a>
                                        <ul class="menuBar" style="display:none">
                                            <li><a href="">진행중 이벤트</a></li>
                                            <li><a href="">지난 이벤트</a></li>
                                            <li><a href="">당첨자 발표</a></li>
                                        </ul>
                                    </li>
                                    <li class="navBar"><a href="#">스토어</a></li>
                                    <li class="navBar"><a href="#">혜택</a>
                                        <ul class="menuBar" style="display:none">
                                            <li><a href="">멤버쉽</a></li>
                                            <li><a href="">제휴/할인</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="dummy" style="display:none"></div>
                                <div>
                                    <form action="">

                                        <input type="text" placeholder="오늘의 영화를 찾아보세용">
                                        <button><i class="fa-solid fa-magnifying-glass"></i></button>
                                    </form>
                                </div>

                            </div>

                        </nav>
                    </header>