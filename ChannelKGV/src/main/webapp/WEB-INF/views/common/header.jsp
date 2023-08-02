<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
         <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ page session="false" %>

               <header>
                  <section>
                     <div class="logo-section">
                        <div>
                           <a id="mainLogo" href="${contextPath}"><img src="${contextPath}/resources/images/logo/logo.png" alt="logo"></a>
                        </div>
                        <span>KHTHEATER</span>
                     </div>

                     <div class="memberInfo_wrap">

                        <%-- 로그인이 되어있지 않은 경우 --%>
                           <c:if test="${empty loginUser.userNo}">
                              <ul>
                                 <div>
                                    <img src="" alt="">
                                 </div>
                                 <!-- <li><a href="${contextPath}/myPage/myPgMain"> <span><img
                                             src="${contextPath}/resources/images/headerPng/test3.png" alt=""></span>
                                       <span>MY KGV</span>
                                    </a></li> -->
                                 <li><a href="${contextPath}/user/login"> <!-- <a href="#"   id="loginButton"> -->
                                       <span><img src="${contextPath}/resources/images/headerPng/test.png" alt=""></span>
                                       <span>로그인</span>
                                    </a></li>
                                 <li><a href="${contextPath}/signUp/signUp_sns"> <span><img src="${contextPath}/resources/images/headerPng/test2.png" alt=""></span>
                                       <span>회원가입</span>
                                    </a></li>

                                 <li><a href="${contextPath}/helpDesk/helpDesk_home"> <span><img src="${contextPath}/resources/images/headerPng/test5.png" alt=""></span>
                                       <span>고객센터</span>
                                    </a></li>

                              </ul>
                           </c:if>

                           <%-- 로그인이 되어있는 경우 --%>
                              <%-- <c:if test="${!empty sessionScope.loginUser}"> --%>
                                 <c:if test="${not empty loginUser.userNo}">
                                    <ul>
                                       <div>
                                          <img src="" alt="">
                                       </div>
                                       <!-- <li style="visibility: hidden"><a href="${contextPath}/user/login"> <span><img
                                                   src="${contextPath}/resources/images/headerPng/test.png"
                                                   alt=""></span>
                                             <span>로그인</span>
                                          </a></li> -->
                                       <li><a href="${contextPath}/user/logout"> <span><img src="${contextPath}/resources/images/headerPng/logout1.png" alt=""></span> <span>로그아웃</span>
                                          </a></li>
                                       <li><a href="${contextPath}/myPage/myPgMain"> <span><img src="${contextPath}/resources/images/headerPng/test3.png" alt=""></span>
                                             <span>MY KGV</span>
                                          </a></li>
                                       <li><a href="${contextPath}/helpDesk/helpDesk_home"> <span><img src="${contextPath}/resources/images/headerPng/test5.png" alt=""></span>
                                             <span>고객센터</span>
                                          </a></li>
                                       <c:choose>
                                          <c:when test="${loginUser.userManagerSt eq 'Y'}">
                                             <li><a href="${contextPath}/manager/main"> <span><img src="${contextPath}/resources/images/headerPng/gear.png" alt=""></span>
                                                   <span>판리자페이지</span>
                                                </a></li>
                                          </c:when>
                                          <c:otherwise>
                                             <li style="display: none"><a href="${contextPath}/manager/main"> <span><i class="fa-sharp fa-solid fa-gear"></i></span>
                                                   <span>판리자페이지</span>
                                                </a></li>
                                          </c:otherwise>
                                       </c:choose>
                                    </ul>
                                 </c:if>
                     </div>
                     <div class="go_top_area">
                        <div><a><img src="${contextPath}/resources/images/headerPng/toparrow2.png" alt=""></a><a href="${contextPath}/reserve/choicePlay">예매하기</a></div>
                     </div>
                  </section>

                  <!-- nav bar-->
                  <nav>
                     <div>
                        <ul>
                           <li class="navBar"><a href="${contextPath}/movieList/detail_List">영화</a>
                              <ul class="menuBar" style="display: none">
                                 <li><a href="${contextPath}/movieList/detail_List">상영 영화</a></li>
                                 <li><a href="${contextPath}/movieList/all_List">전체 영화</a></li>
                              </ul>
                           </li>
                           <li class="navBar"><a href="${contextPath}/theater/normalTheater">상영관</a>
                              <ul class="menuBar" style="display: none">
                                 <!-- 지역별로 이동 -->
                                 <li><a href="${contextPath}/theater/normalTheater">지역별</a></li>
                                 <li><a href="${contextPath}/theater/specialTheater">특별관</a></li>
                              </ul>
                           </li>
                           <li class="navBar"><a href="${contextPath}/reserve/choicePlay">예매</a>
                              <ul class="menuBar" style="display: none">
                                 <li><a href="${contextPath}/reserve/choicePlay">빠른 예매</a></li>
                              </ul>
                           </li>

                           <li class="navBar"><a href="${contextPath}/eventList/detail_List">이벤트</a>
                              <ul class="menuBar" style="display: none">
                                 <li><a href="${contextPath}/eventList/detail_List">진행
                                       이벤트</a></li>
                                 <li><a href="${contextPath}/eventList/end_List">지난 이벤트</a></li>
                              </ul>
                           </li>

                           <li class="navBar"><a href="${contextPath}/benefitsList/benefits_detail_List">혜택</a>
                              <ul class="menuBar" style="display: none">
                                 <li><a href="${contextPath}/benefitsList/benefits_detail_List">진행 혜택</a></li>
                                 <li><a href="${contextPath}/benefitsList/benefits_end_List">지난 혜택</a></li>
                              </ul>
                           </li>
                           <li class="navBar"><a href="${contextPath}/store/storeMain">스토어</a></li>

                        </ul>
                        <div class="dummy" style="display: none"></div>
                        <div>
                           <form action="${contextPath}/movieList/all_List" class="search-areaa">
                              <input type="text" placeholder="아 영화 재밌는거 없나" name="hkeyword">
                              <button id="submitBTN">
                                 <img src="${contextPath}/resources/images/headerPng/glasses.png" alt="">
                              </button>
                           </form>
                        </div>
                     </div>
                  </nav>

                  <script src="${contextPath}/resources/js/main/header.js"></script>


               </header>