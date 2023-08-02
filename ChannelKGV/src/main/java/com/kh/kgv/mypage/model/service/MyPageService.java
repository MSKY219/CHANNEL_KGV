package com.kh.kgv.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.Mtm;

public interface MyPageService {

	// 회원 탈퇴
	int secession(User loginUser);

	// 비밀번호 변경
	int changePw(Map<String, Object> paramMap);

	// 회원 정보 변경
	int updateInfo(Map<String, Object> paramMap);

//	// review카드 불러오기
//	List<Review> myReviewList(int userNo);

	// review카드 불러오기
	List<Review> loadReviewCards(Map<String, Object> paramMap);

	// mtmList 불러오기
	Map<String, Object> mtmList(Map<String, Object> paramMap);

	// lostList 불러오기
	Map<String, Object> lostList(Map<String, Object> paramMap);

	// 리뷰 카드 삭제
	int reviewDelete(int revNo);

	// movie카드 불러오기
	List<Review> loadMovieCards(Map<String, Object> paramMap);

	// movie카드 삭제
	int deleteBook(int bookNo);
	
//	// review카드 5개씩 불러오기
//	List<Review> getReviewListInRange(Map<String, Object> paramMap);

}
