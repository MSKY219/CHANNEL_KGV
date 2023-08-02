package com.kh.kgv.main.controller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.management.model.vo.DailyEnter;

@Repository
public class EnterCheckDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int inputEnter(DailyEnter de) {
		return sqlSession.insert("enterMapper.inputEnter", de);
	}

}
