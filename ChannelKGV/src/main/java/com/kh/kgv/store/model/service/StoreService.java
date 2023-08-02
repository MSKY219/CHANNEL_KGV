package com.kh.kgv.store.model.service;

import java.util.List;
import java.util.Map;

import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.store.model.vo.JoinStore;
import com.kh.kgv.store.model.vo.StoreCoupon;
import com.kh.kgv.store.model.vo.StoreOrder;

public interface StoreService {

	Map<String, Object> getStoreMap();

	Store getStoreDetail(Store store);

	int successPayment(StoreOrder storeOrder);

	List<Store> getstoreList(int sorderNo);

	List<StoreOrder> getstoreOrderList(int sorderNo);

	List<StoreCoupon> getstoreCouponList(int sorderNo);

	

	

	



	


	
	

}
