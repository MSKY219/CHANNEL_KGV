package com.kh.kgv.movieList.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.management.model.vo.Pagination;
import com.kh.kgv.movieList.model.vo.ReviewPagenation;

@Repository
public class MovieDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;


	//	메인페이지 -> 영화 -> 상영중인영화 이동 시 영화 목록 조회
	public List<Movie> movieList() {

		return sqlSession.selectList("movieMapper.getMovieList", null);
	}

	// 메인 상영중인 영화 목록 가지고 오기 - 6개
	public List<Movie> mainMovieList() {

		return sqlSession.selectList("movieMapper.mainMovieList", null);
	}

	// 관리자 페이지 상영 수 조회
	public int getNowPlayCount() {
		return sqlSession.selectOne("movieMapper.getNowPlayCount");
	}

	// 관리자 페이지 상영 조회
	public List<JoinPlay> getPlayList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("movieMapper.getPlayList", null, rowBounds);
	}
	// 관리자_상영영화 종료 목록 수 조회
	public int getEndPlayCount() {
		return sqlSession.selectOne("movieMapper.getEndPlayCount");
	}

	// 관리자_상영영화 종료 목록 조회
	public List<JoinPlay> getPlayEndList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("movieMapper.getPlayEndList", null, rowBounds);
	}

	public int getCountReviews(int movieNo) {
		return sqlSession.selectOne("reviewMapper.getReviewCount", movieNo);
	}

	public List<Mtm> getReviewList( ReviewPagenation pagination, int movieNo) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("reviewMapper.getReviewList-mvn", movieNo, rowBounds );
	}

	public int addReview(Review review) {
		return sqlSession.insert("reviewMapper.addReview", review);
	}

	public int deleteReview(int revNo) {
		return sqlSession.update("reviewMapper.deleteReview", revNo);
	}

	// 별점 기능 DAO
	public double allLike(int movieNo) {
		Double allLike = sqlSession.selectOne("movieMapper.allLike", movieNo);
		double result = (allLike != null) ? allLike : 0.0;
		return result;
	}

	// 예매율 DAO
	public double allBook(int movieNo) {
		Double allbook = sqlSession.selectOne("movieMapper.allBook", movieNo);
		double result = (allbook != null) ? allbook : 0.0;
		return result;
	}

	public List<Movie> searchMovieList(String keyword) {
		return sqlSession.selectList("movieMapper.searchMovieList", keyword);
	}

	public int countMyReview(int movieNo, int userNo) {
		Map<String, Object> params = new HashMap<>();
		params.put("movieNo", movieNo);
		params.put("userNo", userNo);
		
		return sqlSession.selectOne("reviewMapper.countMyReview", params);
	}







}
