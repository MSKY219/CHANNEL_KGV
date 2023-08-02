package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CinemaPrice {
	//  가격 테이블
	private int priceNo;
	private String screenStyle;
	private String priceDay;
	private String priceTime;
	private String priceTeen;
	private String priceNormal;
	private String priceElder;
	private String priceSpecial;
	private String priceCouple;
}
