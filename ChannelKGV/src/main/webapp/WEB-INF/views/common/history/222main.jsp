<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
    <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

</head>
<body>
    <div id="wrap">
        
        <!-- header -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <main>
            <!-- 첫번째 섹션 거대배너광고 -->
            <section>
                <div>
                    <a href="#"><img src="../images/asdfasdf.jpg" alt="이미지삽입영역 wdith:1120px height:500px 해야합니당."></a>
                    이부분 이미지 슬라이더 iframe
                </div>
            </section>

            <!-- 두번째 라인 5ea ( 영화리스트 목록 ( 카드까지 ) )-->
            <section>
                <div>
                    <div>
                        <div>
                            <a href="#">상영목록</a>
                            <span>|</span>
                            <a href="#">상영예정</a>
                        </div>
                        <div><a href="">전체보기 ></a></div>
                    </div>

                    <!-- 영역 -->
                    <div>
                        <ol>
                            <li>

                                <div>
                                    <span>
                                        1<!-- 숫자 1~20까지 for문돌려서 박아야합니다. -->
                                    </span>
                                    <a href="#"><img src="../imaages/123123.jpg"></a>

                                </div>

                                <div>
                                    <a href=""> <span>영화제목</span></a>
                                    <div>
                                        <p>예매율&nbsp<span>100.0</span>%</p>
                                        <p>개봉일&nbsp<span>2023.01.01</span></p>
                                    </div>
                                </div>

                                <div>
                                    <!-- 1좋아요버튼 -->
                                    <button>0</button>
                                    <button>예매</button>
                                </div>

                            </li>

                            <li>

                                <div>
                                    <span>
                                        2<!-- 숫자 1~20까지 for문돌려서 박아야합니다. -->
                                    </span>
                                    <a href="#"><img src="../imaages/123123.jpg"></a>

                                </div>

                                <div>
                                    <a href=""> <span>영화제목</span></a>
                                    <div>
                                        <p>예매율&nbsp<span>100.0</span>%</p>
                                        <p>개봉일&nbsp<span>2023.01.01</span></p>
                                    </div>
                                </div>

                                <div>
                                    <!-- 1좋아요버튼 -->
                                    <button>0</button>
                                    <button>예매</button>
                                </div>

                            </li>

                            <li>

                                <div>
                                    <span>
                                        3<!-- 숫자 1~20까지 for문돌려서 박아야합니다. -->
                                    </span>
                                    <a href="#"><img src="../imaages/123123.jpg"></a>

                                </div>

                                <div>
                                    <a href=""> <span>영화제목</span></a>
                                    <div>
                                        <p>예매율&nbsp<span>100.0</span>%</p>
                                        <p>개봉일&nbsp<span>2023.01.01</span></p>
                                    </div>
                                </div>

                                <div>
                                    <!-- 1좋아요버튼 -->
                                    <button>0</button>
                                    <button>예매</button>
                                </div>

                            </li>

                            <li>

                                <div>
                                    <span>
                                        4<!-- 숫자 1~20까지 for문돌려서 박아야합니다. -->
                                    </span>
                                    <a href="#"><img src="../imagaes/123123.jpg"></a>

                                </div>

                                <div>
                                    <a href=""> <span>영화제목</span></a>
                                    <div>
                                        <p>예매율&nbsp<span>100.0</span>%</p>
                                        <p>개봉일&nbsp<span>2023.01.01</span></p>
                                    </div>
                                </div>

                                <div>
                                    <!-- 1좋아요버튼 -->
                                    <button>0</button>
                                    <button>예매</button>
                                </div>

                            </li>



                        </ol>
                    </div>





                </div>
            </section>

            <!-- 세번재 섹션 이벤트리스트 3ea-->
            <section>
                <div>
                    <div>
                        <div>
                            <a>EVENT</a>

                        </div>

                        <div>
                            <div>||</div>
                            <div><a href="#">전체보기 ></a></div>
                        </div>
                    </div>

                    <div>

                        <ol>
                            <li>
                                <div>
                                    <a href="#"><img src="" alt="img"></a>
                                </div>

                                <div>
                                    <a href=""> <span>입력해주세요</span></a>
                                    <div>2023.05.17 ~ 2023.05.20</div>
                                </div>
                            </li>

                            <li>
                                <div>
                                    <a href="#"><img src="" alt="img"></a>
                                </div>

                                <div>
                                    <a href=""> <span>입력해주세요</span></a>
                                    <div>2023.05.17 ~ 2023.05.20</div>
                                </div>
                            </li>


                            <li>
                                <div>
                                    <a href="#"><img src="" alt="img"></a>
                                </div>

                                <div>
                                    <a href=""> <span>입력해주세요</span></a>
                                    <div>2023.05.17 ~ 2023.05.20</div>
                                </div>
                            </li>



                        </ol>
                    </div>



                </div>
            </section>

            <!-- 네번재 색션 관 소개-->
            <section>
                <div>

                    <div>
                        <div>
                            <a href="#">상영관안내</a>
                        </div>
                        <div><a href="#">전체보기 ></a></div>
                    </div>


                    <div>
                        <div>
                            <a href="#"><img src="" alt="이미지입니다 w548 h336"></a>
                        </div>
                        <div>
                            <!-- hover시 각각의 div에 border 생성하시면됩니다. -->
                            <a href="#">
                                <div><span>A CLASS</span> <span>#뭐하는지 모르는 클래스</span> </div>
                            </a>
                            <a href="#">
                                <div><span>B CLASS</span> <span>#여기는 무슨반인가?</span> </div>
                            </a>
                            <a href="#">
                                <div><span>C CLASS</span> <span>#아니 그전에 반이 이렇게많나?</span></div> </span>
                            </a>
                            <a href="#">
                                <div><span>D CLASS</span> <span>#킹갇제네럴 어쩌구반</span> </div>
                            </a>
                            <a href="#">
                                <div><span>E CLASS</span> <span>#호에엥 누나이쁨</span> </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 다섯번째 섹션 공지사항 등등 -->
            <section>

                <div>

                    <div>
                        <div>
                            <span>공지사항</span>
                            <span><a href="#">공지글{dkkkkkkkkkkkkkkkasdfasdfasdftprtm~~~?}</a></span>
                            <a href="">더뷰기</a>
                        </div>

                        <div>
                            <span>고객센터</span>
                            <div>
                                <p>123-4567-8901</p>
                                <span>고객센터 운영시간 ( 365일 연중무휴 )</span>
                                <span>업무시간 외 안내 가능합니다?</span>
                            </div>

                        </div>

                        <div>
                            <a href="#">FAQ</a>
                            <a href="#">1:1문의</a>
                            <a href="#">대관 / 단체 문의</a>
                        </div>
                    </div>

                    <div>

                        뭘 넣을지 몰라서 다 준비했어

                    </div>

                </div>

            </section>

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
</body>

</html>