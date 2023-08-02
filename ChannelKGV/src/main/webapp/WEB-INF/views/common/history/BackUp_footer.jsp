<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>

                    <footer>

                        <section>

                            <div>
                                <ul>
                                    <li><a href="#">회사소개</a></li><span>|</span>
                                    <li><a href="#">조원소개</a></li><span>|</span>
                                    <li><a href="#">이용약관</a></li><span>|</span>
                                    <li><a href="#">개인정보처리방침</a></li><span>|</span>
                                    <li><a href="${contextPath}/manager/main">편성기준</a></li>
                                </ul>

                            </div>

                            <div>
                                <span>Channel_KGV | 사업자등록번호: 110-372-404490(신한) </span>
                                <span>조장 : 김민수 | 조원 : 권지훈 / 김윤석 / 이도근 / 정지민 / 최영탁</span>
                                <span>강남상영관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, D Class
                                </span>
                                <span>
                                    Copyright © 2023-2023 Channel_KGV All Right Reserved
                                </span>
                            </div>

                        </section>

                    </footer>

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

                        <c:if test="${ !empty message }">
                            <script>
                                alert("${message}");
        						// EL 작성 시 scope를 지정하지 않으면
        						// page -> request -> session -> application 순서로 검색하여
        						// 일치하는 속성이 있으면 출력
                            </script>
                        </c:if>