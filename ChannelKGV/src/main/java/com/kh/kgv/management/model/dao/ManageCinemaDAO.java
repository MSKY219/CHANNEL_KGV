package com.kh.kgv.management.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Screen;

@Repository
public class ManageCinemaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int enrollCinema(Cinema cinema) {
		return sqlSession.insert("cinemaMapper.enrollCinema", cinema);
	}

	public int enrollScreen(Screen screen) {
		return sqlSession.insert("cinemaMapper.enrollScreen", screen);
	}

	public int cinemaDupCheck(String cinemaName) {
		return sqlSession.selectOne("cinemaMapper.cinemaDupCheck", cinemaName);
	}
	
	
	
	


}
