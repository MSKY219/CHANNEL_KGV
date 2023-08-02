package com.kh.kgv.management.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.management.model.vo.Event;

@Repository
public class ManageEventDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int addEvent(Event event) {
		return sqlSession.insert("managerMapper.addEvent", event);
	}

}
