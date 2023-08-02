<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에러페이지</title>


<link rel="stylesheet"
	href="${contextPath}/resources/css/common/outline.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/helpDesk/error.css">
 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		$(".btn_wraper button").hover(function() {
			$(this).find("a").addClass("hover");
		}, function() {
			$(this).find("a").removeClass("hover");
		});
	});
</script>

</head>

<body>
	<div id="wrap">

		<main>
			<section>


				<div class="container">

					<div class="check-area">
						<div>
						<img src="${contextPath}/resources/images/age/18age.png">
						
						</div>
						<p class="error_mess">
							미안해오..
						</p>
						<p>
						요청하신 페이지를 찾을수가없어오.. ㅠㅠ
						</p>
						<p>
						이용에 불편을 드려 정말 죄송합니다 ;ㅅ;<br>
						찾으시는 페이지는 주소가 잘못되었거나 삭제댔어얌..<br>
						찾으시는 페이지를 정확하게 입력해 주세오
						</p>


						<div class="btn_wraper">

							<button class="goback">
								<a href="${contextPath}">메인 페이지로</a>
							</button>

						</div>
					</div>


				</div>
			</section>
		</main>
	</div>


</body>

</html>