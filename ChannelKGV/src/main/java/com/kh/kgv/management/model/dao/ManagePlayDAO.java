package com.kh.kgv.management.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Play;
import com.kh.kgv.items.model.vo.TimeCheck;
import com.kh.kgv.items.model.vo.TimeTable;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Screen;

@Repository
public class ManagePlayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 지역별 극장 리스트
	
	public List<Cinema> getAreaCinemaList(String areaName) {
		return sqlSession.selectList("cinemaMapper.getAreaCinemaList", areaName);
	}

	
	// 상영 중인 영화 리스트
	
	public List<Movie> getPlayingMovieList() {
		return sqlSession.selectList("playMapper.getPlayingMovieList");
	}

	
	// 상영시간 리스트
	
	public List<TimeTable> getTimeTableList() {
		return sqlSession.selectList("playMapper.getPlayingMovieList");
	}


	// 상영관 번호
	
	public int getScreenNo(Screen screen) {
		return sqlSession.selectOne("cinemaMapper.getScreenNo", screen);
	}

	
	// 상영 유효성 검사
	
	public List<Play> playTimeCheck(Play play) {
		return sqlSession.selectList("playMapper.playTimeCheck", play);
	}


	// 상영 등록
	
	public int enrollPlay(Play play) {
		return sqlSession.insert("playMapper.enrollPlay", play);
	}

	// 일자 중복 시, 해당하는 영화의 상영목록 중에서 가장 빠른 시작일과 가장 늦은 종료일을 가지고 돌아가기.
	public List<Play> getDupTime(TimeCheck tc) {
		return sqlSession.selectList("playMapper.getDupTime", tc);
	}

	// 상영 등록 성공 시, 영화 테이블 누적 상영횟수 추가
	public int addPlayCount(int movieNo) {
		return sqlSession.update("playMapper.addPlayCount", movieNo);
	}

	// screenName + cinemaName 으로 screenNo 구해오기
	public int screenNo(TimeCheck tc) {
		return sqlSession.selectOne("playMapper.getScreenNo", tc);
	}


}
