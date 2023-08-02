package com.kh.kgv.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.management.model.vo.Pagination;
import com.kh.kgv.mypage.controller.MyPageController;
import com.kh.kgv.mypage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService {


	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
//	/** review카드 불러오기 serviceimpl
//	 *
//	 */
//	@Override
//	public List<Review> myReviewList(int userNo) {
//		
//		List<Review> myReviewList = dao.myReviewList(userNo);
//		
//		return myReviewList;
//	}

	/** review카드 불러오기 serviceimpl
	 *
	 */
	@Override
	public List<Review> loadReviewCards(Map<String, Object> paramMap) {
		return dao.loadReviewCards(paramMap);
	}
	
	/** 리뷰 카드 삭제
	 *
	 */
	@Override
	public int reviewDelete(int revNo) {
		return dao.reviewDelete(revNo);
	}
//	/** review카드 5개 씩불러오기 serviceimpl
//	 *
//	 */
//	@Override
//	public List<Review> getReviewListInRange(Map<String, Object> paramMap) {
//		
//		List<Review> myReviewList = dao.getReviewListInRange(paramMap);
//		
//		return myReviewList;
//	}

	/** movie카드 불러오기 serviceimpl
	 *
	 */
	@Override
	public List<Review> loadMovieCards(Map<String, Object> paramMap) {
		return dao.loadMovieCards(paramMap);
	}

	/** movie카드 삭제
	 *
	 */
	@Override
	public int deleteBook(int bookNo) {
		return dao.deleteBook(bookNo);
	}

	/** 회원 비번번호 변경
	 *
	 */
	@Override
	public int changePw(Map<String, Object> paramMap) {
		
		// 1) DB에서 현재 회원의 비밀번호를 조회
		String encPw = dao.selectEncPw( (int)paramMap.get("userNo") );
		
		// 2) 입력된 현재 비밀번호(평문)와
		//	  조회된 비밀번호(암호화)를 비교(bcrypt.matches() 이용)
		
		// 3) 비교 결과가 일치하면
		//		새 비밀번호를 암호화해서 update 구문 수행
		
		if( bcrypt.matches( (String) paramMap.get("currentPw")   ,  encPw )) {
			
			paramMap.put("newPw",  bcrypt.encode( (String)paramMap.get("newPw")  ));
			// Map에 이미 같은 key가 존재하면
			// value만 덮어씌움
			
			return dao.changePw(paramMap);
			
		}
		
		// 비교 결과가 일치하지 않으면 0 반환
		// -> "현재 비밀번호가 일치하지 않습니다"
		return 0;
	}

	/** 회원 탈퇴 서비스 구현
	 *
	 */
	@Override
	public int secession(User loginUser) {
			
		// 1) DB에서 암호화된 비밀번호를 조회하여 입력받은 비밀번호와 비교
		String encPw = dao.selectEncPw( loginUser.getUserNo() );
			
		if( bcrypt.matches( loginUser.getUserPw() , encPw ) ) {
				
			// 2) 비밀번호가 일치하면 회원 번호를 이용해서 탈퇴 진행
			return dao.secession(loginUser.getUserNo());
		}
			
		// 3) 비밀번호가 일치하지 않으면 0 반환
		return 0;
	}

	/** 회원 정보 변경 서비스
	 *
	 */
	@Override
	public int updateInfo(Map<String, Object> paramMap) {
		return dao.updateInfo(paramMap);
	}

//==================================================1대1
	/** 1대1 문의 리스트 불러오기
	 *
	 */
	@Override
	public Map<String, Object> mtmList(Map<String, Object> paramMap) {

		int userNo = (int) paramMap.get("userNo");
		int cp = (int) paramMap.get("cp");
		
		
		int userMtmCount = dao.getUserMtmCount(userNo);
		
		
		Pagination pagination = new Pagination(cp, userMtmCount);
		
		List<Mtm> mtmList = dao.getmtmlist(pagination, userNo);
		
		Map<String, Object> mtmUserList = new HashMap<String, Object>();

		
		mtmUserList.put("userMtmCount", userMtmCount);
		mtmUserList.put("pagination", pagination);
		mtmUserList.put("mtmList", mtmList);
		
		return mtmUserList;
	}
	
	//================================================== 분실물
		/** 분실물 문의 리스트 불러오기
		 *
		 */
	@Override
	public Map<String, Object> lostList(Map<String, Object> paramMap) {

		int userNo = (int) paramMap.get("userNo");
		int cp = (int) paramMap.get("cp");
		
		
		int userLostCount = dao.getUserLostCount(userNo);
		
		
		Pagination pagination = new Pagination(cp, userLostCount);
		
		List<Mtm> lostList = dao.getlostlist(pagination, userNo);
		
		Map<String, Object> lostUserList = new HashMap<String, Object>();

		
		lostUserList.put("userLostCount", userLostCount);
		lostUserList.put("pagination", pagination);
		lostUserList.put("lostList", lostList);
		
		return lostUserList;
	}

	
	

	
	
	
}
