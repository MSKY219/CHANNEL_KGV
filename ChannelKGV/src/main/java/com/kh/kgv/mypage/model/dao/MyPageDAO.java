package com.kh.kgv.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.management.model.vo.Pagination;
import com.kh.kgv.mypage.controller.MyPageController;

@Repository
public class MyPageDAO {

	private Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 현재 로그인한 회원의 암호화된 비밀번호 조회 DAO
	 * @param userNo
	 * @return encPw
	 */
	public String selectEncPw(int userNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", userNo);
	}
	
	/** 비밀번호 변경 DAO
	 * @param paramMap
	 * @return result
	 */
	public int changePw(Map<String, Object> paramMap) {
		return sqlSession.update("myPageMapper.changePw", paramMap);
	}

	/** 회원 탈퇴 DAO
	 * @param userNo
	 * @return result
	 */
	public int secession(int userNo) {
		return sqlSession.update("myPageMapper.secession", userNo);
	}

	/** 회원 정보 수정 DAO
	 * @param paramMap
	 * @return
	 */
	public int updateInfo(Map<String, Object> paramMap) {
		logger.info("뜬다 updateInfo.dao 페이지 들어왔다");
		return sqlSession.update("myPageMapper.updateInfo", paramMap);
	}

	/** usermtmlist count 조회
	 * @param userNo
	 * @return
	 */
	public int getUserMtmCount(int userNo) {
		return sqlSession.selectOne("myPageMapper.getUserMtmCount", userNo);
	}

	/** usermtmlist 목록 불러오기
	 * @param pagination
	 * @return
	 */
	public List<Mtm> getmtmlist(Pagination pagination, int userNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPageMapper.getmtmlist", userNo, rowBounds);
	}

	/** userlostlist count 불러오기
	 * @param userNo
	 * @return
	 */
	public int getUserLostCount(int userNo) {
		return sqlSession.selectOne("myPageMapper.getUserLostCount", userNo);
	}

	/** 일어버린 물건 리스트 불러오기 and 페이지네이션
	 * @param pagination
	 * @param userNo
	 * @return
	 */
	public List<Mtm> getlostlist(Pagination pagination, int userNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("myPageMapper.getlostlist", userNo, rowBounds);
	}

	/** 리뷰 불러오기 DAO
	 * @param loadedCards
	 * @param cardsPerLoad
	 * @return
	 */
	public List<Review> loadReviewCards(Map<String, Object> paramMap) {
		logger.info("review:::dao 실행");
		return sqlSession.selectList("myPageMapper.loadReviewCards", paramMap);
	}
	
	/** 리뷰 카드 삭제!
	 * @param revNo
	 * @return
	 */
	public int reviewDelete(int revNo) {
		return sqlSession.update("myPageMapper.reviewDelete", revNo);
	}

	/** 내 영화 카드 불러오기 DAO
	 * @param paramMap
	 * @return
	 */
	public List<Review> loadMovieCards(Map<String, Object> paramMap) {
		logger.info("cards movie:::dao 실행");
		return sqlSession.selectList("myPageMapper.loadMovieCards", paramMap);
	}

	/** 내 영화 카드 삭제 DAO
	 * @param bookNo
	 * @return
	 */
	public int deleteBook(int bookNo) {
		return sqlSession.update("myPageMapper.deleteBook", bookNo);
	}
	
}
