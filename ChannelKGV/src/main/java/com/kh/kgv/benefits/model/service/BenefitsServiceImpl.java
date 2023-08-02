package com.kh.kgv.benefits.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.benefits.model.dao.BenefitsDAO;
import com.kh.kgv.login.model.service.LoginServiceImpl;
import com.kh.kgv.management.model.vo.Benefits;

@Service
public class BenefitsServiceImpl implements BenefitsService{
	
	@Autowired
	private BenefitsDAO dao;
	
	
	// 진행중인 혜택 리스트 불러오기
	@Override
	public Map<String, Object> getBenefitsList() {
		
		List<Benefits> BenefitsList = dao.getBenefitsList();
		
		Map<String, Object> getBenefitsList = new HashMap<String, Object>();
		getBenefitsList.put("getBenefitsList", BenefitsList);
		
		
		return getBenefitsList;
	}
	
	// 혜택 리스트 > 상세 페이지
	@Override
	public Benefits selectOneBenefits(Benefits bene) {

		return dao.selectOneBenefits(bene);
	}

	
	
	
	
	
	
	
	
}
