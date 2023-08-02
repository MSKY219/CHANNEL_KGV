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
                        <title> ${eventDetail['eventTitle']} </title>
                        <link rel="stylesheet" href="${contextPath}/resources/css/movieList/event_introduce.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
                        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                        <script src="${contextPath}/resources/js/event/event.js"></script>
                    </head>

                    <body>

                        <jsp:include page="/WEB-INF/views/common/header.jsp" />

                        <main>
                            <div class="main_Wrapper">
                                <div id="info_Section">
                                    <div id="items">
                                        <div id="titleArea">
                                            <span>${eventDetail['eventTitle']}</span>
                                        </div>
                                        <table id="dateArea">
                                            <tr id="regDate">
                                                <th >
                                                    등록일&nbsp;&nbsp;&nbsp;|
                                                </th>
                                                <td class="regdate">
                                                    ${eventDetail['eventReg']}
                                                </td>
                                            </tr>
                                            <tr id="event_time">
                                                <th>
                                                    이벤트 기간&nbsp;&nbsp;&nbsp;|
                                                </th>
                                                <td>
                                                    ${eventDetail['eventStart']}
                                                    &nbsp;~&nbsp;
                                                    ${eventDetail['eventEnd']}
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div id="content_Section">
                                    <c:out value="${eventDetail['eventContent']}" escapeXml="false" />
                                </div>

                                <a id="returnBtn" value="목록으로">
                                    목록으로
                                </a>


                            </div>
                        </main>


                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

                        </div>


                        </div>
                    </body>

                    </html>