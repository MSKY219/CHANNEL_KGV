package com.kh.kgv.movieList.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.common.Util;
import com.kh.kgv.customer.model.vo.Review;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.helpDesk.model.vo.QuestPagenation;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.management.model.vo.Pagination;
import com.kh.kgv.movieList.model.dao.MovieDAO;
import com.kh.kgv.movieList.model.vo.ReviewPagenation;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieDAO dao;
	
//	메인페이지 -> 영화 -> 상영중인영화 이동 시 영화 목록 조회
	@Override
	public Map<String, Object> movieList() {
		
		List<Movie> movielist = dao.movieList();
		// movielist에서 따온 값 가공하기
	    List<Movie> cleanedList = new ArrayList<>();
	    	for (Movie movie : movielist) {
	    		Movie cleanedMovie = new Movie();
	    		cleanedMovie.setMgNo(Util.removeQuotes(movie.getMgNo()));
	    		cleanedMovie.setGenreName(Util.removeQuotes(movie.getGenreName()));
	    		cleanedMovie.setMovieNo(movie.getMovieNo());
	    		cleanedMovie.setMovieRuntime(movie.getMovieRuntime());
	    		cleanedMovie.setMovieTitle(movie.getMovieTitle());
	    		cleanedMovie.setMovieNation(movie.getMovieNation());
	    		cleanedMovie.setMovieOpen(movie.getMovieOpen());
	    		cleanedMovie.setMovieContent(movie.getMovieContent());
	    		cleanedMovie.setMovieImg1(movie.getMovieImg1());
	    		cleanedMovie.setMovieImg2(movie.getMovieImg2());
	    		cleanedMovie.setMovieImg3(movie.getMovieImg3());
	    		cleanedMovie.setMovieImg4(movie.getMovieImg4());
	    		cleanedMovie.setMovieImg5(movie.getMovieImg5());
	    		cleanedMovie.setMovieImg6(movie.getMovieImg6());
	    		cleanedMovie.setMovieUploader(movie.getMovieUploader());
	    		cleanedMovie.setMovieDirector(movie.getMovieDirector());
	    		cleanedMovie.setMovieCast(movie.getMovieCast());
	    		cleanedMovie.setMovieRegdate(movie.getMovieRegdate());
	    		cleanedMovie.setMovieSt(movie.getMovieSt());
	    		cleanedMovie.setMoviePlayed(movie.getMoviePlayed());
	    		cleanedMovie.setMovieWatched(movie.getMovieWatched());
	        
	    		cleanedList.add(cleanedMovie);
	    	}
	    	Map<String, Object> getMovieList = new HashMap<String, Object>();
	    	getMovieList.put("cleanedList", cleanedList);
		
		return getMovieList;
	}

	// 메인 상영중인 영화 목록 가지고 오기 - 6개
	@Override
	public Map<String, Object> mainMovieList() {
		List<Movie> movielist = dao.mainMovieList();
		// movielist에서 따온 값 가공하기
	    List<Movie> cleanedList = new ArrayList<>();
	    	for (Movie movie : movielist) {
	    		Movie cleanedMovie = new Movie();
	    		cleanedMovie.setMgNo(Util.removeQuotes(movie.getMgNo()));
	    		cleanedMovie.setGenreName(Util.removeQuotes(movie.getGenreName()));
	    		cleanedMovie.setMovieNo(movie.getMovieNo());
	    		cleanedMovie.setMovieRuntime(movie.getMovieRuntime());
	    		cleanedMovie.setMovieTitle(movie.getMovieTitle());
	    		cleanedMovie.setMovieNation(movie.getMovieNation());
	    		cleanedMovie.setMovieOpen(movie.getMovieOpen());
	    		cleanedMovie.setMovieContent(movie.getMovieContent());
	    		cleanedMovie.setMovieImg1(movie.getMovieImg1());
	    		cleanedMovie.setMovieImg2(movie.getMovieImg2());
	    		cleanedMovie.setMovieImg3(movie.getMovieImg3());
	    		cleanedMovie.setMovieImg4(movie.getMovieImg4());
	    		cleanedMovie.setMovieImg5(movie.getMovieImg5());
	    		cleanedMovie.setMovieImg6(movie.getMovieImg6());
	    		cleanedMovie.setMovieUploader(movie.getMovieUploader());
	    		cleanedMovie.setMovieDirector(movie.getMovieDirector());
	    		cleanedMovie.setMovieCast(movie.getMovieCast());
	    		cleanedMovie.setMovieRegdate(movie.getMovieRegdate());
	    		cleanedMovie.setMovieSt(movie.getMovieSt());
	    		cleanedMovie.setMoviePlayed(movie.getMoviePlayed());
	    		cleanedMovie.setMovieWatched(movie.getMovieWatched());
	        
	    		cleanedList.add(cleanedMovie);
	    	}
	    	Map<String, Object> getMovieList = new HashMap<String, Object>();
	    	getMovieList.put("cleanedList", cleanedList);
		
		return getMovieList;
	}
	
	// 관리자 페이지 상영 조회
	@Override
	public Map<String, Object> managerMovieList(int cp) {
		// 현재 상영중인 영화 수 조회
		int cinemaCount = dao.getNowPlayCount();

		// 조회한 현재 상영중인 영화 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, cinemaCount);

		// 상영중인 영화 리스트 조회
		List<JoinPlay> playMovieList = dao.getPlayList(pagination);
		
		Map<String, Object> getMovieList = new HashMap<String, Object>();
		getMovieList.put("pagination", pagination);
		getMovieList.put("playMovieList", playMovieList);
		
		return getMovieList;
	}
	
	// 관리자_상영영화 종료 목록 이동
	@Override
	public Map<String, Object> managerMovieListEnd(int cp) {
		// 현재 상영중인 영화 수 조회
				int cinemaCount = dao.getEndPlayCount();

				// 조회한 현재 상영중인 영화 수를 pagination 에 담기
				Pagination pagination = new Pagination(cp, cinemaCount);

				// 상영중인 영화 리스트 조회
				List<JoinPlay> playMovieList = dao.getPlayEndList(pagination);
				
				Map<String, Object> getMovieList = new HashMap<String, Object>();
				getMovieList.put("pagination", pagination);
				getMovieList.put("playMovieList", playMovieList);
				
				return getMovieList;
	}

	@Override
	public int getCountReviews(int movieNo) {
		return dao.getCountReviews(movieNo);
	}
	


	@Override
	public Map<String, Object> getReviewList(int movieNo, int cp) {
		
		int countList = dao.getCountReviews(movieNo);
		ReviewPagenation pagination = new ReviewPagenation(cp, countList);

		List<Mtm> reviewList = dao.getReviewList(pagination, movieNo);

		Map<String, Object> getReviewList = new HashMap<String, Object>();
		getReviewList.put("pagination", pagination);
		getReviewList.put("reviewList", reviewList);

		
		
		return getReviewList;
		
		
		
	}

	@Override
	public int addReview(Review review) {
		return dao.addReview(review);
	}

	@Override
	public int deleteReview(int revNo) {
		return dao.deleteReview(revNo);
	}

	// 별점 기능 serviceImpl
	@Override
	public double allLike(int movieNo) {
		return dao.allLike(movieNo);
	}

	// 예매율 기능 serviceImpl
	@Override
	public double allBook(int movieNo) {
		return dao.allBook(movieNo);
	}

	@Override
	public Map<String, Object> searchMovieList(String keyword) {
		List<Movie> movielist = dao.searchMovieList(keyword);
		// movielist에서 따온 값 가공하기
	    List<Movie> cleanedList = new ArrayList<>();
	    	for (Movie movie : movielist) {
	    		Movie cleanedMovie = new Movie();
	    		cleanedMovie.setMgNo(Util.removeQuotes(movie.getMgNo()));
	    		cleanedMovie.setGenreName(Util.removeQuotes(movie.getGenreName()));
	    		cleanedMovie.setMovieNo(movie.getMovieNo());
	    		cleanedMovie.setMovieRuntime(movie.getMovieRuntime());
	    		cleanedMovie.setMovieTitle(movie.getMovieTitle());
	    		cleanedMovie.setMovieNation(movie.getMovieNation());
	    		cleanedMovie.setMovieOpen(movie.getMovieOpen());
	    		cleanedMovie.setMovieContent(movie.getMovieContent());
	    		cleanedMovie.setMovieImg1(movie.getMovieImg1());
	    		cleanedMovie.setMovieImg2(movie.getMovieImg2());
	    		cleanedMovie.setMovieImg3(movie.getMovieImg3());
	    		cleanedMovie.setMovieImg4(movie.getMovieImg4());
	    		cleanedMovie.setMovieImg5(movie.getMovieImg5());
	    		cleanedMovie.setMovieImg6(movie.getMovieImg6());
	    		cleanedMovie.setMovieUploader(movie.getMovieUploader());
	    		cleanedMovie.setMovieDirector(movie.getMovieDirector());
	    		cleanedMovie.setMovieCast(movie.getMovieCast());
	    		cleanedMovie.setMovieRegdate(movie.getMovieRegdate());
	    		cleanedMovie.setMovieSt(movie.getMovieSt());
	    		cleanedMovie.setMoviePlayed(movie.getMoviePlayed());
	    		cleanedMovie.setMovieWatched(movie.getMovieWatched());
	        
	    		cleanedList.add(cleanedMovie);
	    	}
	    	Map<String, Object> getMovieList = new HashMap<String, Object>();
	    	getMovieList.put("cleanedList", cleanedList);
		
		return getMovieList;
	}

	@Override
	public int countMyReview(int movieNo, int userNo) {
		return dao.countMyReview(movieNo, userNo);
	}




	
	
	
	
	
}
