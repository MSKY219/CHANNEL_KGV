<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>스토어</title>

                        <!-- fontawesome -->
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
                            integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
                            crossorigin="anonymous" referrerpolicy="no-referrer" />

                        <!-- jQuery 라이브러리 추가(CDN) -->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>


                        <link rel="stylesheet" href="${contextPath}/resources/css/store/storeMain.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

                    </head>

                    <body>
                        <div id="wrap">

                            <!-- header -->
                            <jsp:include page="/WEB-INF/views/common/header.jsp" />

                            <main>

                                <div>
                                    <img src="${contextPath}/resources/images/storeimg/02.jpg" alt="">
                                </div>

                                <div id="wrapper">
                                    <div><span>스토어</span></div>


                                    <div class="tab-list ">
                                        <ul>

                                            <li><a href="#none" id="storeTab_1" class="storeTab clicked"
                                                    title="전체탭">전체</a>
                                            </li>

                                            <li><a href="#none" id="storeTab_2" class="storeTab" title="음료탭">음료</a></li>

                                            <li><a href="#none" id="storeTab_3" class="storeTab" title="팝콘탭">팝콘</a></li>

                                            <li><a href="#none" id="storeTab_4" class="storeTab" title="스낵탭">스낵</a></li>

                                            <li><a href="#none" id="storeTab_5" class="storeTab" title="티켓탭">티켓할인권</a>
                                            </li>

                                        </ul>
                                    </div>

                                    <div>

                                        <h3 class="store_h3 store_drink">음료</h3>
                                        <ul class="store_ul store_drink">





                                            <c:forEach var="store" items="${storeMap['storeList']}">
                                                <c:choose>
                                                    <c:when test="${store.storeCategory eq '음료'}">
                                                        <li class="" onmouseenter="zoomIn(event)"
                                                            onmouseleave="zoomOut(event)">
                                                            <a href="${contextPath}/store/storeMain/store_detail/${store['storeNo']}"
                                                                title="${store.storeName}">
                                                                <div class="img">
                                                                    <img src="${store['storeImage']}">
                                                                </div>
                                                                <div class="info">
                                                                    <div class="tit">
                                                                        <h4>${store.storeName}</h4>
                                                                        <p>${store.storeDesc}</p>
                                                                    </div>
                                                                    <div class="price">
                                                                        <p class="sale">
                                                                            <em>
                                                                                <fmt:formatNumber
                                                                                    value="${store.storePrice}"
                                                                                    pattern="#,###" />
                                                                            </em>
                                                                            <span>원</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- 다른 카테고리에 대한 처리를 필요에 따라 추가하세요 -->
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>







                                        </ul>

                                        <h3 class="store_h3 store_popcorn">팝콘</h3>
                                        <ul class="store_ul store_popcorn">




                                            <c:forEach var="store" items="${storeMap['storeList']}">
                                                <c:choose>
                                                    <c:when test="${store.storeCategory eq '팝콘'}">
                                                        <li class="" onmouseenter="zoomIn(event)"
                                                            onmouseleave="zoomOut(event)">
                                                            <a href="${contextPath}/store/storeMain/store_detail/${store['storeNo']}"
                                                                title="${store.storeName}">
                                                                <div class="img">
                                                                    <img src="${store['storeImage']}">
                                                                </div>
                                                                <div class="info">
                                                                    <div class="tit">
                                                                        <h4>${store.storeName}</h4>
                                                                        <p>${store.storeDesc}</p>
                                                                    </div>
                                                                    <div class="price">
                                                                        <p class="sale">
                                                                            <em>
                                                                                <fmt:formatNumber
                                                                                    value="${store.storePrice}"
                                                                                    pattern="#,###" />
                                                                            </em>
                                                                            <span>원</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- 다른 카테고리에 대한 처리를 필요에 따라 추가하세요 -->
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>







                                        </ul>



                                        <h3 class="store_h3 store_snack">스낵</h3>
                                        <ul class="store_ul store_snack">



                                            <c:forEach var="store" items="${storeMap['storeList']}">
                                                <c:choose>
                                                    <c:when test="${store.storeCategory eq '스낵'}">
                                                        <li class="" onmouseenter="zoomIn(event)"
                                                            onmouseleave="zoomOut(event)">
                                                            <a href="${contextPath}/store/storeMain/store_detail/${store['storeNo']}"
                                                                title="${store.storeName}">
                                                                <div class="img">
                                                                    <img src="${store['storeImage']}">
                                                                </div>
                                                                <div class="info">
                                                                    <div class="tit">
                                                                        <h4>${store.storeName}</h4>
                                                                        <p>${store.storeDesc}</p>
                                                                    </div>
                                                                    <div class="price">
                                                                        <p class="sale">
                                                                            <em>
                                                                                <fmt:formatNumber
                                                                                    value="${store.storePrice}"
                                                                                    pattern="#,###" />
                                                                            </em>
                                                                            <span>원</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- 다른 카테고리에 대한 처리를 필요에 따라 추가하세요 -->
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>





                                        </ul>


                                        <h3 class="store_h3 store_ticket">할인권</h3>
                                        <ul class="store_ul store_ticket">



                                            <c:forEach var="store" items="${storeMap['storeList']}">
                                                <c:choose>
                                                    <c:when test="${store.storeCategory eq '티켓'}">
                                                        <li class="" onmouseenter="zoomIn(event)"
                                                            onmouseleave="zoomOut(event)">
                                                            <a href="${contextPath}/store/storeMain/store_detail/${store['storeNo']}"
                                                                title="${store.storeName}">
                                                                <div class="img">
                                                                    <img src="${store['storeImage']}">
                                                                </div>
                                                                <div class="info">
                                                                    <div class="tit">
                                                                        <h4>${store.storeName}</h4>
                                                                        <p>${store.storeDesc}</p>
                                                                    </div>
                                                                    <div class="price">
                                                                        <p class="sale">
                                                                            <em>
                                                                                <fmt:formatNumber
                                                                                    value="${store.storePrice}"
                                                                                    pattern="#,###" />
                                                                            </em>
                                                                            <span>원</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- 다른 카테고리에 대한 처리를 필요에 따라 추가하세요 -->
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>





                                        </ul>


                                    </div>

                                </div>

                            </main>
                        </div>

                        <!-- footer -->
                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


                        <script src="${contextPath}/resources/js/store/storeMain.js"></script>

                    </body>

                    </html>