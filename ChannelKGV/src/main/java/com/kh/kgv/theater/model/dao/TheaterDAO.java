package com.kh.kgv.theater.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.theater.model.vo.Screen;

@Repository
public class TheaterDAO {
    @Autowired
	private SqlSessionTemplate sqlSession;

	public List<Screen> getScreenInfo(String special) {
		
		return sqlSession.selectList("movieMapper.getScreenInfo",special);
	}

	public List<Movie> randomMovie(String special) {

		return sqlSession.selectList("movieMapper.randomMovie", special);
	}

}