package com.kh.kgv.benefits.model.service;

import java.util.Map;

import com.kh.kgv.management.model.vo.Benefits;

public interface BenefitsService {
	
	// 진행중인 혜택 리스트 불러오기
	Map<String, Object> getBenefitsList();
	
	// 혜택 리스트 > 상세 페이지
	Benefits selectOneBenefits(Benefits bene);

}
