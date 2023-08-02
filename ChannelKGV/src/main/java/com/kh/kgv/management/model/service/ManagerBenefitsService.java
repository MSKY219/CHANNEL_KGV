package com.kh.kgv.management.model.service;

import com.kh.kgv.management.model.vo.Benefits;

public interface ManagerBenefitsService {
	
	
	/** 혜택 등록 서비스
	 * @param bene
	 * @return
	 */
	int addBenefits(Benefits bene);

}
