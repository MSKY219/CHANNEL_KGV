package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class DailyWatch {
	//  일일 관람객 수 테이블
	private int deNo;
	private String deDate;
	private String deIp;
	private int deCount;
	private String deDateStr;
}
