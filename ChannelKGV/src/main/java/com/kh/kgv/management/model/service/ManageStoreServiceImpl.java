package com.kh.kgv.management.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.management.model.dao.ManageStoreDAO;



@Service
public class ManageStoreServiceImpl implements ManageStoreService{
	
	@Autowired
	private ManageStoreDAO dao;

	@Override
	public int NameDupCheck(String storeName) {
		
		return dao.NameDupCheck(storeName);
	}

	@Override
	public int addStore(Store store) {
		return dao.addStore(store);
		
	}

}
