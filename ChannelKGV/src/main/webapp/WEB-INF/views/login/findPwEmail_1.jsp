<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 페이지</title>

<link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
<link rel="stylesheet" href="${contextPath}/resources/css/login/find_Pw_Email_1.css">
<script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
							integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
							crossorigin="anonymous"></script>

</head>

<body>
	<div id="wrap">
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
	<!-- <main>
		<h1></h1>
		<div>
			<div>
				<p>아이디/비밀번호 찾기</p>
				<div class="find_wrap">
					<ul>
						<li>
							<a href="findEmail">아이디 찾기</a>
						</li>
						<li>
							<a href="findPw">비밀번호 찾기</a>
						</li>
					</ul>
					<h3>※ 찾으려고하는 아이디의 이름 생년월일 이메일을 기입해주세요</h3>
					<div>
						<form action="findId" method="POST">
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
										<th>전화번호</th>
										<td>
											<input type="text" placeholder="'-' 없이 입력" name="userTel" id="userTel">
										</td>
									</tr>
								</tbody>
							</table>

							<div class="info-wrap">
								<div class="name-in-area">
									<p>이름</p> <input type="text" placeholder="이름" name="userName" id="userName">
								</div>
								<div class="birth-in-area">
									<p>생년월일</p>  <input type="text" placeholder="생년월일 (ex:19920517)" name="userBirth" id="userBirth">
								</div>
								<div class="tel-in-area">
									<p>휴대폰</p> <input type="text" placeholder="'-' 없이 입력" name="userTel" id="userTel">
								</div>
							</div>


							<div>
								<button type="submit" id="sendBtn">아이디 찾기</button>
							</div>
						</form>
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
					<form action="findId" method="POST">
						<div class="iifpdiv">
							<p>이름</p><div><input type="text" placeholder="이름" name="userName" id="userName"></div>
						</div>
						<div class="iifpdiv">
							<p>생년월일</p><div> <input type="text" placeholder="생년월일 (ex:19920517)" name="userBirth" id="userBirth"></div>
						</div>
						<div class="iifpdiv">
							<p>휴대폰 번호</p><div><input type="text" placeholder="'-' 없이 입력" name="userTel" id="userTel"></div>
						</div>

						<p class="pnbalert">※ 휴대폰 번호가 변경 된 경우 고객센터를 통하여 찾기를 진행 해 주시기 바랍니다.</p>

					   <button id="sendBtn">아이디 찾기</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script src="${contextPath}/resources/js/login/findEmail.js"></script>
</body>

</html>