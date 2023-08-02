package com.kh.kgv.management.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.items.model.vo.Store;

@Repository
public class ManageStoreDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int NameDupCheck(String storeName) {
		return sqlSession.selectOne("storeMapper.NameDupCheck", storeName );
		
	}

	public int addStore(Store store) {
		 return sqlSession.insert("storeMapper.addStore", store);
	}

	
}
