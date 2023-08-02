package com.kh.kgv.reserve.model.service;

import java.util.List;
import java.util.Map;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.store.model.vo.StoreCoupon;

public interface PayService {
	
	// 예매금액 찾기
	String serchPrice(int bookNo);
	
	// 관람권 코드 검색
	List<StoreCoupon> selectCoupon(String couponNo);
	
	// 관람권 상태 변경 
	int updateTicketStatus(String couponNo);
	
	// 좌석 수 확인
	int checkSeatCount(int bookNo);
	
	// 쿠폰 카테고리 검색
	String serchCategory(String couponNo);
	
	// 예매내역 테이블 정보 저장
	int successPayment(int bookNo, String reserveCodeNo);

	// 예매내역 정보 찾아오기
	String serchPayOrder(int bookNo);
	
	// PLAY_NO 얻어오기
	JoinPlay getUserPlayByBookNo(int bookNo);
	
	// Book 
	Book serchBook(int bookNo);
	
	// book 상태 변경
	int changeSt(int bookNo);
	
	
	

}
