<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호찾기 페이지</title>

<link rel="stylesheet"	href="${contextPath}/resources/css/common/outline.css">
<link rel="stylesheet" href="${contextPath}/resources/css/login/find_Pw_Email_2.css">
<script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
							integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
							crossorigin="anonymous"></script>

</head>

<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!-- <main>
            <h1>
                
            </h1>

            <div>
                <div>
                    <p>아이디/비밀번호 찾기</p>
                    <div>
                        <ul>
                            <li>
                                <a href="findEmail">아이디 찾기</a>
                            </li>
                            <li>
                                <a href="findPw">비밀번호 찾기</a>
                            </li>
                        </ul>
                        <h3>※ 찾으려고하는 비밀번호의 이름 생년월일 이메일을 기입해주세요</h3>
                        <div>
                            <table>
                                <caption></caption>
                                <colgroup></colgroup>
                                <tbody>
                                    <tr>
                                        <th>이름</th>
                                        <td><input type="text" placeholder="이름" name="userName" id="userName"></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td><input type="text" placeholder="생년월일 (ex:19920517)" name="userBirth" id="userBirth"></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>
                                            <input type="text" placeholder="이메일" name="userEmail" id="userEmail">
                                            <button id="sendBtn">인증요청</button>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <th>인증번호</th>
                                        <td>
                                            <input type="text" placeholder="인증번호" name="cNumber" id="cNumber">
                                        
                                            <span class="signUp-message" id="cMessage"></span>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        
                        <div>
                        	<button id="cBtn" onclick="location.href='pwChange'">인증완료</button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main> -->


        <div class="cont_wrap">
            <div class="user-info">
                <div class="img_wrap">
                    <a id="mainLogo" href="${contextPath}">
                    <img src="${contextPath}/resources/images/logo/logo.png" alt="logo"></a>
                </div>
                <div class="find_wrap">
                    <p>아이디 / 비밀번호 찾기</p>
                    <div class="fidpw">
                        <a  href="findEmail" class="fid">아이디찾기</a>
                        <a  href="findPw" class="fpw">비밀번호찾기</a>
                    </div>
                    <span>간편찾기</span>

                    <div class="input-infowrap">
                        <div class="iifpdiv">
                            <p>이름</p>
                            <div>
                            	<input type="text" placeholder="이름" name="userName" id="userName">
                            </div>
                        </div>
                        <div class="iifpdiv">
                            <p>생년월일</p>
                            <div>
                            	<input type="text" placeholder="생년월일 (ex:19920517)" name="userBirth" id="userBirth">
                            </div>
                        </div>
                        <div class="iifpdiv">
                            <p>이메일</p>
                            <div>
                            	<input type="text" placeholder="이메일" name="userEmail" id="userEmail"></div>
                            	<span id="sendBtn">인증하기</span>
                        	</div>
                        <div class="iifpdiv">
                            <p>인증번호</p>
                            <div>
                            	<input type="text" placeholder="인증번호" name="cNumber" id="cNumber"> 
                            
                            </div>
                            <p class="signUp-message"  id="cMessage" ></p>
                        </div>
                        
                        <p class="pnbalert">※ 인증이 어려울 경우 고객센터를 통하여 찾기를 진행 해 주시기 바랍니다.</p>
 
	                    <button id="cBtn" onclick="goChangPw()">비밀번호 찾기</button>
                    </div>
                </div>
            </div>
        </div>

	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="${contextPath}/resources/js/login/findPw.js"></script>
</body>

</html>