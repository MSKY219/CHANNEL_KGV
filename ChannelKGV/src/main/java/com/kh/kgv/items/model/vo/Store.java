package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Store {
	
	private int storeNo;
	private String storeCategory;
	private String storeName;
	private int storePrice;
	private String storeImage;
	private String storeDesc;
	private int storeStock;
	private String storeImageBig;
	

}
