package com.kh.kgv.management.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.management.model.vo.Benefits;

@Repository
public class ManagerBenefitsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 혜택 등록 DAO
	 * @param bene
	 * @return
	 */
	public int addBenefits(Benefits bene) {
		return sqlSession.insert("managerMapper.addBenefits",bene);
	}
	
}
