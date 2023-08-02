package com.kh.kgv.main.controller.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.main.controller.model.dao.EnterCheckDAO;
import com.kh.kgv.management.model.vo.DailyEnter;

@Service
public class EnterCheckServiceImpl implements EnterCheckService{

	@Autowired
	private EnterCheckDAO dao;

	@Override
	public int inputEnter(DailyEnter de) {
		return dao.inputEnter(de);
	}
	
	
}
