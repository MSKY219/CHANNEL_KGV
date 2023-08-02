package com.kh.kgv.movieList.model.service;

import java.util.List;
import java.util.Map;

import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.items.model.vo.Movie;

public interface MovieService {

	// 메인페이지 -> 영화 -> 상영중인영화 이동 시 영화 목록 조회
	Map<String, Object> movieList();

	// 메인 상영중인 영화 목록 가지고 오기 - 6개
	Map<String, Object> mainMovieList();

	// 관리자 페이지 상영 조회
	Map<String, Object> managerMovieList(int cp);

	// 관리자 상영 종료된 목록 조회
	Map<String, Object> managerMovieListEnd(int cp);

	// 리뷰카운트
	int getCountReviews(int movieNo);

	// 리뷰리스트
	Map<String, Object> getReviewList(int movieNo, int cp);

	int addReview(Review review);

	int deleteReview(int revNo);

	// 평점, 별점 service
	double allLike(int movieNo);

	// 예매율 service
	double allBook(int movieNo);

	Map<String, Object> searchMovieList( String keyword);

	int countMyReview(int movieNo, int userNo);




}
