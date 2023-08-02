package com.kh.kgv.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.CinemaPrice;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.management.model.vo.Screen;

@Repository
public class ReserveDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Cinema> getAreaCinemaList(String areaName) {
		return sqlSession.selectList("cinemaMapper.getAreaCinemaList", areaName);
	}

	// 상영영화 리스트 이름 순
	public List<Movie> getPlayingMovieList() {
		return sqlSession.selectList("playMapper.getPlayingMovieList");
	}
	
	// 상영영화 리스트 예매율 순
	public List<Movie> getPlayingThumbList() {
		return sqlSession.selectList("playMapper.getPlayingThumbList");
	}

	public List<JoinPlay> getTotalPlayList(Map<String, Object> condition) {
		return sqlSession.selectList("playMapper.getTotalPlayList", condition);
	}

	public List<Screen> getScreenList(String cinemaName) {
		return sqlSession.selectList("cinemaMapper.getScreenList", cinemaName);
	}

	public List<JoinPlay> getMoviePlayList(Map<String, Object> condition) {
		return sqlSession.selectList("playMapper.getMoviePlayList", condition);
	}

	public JoinPlay getUserPlay(int playNo) {
		return sqlSession.selectOne("playMapper.getUserPlay", playNo);
	}

	public int getPriceNo(Map<String, Object> condition) {
		return sqlSession.selectOne("cinemaMapper.getPriceNo", condition);
	}

	public CinemaPrice getPriceModel(int priceNo) {
		return sqlSession.selectOne("cinemaMapper.getPriceModel", priceNo);
	}

	public List<Screen> getSpecialScreenList(String type) {
		return sqlSession.selectList("cinemaMapper.getSpecialScreenList", type);
	}

	public int buyTicket(Map<String, Object> ticketMap) {
		return sqlSession.insert("playMapper.buyTicket", ticketMap);
	}

	public int updatePlaySeat(Map<String, Object> seatMap) {
		return sqlSession.update("playMapper.updatePlaySeat", seatMap);
	}

	public int getBookNo(int userNo) {
		return sqlSession.selectOne("playMapper.getBookNo", userNo);
	}

	public List<JoinPlay> getSpecialPlayList(Map<String, Object> condition) {
		return sqlSession.selectList("playMapper.getSpecialPlayList", condition);
	}

	public List<JoinPlay> getRoomPlayList(Map<String, Object> condition) {
		return sqlSession.selectList("playMapper.getRoomPlayList", condition);
	}

	public List<Book> getCanceledBookList() {
		return sqlSession.selectList("playMapper.getCanceledBookList");
	}

	public Play getSimplePlay(int playNo) {
		return sqlSession.selectOne("playMapper.getSimplePlay", playNo);
	}

	public int deleteBook() {
		return sqlSession.delete("playMapper.deleteBook");
	}

	public List<Play> getPastPlayList() {
		return sqlSession.selectList("playMapper.getPastPlayList");
	}

	public int getTotalTicket(int movieNo) {
		return sqlSession.selectOne("playMapper.getTotalTicket", movieNo);
	}

	public int updatePlaySt() {
		return sqlSession.update("playMapper.updatePlaySt");
	}

	public int updateTotalTicket(Map<String, Object> movieMap) {
		return sqlSession.update("playMapper.updateTotalTicket", movieMap);
	}

	public List<Double> getAllScore() {
		return sqlSession.selectList("playMapper.getAllScore");
	}
	
	public List<Double> getAllRate() {
		return sqlSession.selectList("playMapper.getAllRate");
	}



}
