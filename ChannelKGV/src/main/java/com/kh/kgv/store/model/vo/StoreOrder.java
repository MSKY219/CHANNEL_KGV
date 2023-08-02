package com.kh.kgv.store.model.vo;

import com.kh.kgv.items.model.vo.Store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreOrder {
	private int sorderNo;
	private String orderDetailNo;
	private int orderCount;
	private int orderPrice;
	private String orderDate;
	private String orderSt;
	private String orderDelete;
	private String userEmail;
	private String userName;
	private String storeName;
	private int storeNo;
	private String imp_uid;
	
	
	
}
