package com.kh.kgv.store.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.store.model.vo.JoinStore;
import com.kh.kgv.store.model.vo.StoreCoupon;
import com.kh.kgv.store.model.vo.StoreOrder;

@Repository
public class StoreDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Store> getStoreList() {
		return sqlSession.selectList("storeMapper.getStoreList");
	}

	public Store getStoreDetail(Store store) {
		return sqlSession.selectOne("storeMapper.getStoreDetail", store);
	}

	public int successPayment(StoreOrder storeOrder) {
		return sqlSession.insert("storeMapper.successPayment" ,storeOrder);
	}

	public void insertStoreCoupon(StoreCoupon storeCoupon) {
		 sqlSession.insert("storeMapper.insertStoreCoupon" ,storeCoupon);
		
	}

	

	public List<Store> getstoreList(int sorderNo) {
		return sqlSession.selectList("storeMapper.getstoreList",sorderNo);
	}

	public List<StoreOrder> getstoreOrderList(int sorderNo) {
		return sqlSession.selectList("storeMapper.getstoreOrderList",sorderNo);
	}

	public List<StoreCoupon> getstoreCouponList(int sorderNo) {
		return sqlSession.selectList("storeMapper.getstoreCouponList",sorderNo);
	}

	
	

	


	

	

}
