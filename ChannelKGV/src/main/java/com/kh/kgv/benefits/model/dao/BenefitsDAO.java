package com.kh.kgv.benefits.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.login.model.dao.LoginDAO;
import com.kh.kgv.management.model.vo.Benefits;

@Repository
public class BenefitsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(BenefitsDAO.class);
	
	// 진행중인 헤택 리스트 불러오기
	public List<Benefits> getBenefitsList() {
		return sqlSession.selectList("managerMapper.getBenefitsList");
	}
	
	// 혜택 리스트 > 상세 페이지
	public Benefits selectOneBenefits(Benefits bene) {
		return sqlSession.selectOne("managerMapper.selectOneBenefits",bene);
	}

	
	
	
}
