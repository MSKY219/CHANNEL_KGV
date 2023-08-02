package com.kh.kgv.management.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.management.model.dao.ManageEventDAO;
import com.kh.kgv.management.model.vo.Event;

@Service
public class ManageEventServiceImpl implements ManageEventService{
	
	@Autowired
	private ManageEventDAO dao;
	
	// 이벤트 추가
	@Override
	public int addEvent(Event event) {
		return dao.addEvent(event);
	}


	
}
