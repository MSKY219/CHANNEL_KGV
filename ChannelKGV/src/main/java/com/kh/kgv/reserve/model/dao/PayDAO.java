package com.kh.kgv.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.store.model.vo.StoreCoupon;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 예매금액 찾기
	public String serchPrice(int bookNo) {
		return sqlSession.selectOne("playMapper.serchPrice", bookNo);
	}
	
	// 관람 쿠폰 검색
	public List<StoreCoupon> selectCoupon(String couponNo) {
		return sqlSession.selectList("playMapper.selectCoupon", couponNo);
	}
	
	// 관람권 상태 변경
	public int updateTicketStatus(Map<String, Object> CT) {
		return sqlSession.update("playMapper.updateTicketStatus",CT);
	}
	
	// 좌석 수 확인
	public String checkSeat(int bookNo) {
		return sqlSession.selectOne("playMapper.checkSeat",bookNo);
	}
	
	// 쿠폰 카테고리 검색
	public String serchCategory(String couponNo) {
		return sqlSession.selectOne("playMapper.selectCategory",couponNo);
	}
	
	// 예매내역 테이블 정보 저장
	public int successPayment(Map<String, Object> SP) {
		return sqlSession.insert("playMapper.successPayment",SP);
	}
	
	// 예매내역 정보 찾아오기
	public String serchPayOrder(int bookNo) {
		return sqlSession.selectOne("playMapper.serchPayOrder", bookNo);
	}
	
	// PLAY_NO 얻어오기
	public int getPlayNo(int bookNo) {
		return sqlSession.selectOne("playMapper.getPlayNo", bookNo);
	}
	
	// 예매정보 얻어오기
	public JoinPlay getUserPlay(int playNo) {
		
		return sqlSession.selectOne("playMapper.getUserPlay", playNo);
	}

	public Book serchBook(int bookNo) {
		return sqlSession.selectOne("playMapper.serchBook", bookNo);
	}
	
	// book 상태 변경
	public int changeSt(int bookNo) {
		return sqlSession.update("playMapper.changeSt",bookNo);
	}

	

}
