<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ page session="false" %>

					<div id="myModal" class="modal">
						<div class="modal-content">
							<div class="close-button">&times;</div>
							<iframe src="${contextPath}/user/login" frameborder="0" width="500px"
								height="500px"></iframe>
						</div>
					</div>