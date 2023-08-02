package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class SeatPrice {
	//  좌석 가격 테이블
	private int spNo;
	private String spTitle;
	private int spRate;
}
