package com.kh.kgv.main.controller.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.kgv.main.controller.model.dao.EnterCheckDAO;
import com.kh.kgv.management.model.vo.DailyEnter;

public interface EnterCheckService {

	/** 접속 시, 일일 접속자 수 테이블에 값 추가용
	 * @param de 
	 * @return result
	 */
	int inputEnter(DailyEnter de);
	
	
}
