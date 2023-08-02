package com.kh.kgv.management.model.service;

import com.kh.kgv.items.model.vo.Store;

public interface ManageStoreService {

	int NameDupCheck(String storeName);

	int addStore(Store store);

}
