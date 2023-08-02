<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


    <aside>
        <div class="aside-ul-wrap">
            <ul class="aslide-list">
                <li>
                    <a href="${contextPath}/myPage/myHome">MY PAGE</a>
                </li>
                <li>
                    <a href="${contextPath}/myPage/myReview">내가 쓴 리뷰</a>
                </li>
                <li>
                    <a href="${contextPath}/myPage/myMovie">내가 본 영화</a>
                </li>
                <li>
                    <a href="${contextPath}/myPage/myMtmList">내 문의 내역</a>
                </li>
                <li>
                    <a href="${contextPath}/myPage/myLostList">내 분실물 내역</a>
                </li>
                <li>
                    <a href="${contextPath}/myPage/info">개인정보 수정</a>
                </li>
                <li>
                    <a href="${contextPath}/myPage/changePw">비밀번호 변경</a>
                </li>

            </ul>
        </div>
    </aside>
