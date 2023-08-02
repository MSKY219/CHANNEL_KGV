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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script src="${contextPath}/resources/js/login/findEmail.js"></script>
</body>

</html>