package com.kh.kgv.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreCoupon {
	private int scouponNo;
	private int sorderNo;
	private String couponDetailNo;
	private String couponSt;
}
