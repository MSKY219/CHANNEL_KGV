package com.kh.kgv.store.model.vo;




import com.kh.kgv.items.model.vo.Store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinStore {
	private Store store;
	
	
	private StoreOrder storeOrder;
	private StoreCoupon storeCoupon;
	
	
}
