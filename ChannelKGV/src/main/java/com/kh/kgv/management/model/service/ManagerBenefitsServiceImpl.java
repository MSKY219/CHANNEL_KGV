package com.kh.kgv.management.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.management.model.dao.ManagerBenefitsDAO;
import com.kh.kgv.management.model.vo.Benefits;

@Service
public class ManagerBenefitsServiceImpl implements ManagerBenefitsService {
	
	@Autowired
	private ManagerBenefitsDAO dao;
	
	// 혜택 등록 서비스 구현
	@Override
	public int addBenefits(Benefits bene) {
		return dao.addBenefits(bene);
	}
	
}
