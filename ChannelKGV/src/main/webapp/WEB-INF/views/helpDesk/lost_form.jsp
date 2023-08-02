<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>분실물 문의 작성</title>

<script src="https://kit.fontawesome.com/dc6e43e0ad.js"
	crossorigin="anonymous"></script>


<!-- jQuery 라이브러리 추가(CDN) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
 

<link rel="stylesheet"
	href="${contextPath}/resources/css/common/outline.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/helpDesk/lost_form.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/notice_Aside.css">
	<script src="${contextPath}/resources/js/helpDesk/lost.js"></script>


</head>

<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<main>
			<section>

				<jsp:include page="/WEB-INF/views/common/noticeAside.jsp" />


				<div class="container">
					<div class="content-wrap">

						<h2>분실물 신고</h2>

						<div class="notice-contents content_inner">
							<table class="innerTable">
								<tr>
									<th>제목</th>
									<td><input id="titleInput" type="text"
										placeholder=" 제목을 입력해 주세요." value="${lost.lostTitle}"></td>
								</tr>
								<tr>
									<th>물품</th>
									<td><input id="lostItem" type="text"
										placeholder=" 잃어버린 물품에 대해 입력해 주세요." value="${lost.lostItem}"></td>
								</tr>
								<tr>
									<th>위치</th>
										<td><select id="lostArea">
											<option disabled selected>분실한 극장을 선택해주세요</option>
											
											<c:choose>
											<c:when test="${empty cinemaList.cinemaList}">
												<tr>
													<th colspan="3">영화관이 존재하지 않습니다.</th>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="cinemaList"	items="${cinemaList.cinemaList}">

												<option value="[${cinemaList.cinemaArea}]${cinemaList.cinemaName}점">[${cinemaList.cinemaArea}]${cinemaList.cinemaName}점</option>
													
												</c:forEach>
											</c:otherwise>
										</c:choose>




										</select></td>
								</tr>
								<tr>
									<th>날짜</th>
									<td><input id="lostDate" type="date"
										placeholder=" 잃어버린 날짜를 입력해 주세요." class="dateBtn"
										onfocus="this.showPicker()" value="${lost.lostDate}"></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td><input type="file" id="fileInput" class="align_File"
										name="file"></td>
								</tr>
								<tr class="label_box">
									<th>공개여부</th>
									<td class="label_box "><label for="checkbox1" class=""> <input
											type="hidden" name="open" value=1111> <input
											type="checkbox" id="checkbox1" name="open" value=0>
									</label>
									<span id="openStatus">비공개 상태입니다.</span> 
									</td>
								</tr>
							
							</table>
						</div>

					

						<div id="writeForm">
							<div class="inner_Textarea_Title">상세 내용</div>
							<textarea id="contentTextarea" class="inner_Textarea"
								placeholder="잃어버리신 물건의 이름, 크기, 색상 등을 자세하게 설명해 주세요.">${lost.lostContent}</textarea>
						</div>

						<div class="addfileList">
							<c:choose>
								<c:when test="${not empty lost.lostFile}">
									<div class="upimgList">
										<span class="deleteImage">X</span>
										<img src="${lost.lostFile}">
									</div>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>


						<div class="btn_wraper">
							<c:choose>
										<c:when test="${empty lost.lostNo}">
											<button id="registLost">
												<a>작성하기</a>
											</button>
										</c:when>
										<c:otherwise>
											<button id="updateButton">
												<a>수정하기</a>
											</button>
										</c:otherwise>
									</c:choose>
							<button><a href="${contextPath}/helpDesk/lost_List">돌아가기</a></button>
						</div>
						<input type="hidden" id="lostNo" value="${lost.lostNo}">
					</div>

				</div>

			</section>
		</main>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />



</body>

</html>